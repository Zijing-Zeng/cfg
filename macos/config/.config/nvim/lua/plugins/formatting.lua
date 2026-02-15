return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", "black" }, -- Python 推荐先排序 import 再格式化
      c = { "clang-format" },
      cpp = { "clang-format" },
      sh = { "shfmt" },
    },
    -- 可以在这里配置默认格式化选项
    -- format_on_save = {
    --   timeout_ms = 500,
    --   lsp_fallback = true,
    -- },
  },
}