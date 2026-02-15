return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    opts.spec = opts.spec or {}

    -- 1. 菜单分组名称 (Group) - 汉化一级菜单
    local cn_groups = {
      mode = { "n", "v" },
      { "<leader><tab>", group = "标签页 (Tabs)" },
      { "<leader>b", group = "缓冲区 (Buffer)" },
      { "<leader>c", group = "代码操作 (Code)" },
      { "<leader>d", group = "调试 (Debug)" },
      { "<leader>f", group = "文件查找 (File)" },
      { "<leader>g", group = "Git 版本控制" },
      { "<leader>q", group = "退出/会话 (Quit)" },
      { "<leader>s", group = "搜索 (Search)" },
      { "<leader>u", group = "界面开关 (UI)" },
      { "<leader>w", group = "窗口管理 (Window)" },
      { "<leader>x", group = "诊断/错误 (X)" },

      -- g, z, [ ] 等原生前缀的分组
      { "g", group = "跳转/核心操作 (Go)" },
      { "gs", group = "包围/替换 (Surround)" }, -- 如果用了 mini.surround
      { "z", group = "折叠/拼写 (Fold)" },
      { "[", group = "上一个..." },
      { "]", group = "下一个..." },
    }

    -- 2. 具体的快捷键描述 (Desc) - 汉化具体命令
    local cn_mappings = {
      -- === <leader> 常用前缀 ===
      { "<leader><space>", desc = "查找文件 (Root)" },
      { "<leader>,", desc = "切换缓冲区" },
      { "<leader>/", desc = "全局搜索 (Grep)" },
      { "<leader>:", desc = "命令历史" },
      { "<leader>e", desc = "文件资源管理器 (NeoTree)" },

      -- === g 开头的核心操作 (Go) - 这里是你最需要的 ===
      -- LSP 跳转
      { "gd", desc = "转到定义 (Definition)" },
      { "gD", desc = "转到声明 (Declaration)" },
      { "gr", desc = "查找引用 (References)" },
      { "gI", desc = "转到实现 (Implementation)" },
      { "gy", desc = "转到类型定义 (Type)" },
      { "gl", desc = "显示当前行诊断信息" }, -- LazyVim 特有

      -- 编辑与注释
      { "gc", desc = "注释操作 (Comment)" },
      { "gcc", desc = "注释当前行" },
      { "gco", desc = "在下方插入注释" },
      { "gcO", desc = "在上方插入注释" },

      -- 大小写转换
      { "gu", desc = "转小写 (Lower)" },
      { "gU", desc = "转大写 (Upper)" },
      { "g~", desc = "切换大小写" },

      -- 文本格式化
      { "gw", desc = "格式化文本 (保留光标)" },
      { "gq", desc = "格式化选中区域" },

      -- 核心移动
      { "gg", desc = "跳至文件开头" },
      { "gf", desc = "打开光标下的文件" },
      { "gi", desc = "跳至最后插入位置" },
      { "g;", desc = "跳至上次修改位置" },
      { "g,", desc = "跳至下次修改位置" },
      { "gh", desc = "进入/查看起始位" },
      { "gl", desc = "进入/查看结束位" },
      { "gm", desc = "跳至屏幕行中间" },
      { "gv", desc = "重新选择上次区域" },

      -- 窗口/标签
      { "gt", desc = "下一个标签页" },
      { "gT", desc = "上一个标签页" },

      -- === z 开头的折叠操作 (Fold) ===
      { "za", desc = "切换折叠" },
      { "zc", desc = "关闭折叠" },
      { "zo", desc = "打开折叠" },
      { "zM", desc = "关闭所有折叠" },
      { "zR", desc = "打开所有折叠" },
      { "zz", desc = "光标置于屏幕中央" },
      { "zt", desc = "光标置于屏幕顶部" },
      { "zb", desc = "光标置于屏幕底部" },

      -- === [ ] 跳转操作 ===
      { "]b", desc = "下一个 Buffer" },
      { "[b", desc = "上一个 Buffer" },
      { "]d", desc = "下一个诊断/错误" },
      { "[d", desc = "上一个诊断/错误" },
      { "]e", desc = "下一个错误 (Error)" },
      { "[e", desc = "上一个错误 (Error)" },
      { "]w", desc = "下一个警告 (Warning)" },
      { "[w", desc = "上一个警告 (Warning)" },
      { "]t", desc = "下一个 Todo 注释" },
      { "[t", desc = "上一个 Todo 注释" },

      -- === Leader 菜单详情补充 ===
      -- 文件
      { "<leader>fb", desc = "查找缓冲区" },
      { "<leader>ff", desc = "查找文件 (Root)" },
      { "<leader>fg", desc = "查找 Git 文件" },
      { "<leader>fr", desc = "最近文件" },
      -- 缓冲
      { "<leader>bd", desc = "关闭当前 Buffer" },
      { "<leader>bo", desc = "关闭其他 Buffer" },
      -- 代码
      { "<leader>ca", desc = "代码操作 (Action)" },
      { "<leader>cf", desc = "格式化 (Format)" },
      { "<leader>cr", desc = "重命名 (Rename)" },
      { "<leader>cm", desc = "Mason 安装器" },
      -- Git
      { "<leader>gg", desc = "LazyGit (全屏)" },
      { "<leader>gs", desc = "Git 状态" },
      -- UI
      { "<leader>uw", desc = "自动换行开关" },
      { "<leader>ul", desc = "行号显示开关" },
    }

    -- 3. 合并配置
    for _, v in ipairs(cn_groups) do
      table.insert(opts.spec, v)
    end
    for _, v in ipairs(cn_mappings) do
      table.insert(opts.spec, v)
    end
  end,
}