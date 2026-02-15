return {
  -- 安装 onedark 插件
  {
    "navarasu/onedark.nvim",
    opts = {
      style = "dark", -- 可选: dark, darker, cool, deep, warm, warmlight
      transparent = false, -- 如果你想要透明背景，设为 true
      term_colors = true,
      code_style = {
        comments = "italic",
        keywords = "none",
        functions = "none",
        strings = "none",
        variables = "none",
      },
    },
  },

  -- 配置 LazyVim 加载该主题
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
}