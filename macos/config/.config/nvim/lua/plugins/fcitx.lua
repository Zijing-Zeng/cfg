return {
  "h-hg/fcitx.nvim",
  config = function()
    -- 如果在 macOS 上使用 im-select，可能需要简单配置
    -- 大多数情况下默认即可工作，只要系统装了 fcitx5 或 im-select
    -- 如果无效，请确保 /usr/local/bin/im-select 或 /opt/homebrew/bin/im-select 可执行
  end,
}