return {
  -- 配置 Neo-tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        width = 10,
        mappings = {
          -- 还原你的 NERDTreeSmartH/L 习惯
          -- h: 如果是目录则收起，如果是文件则跳到父目录
          ["h"] = function(state)
            local node = state.tree:get_node()
            if node.type == "directory" and node:is_expanded() then
              require("neo-tree.sources.filesystem").toggle_directory(state, node)
            else
              require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
            end
          end,
          -- l: 打开文件或展开目录
          ["l"] = function(state)
            local node = state.tree:get_node()
            if node.type == "directory" then
              if not node:is_expanded() then
                require("neo-tree.sources.filesystem").toggle_directory(state, node)
              elseif node:has_children() then
                require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
              end
            else
              state.commands["open"](state)
            end
          end,
        },
      },
      filesystem = {
        filtered_items = {
          visible = true, -- 类似 NERDTreeShowHidden
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
    },
    -- 绑定快捷键 <leader>e 打开 (LazyVim 默认是 <leader>e)
    keys = {
      { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "文件资源管理器 (NeoTree)" },
    },
  },
}

