return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    -- 你的 TODO 会变成显眼的颜色图标
  },
  keys = {
    { "]t", function() require("todo-comments").jump_next() end, desc = "下一个待办" },
    { "[t", function() require("todo-comments").jump_prev() end, desc = "上一个待办" },
    -- 搜索整个工程的 TODO
    { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "搜索待办" },
  },
}