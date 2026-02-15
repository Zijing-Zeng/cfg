return {
  -- ==========================================
  -- 1. Dropbar: 顶部的面包屑导航 (保持不变，这个配置是好的)
  -- ==========================================
  {
    "Bekaboo/dropbar.nvim",
    event = "LazyFile",
    opts = function()
      return {
        bar = {
          enable = function(buf, win)
            return vim.api.nvim_win_get_config(win).relative == ""
              and vim.bo[buf].buftype == ""
          end,
        },
      }
    end,
  },

  -- ==========================================
  -- 2. Incline: 窗口右上角的悬浮状态栏 (修正报错)
  -- ==========================================
  {
    "b0o/incline.nvim",
    event = "LazyFile",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("incline").setup({
        window = {
          padding = 0,
          margin = { horizontal = 0 },
        },
        hide = {
          cursorline = false,
          focused_win = false,
          only_win = false,
        },
        ignore = {
          buftypes = "special",
          floating_wins = true,
          unlisted_buffers = true,
          filetypes = { "netrw", "toggleterm", "lazy", "mason", "noice", "notify", "snacks_dashboard" },
        },
        -- 核心修改在下面的 render 函数里
        render = function(props)
          -- [新增] 安全检查：如果 buffer 无效，直接返回 nil，不渲染
          if not vim.api.nvim_buf_is_valid(props.buf) then
            return nil
          end

          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if filename == "" then filename = "[No Name]" end
          local devicons = require("nvim-web-devicons")
          local ft_icon, ft_color = devicons.get_icon_color(filename)

          -- [修改] 这一行也加个保护，防止 bo 表报错
          local modified = vim.bo[props.buf].modified or false

          return {
            { (ft_icon or "") .. " ", guifg = ft_color, guibg = "none" },
            { filename .. " ", gui = modified and "bold,italic" or "bold" },
          }
        end,
      })
    end,
  },
  -- ==========================================
  -- 3. Lualine (保持不变)
  -- ==========================================
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.winbar = nil
    end,
  }
}