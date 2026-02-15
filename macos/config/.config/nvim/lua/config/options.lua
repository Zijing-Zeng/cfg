-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

-- ==========================================
-- 1. 编码与兼容性
-- ==========================================
-- Neovim 默认就是 utf-8，不需要像 Vim 那样繁琐设置 encoding
opt.fileencodings = { "utf-8", "ucs-bom", "gb18030", "gbk", "gb2312", "cp936" }

-- ==========================================
-- 2. 缩进与排版
-- ==========================================
opt.tabstop = 4        -- Tab 宽度
opt.softtabstop = 4
opt.shiftwidth = 4     -- 缩进宽度
opt.expandtab = true   -- 将 Tab 转为空格
opt.smartindent = true -- 智能缩进
opt.wrap = true        -- 自动折行
opt.textwidth = 120    -- 超过 120 字符换行

-- ==========================================
-- 3. 搜索与替换
-- ==========================================
opt.ignorecase = true  -- 忽略大小写
opt.smartcase = true   -- 智能大小写 (有大写字母时才敏感)
-- incsearch 和 hlsearch LazyVim 默认已开启

-- ==========================================
-- 4. 界面与光标
-- ==========================================
opt.scrolloff = 5      -- 光标距离顶部/底部的保留行数
opt.sidescrolloff = 10 -- 水平滚动保留字符
opt.relativenumber = true -- 相对行号
opt.cursorline = true  -- 高亮当前行
-- opt.colorcolumn = "80" -- 如果你需要显示 80 字符的参考线，取消注释

-- ==========================================
-- 5. 系统行为
-- ==========================================
opt.clipboard = "unnamedplus" -- 共享剪贴板 (Neovim 推荐用 unnamedplus)
opt.timeoutlen = 500          -- 快捷键延迟
opt.ttimeoutlen = 50          -- 解决 Alt 键延迟 (关键！)
opt.confirm = true            -- 退出前确认未保存的文件
opt.backup = false            -- 禁止备份
opt.swapfile = false          -- 禁止交换文件

-- ==========================================
-- 6. 折叠
-- ==========================================
-- LazyVim 使用 nvim-ufo 插件增强折叠，但如果你想保留原习惯：
opt.foldlevel = 99
opt.foldlevelstart = 99