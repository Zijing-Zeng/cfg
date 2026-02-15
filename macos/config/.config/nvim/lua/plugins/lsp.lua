return {
  -- ==========================================
  -- 1. 配置 LSP (nvim-lspconfig)
  -- ==========================================
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- 你的 LSP 服务器设置
      servers = {
        -- C/C++ (clangd)
        clangd = {
          -- 解决 clangd 常见的编码偏移警告，并开启更多功能
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style=llvm",
          },
          keys = {
            -- 复刻你的 gs 快捷键 (切换头文件/源文件)
            { "gs", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "切换源文件/头文件 (C/C++)" },
          },
          init_options = {
            usePlaceholders = true,
            completeUnimported = true,
            clangdFileStatus = true,
          },
          capabilities = {
            offsetEncoding = { "utf-16" }, -- 强制使用 utf-16 避免警告
          },
        },
        -- Python
        pyright = {},
        -- CMake
        cmake = {},
      },
    },
  },

  -- ==========================================
  -- 2. Clangd 增强插件 (仅安装，不手动调用内部模块)
  -- ==========================================
  {
    "p00f/clangd_extensions.nvim",
    lazy = true,
    config = function() end,
    opts = {
      inlay_hints = {
        inline = false,
      },
      ast = {
        --这部分配置 AST 视图的样式
        role_icons = {
          type = "",
          declaration = "",
          expression = "",
          specifier = "",
          statement = "",
          ["template argument"] = "",
        },
        kind_icons = {
          Compound = "",
          Recovery = "",
          TranslationUnit = "",
          PackExpansion = "",
          TemplateTypeParm = "",
          TemplateTemplateParm = "",
          TemplateParamObject = "",
        },
      },
    },
  },
}