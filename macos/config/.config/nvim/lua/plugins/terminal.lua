return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    size = 20,
    open_mapping = [[<c-\>]], -- 核心快捷键：Ctrl + \ 呼出/隐藏终端
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "float", -- 推荐 float (悬浮窗口) 或 horizontal (下方分屏)
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
      border = "curved",
      winblend = 0,
      highlights = {
        border = "Normal",
        background = "Normal",
      },
    },
  },
  keys = {
    -- 这是一个高级技巧：专门绑定一个快捷键运行 lazygit
    { "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", desc = "打开 Lazygit" },
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)

    -- 定义 Lazygit 的专门终端
    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

    function _lazygit_toggle()
      lazygit:toggle()
    end
  end,
}