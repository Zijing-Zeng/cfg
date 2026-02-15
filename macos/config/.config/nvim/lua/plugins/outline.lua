return {
  {
    "stevearc/aerial.nvim",
    -- 依赖项：图标和语法解析
    dependencies = {
       "nvim-treesitter/nvim-treesitter",
       "nvim-tree/nvim-web-devicons"
    },
    opts = {
      -- 1. 自动并在窗口右侧打开
      layout = {
        max_width = { 40, 0.2 },
        width = nil,
        min_width = 10,
        win_opts = {
          winblend = 0, -- 不透明
        },
        default_direction = "right", -- 打开方向：右侧
        placement = "window",
      },

      -- 2. 只有这些文件类型才启用
      filter_kind = {
        "Class", "Constructor", "Enum", "Function", "Interface", "Module",
        "Method", "Struct", "Variable", "Constant", "Macro"
      },

      -- 3. 自动调整大纲内容 (LSP 优先，Treesitter 垫底)
      backends = { "lsp", "treesitter", "markdown", "man" },

      -- 4. 这里的图标会跟随你是否安装了 Nerd Fonts 自动变化
      show_guides = true,
    },
    -- 快捷键绑定
    keys = {
      -- 按 <leader>cs (Code Structure) 开关大纲
      { "<leader>cs", "<cmd>AerialToggle<cr>", desc = "切换大纲 (Aerial)" },
      -- 按 <leader>o 也行，看你习惯
      { "<leader>o", "<cmd>AerialToggle<cr>", desc = "切换大纲 (Aerial)" },

      -- 如果你想用 Telescope 搜索当前文件的大纲
      -- 类似于 Ctrl+P，但是只搜当前文件的函数/类
      { "<leader>so", "<cmd>Telescope aerial<cr>", desc = "搜索大纲" },
    },
  }
}