return {
  {
    "mrjones2014/smart-splits.nvim",
    lazy = false, -- 必须立即加载，否则启动时按键可能没反应
    opts = {},
    keys = {
      -- 1. 窗口跳转 (Alt + hjkl) - 对应你 .vimrc 的 "导航" 部分
      { "<M-h>", function() require("smart-splits").move_cursor_left() end, desc = "向左移动焦点" },
      { "<M-j>", function() require("smart-splits").move_cursor_down() end, desc = "向下移动焦点" },
      { "<M-k>", function() require("smart-splits").move_cursor_up() end, desc = "向上移动焦点" },
      { "<M-l>", function() require("smart-splits").move_cursor_right() end, desc = "向右移动焦点" },

      -- 2. 窗口大小调整 (Alt + Shift + hjkl -> 映射为 M-H 等)
      { "<M-H>", function() require("smart-splits").resize_left() end, desc = "向左调整大小" },
      { "<M-J>", function() require("smart-splits").resize_down() end, desc = "向下调整大小" },
      { "<M-K>", function() require("smart-splits").resize_up() end, desc = "向上调整大小" },
      { "<M-L>", function() require("smart-splits").resize_right() end, desc = "向右调整大小" },

      -- 3. 窗口交换 (LazyVim 风格)
      { "<M-S-Left>", function() require("smart-splits").swap_buf_left() end, desc = "与左侧窗口交换" },
      { "<M-S-Right>", function() require("smart-splits").swap_buf_right() end, desc = "与右侧窗口交换" },
    },
  }
}