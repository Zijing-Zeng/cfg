return {
  {
    "jpalardy/vim-slime",
    init = function()
      -- 1. 指定目标为 tmux
      vim.g.slime_target = "tmux"

      -- 2. 智能配置（关键点！）
      -- socket_name: "default" 通常是默认 socket
      -- target_pane: "{last}" 表示自动发送到你"上一次所在的那个Tmux窗格"
      -- 这样你就不用每次都手动输入 pane ID 了
      vim.g.slime_default_config = { socket_name = "default", target_pane = "{last}" }

      -- 3. 禁用默认映射（防止冲突），我们自己定义
      vim.g.slime_no_mappings = 1
    end,
    config = function()
      -- 定义快捷键：Ctrl-c Ctrl-c 发送代码段
      vim.keymap.set({"n", "x"}, "<C-c><C-c>", "<Plug>SlimeRegionSend", { desc = "发送代码到 Tmux" })
      -- 定义快捷键：Ctrl-c Ctrl-l 发送当前行
      vim.keymap.set("n", "<C-c><C-l>", "<Plug>SlimeLineSend", { desc = "发送当前行到 Tmux" })
    end,
  }
}