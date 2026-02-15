-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
-- LazyVim 默认已经把 Leader 键设为 <Space> 了，不需要重设

-- ==========================================
-- 1. 基础编辑习惯
-- ==========================================
-- 模式切换映射
map("i", "jk", "<Esc>", { desc = "退出插入模式" })
map("t", "jk", "<C-\\><C-n>", { desc = "退出终端模式" })

-- 取消高亮 (LazyVim 默认也是这个，写出来加深印象)
map("n", "<C-h>", ":nohlsearch<CR>", { desc = "清除搜索高亮" })

-- 保存与退出
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "保存文件" })
map("n", "<leader>q", "<cmd>q<cr>", { desc = "退出" })

-- 文本块移动 (Visual 模式下选中文字上下移动 - LazyVim 默认已有 Alt+j/k，但如果你习惯原生 Vim 行为可忽略)
-- 原配置中的 < 和 > 缩进保持选中
map("v", "<", "<gv", { desc = "向左缩进并保持选中" })
map("v", ">", ">gv", { desc = "向右缩进并保持选中" })

-- 粘贴不替换剪贴板
-- LazyVim 默认支持 <leader>p 进行不覆盖粘贴，这里复刻你的配置：
map("n", "x", '"_x')
map("n", "X", '"_X')
-- map("n", "<leader>p", '"+p', { desc = "从系统剪贴板粘贴" })
-- 注意：设置了 clipboard="unnamedplus" 后，p 直接就是粘贴系统剪贴板，不需要 <leader>p

-- ==========================================
-- 2. 光标与视图跳转
-- ==========================================
-- 保持光标居中
map("n", "n", "nzz")
map("n", "N", "Nzz")
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-d>", "<C-d>zz")
map("n", "G", "Gzz")

-- 快速行首行尾
-- map("n", "H", "^", { desc = "跳到行首" })
-- map("n", "L", "$", { desc = "跳到行尾" })

-- ==========================================
-- 3. 窗口分割
-- ==========================================
-- LazyVim 默认有 <leader>- 和 <leader>|，但为了适配你的习惯：
map("n", "<leader>V", ":aboveleft vsplit<CR>", { desc = "左侧分屏" })
map("n", "<leader>v", ":belowright vsplit<CR>", { desc = "右侧分屏" })
map("n", "<leader>s", ":aboveleft split<CR>", { desc = "上方分屏" })
map("n", "<leader>S", ":belowright split<CR>", { desc = "下方分屏" })

-- ==========================================
-- 4. 标签页 (Tabs) 切换
-- ==========================================
-- LazyVim 使用 bufferline (顶部栏)，你的习惯是 gt 切换 Tab
-- 如果你依然想用 Tab 页逻辑：
-- map("n", "<leader>1", "1gt", { desc = "切换到标签页 1" })
-- map("n", "<leader>2", "2gt", { desc = "切换到标签页 2" })
-- ... 以此类推
-- 但建议尝试 LazyVim 的 Buffer 切换逻辑：<S-h> (上一个 buffer) 和 <S-l> (下一个 buffer)

-- ==========================================
-- 5. DAP (Debug Adapter Protocol)
-- ==========================================
map("n", "<F5>", function() require("dap").continue() end, { desc = "调试: 继续" })
map("n", "<F10>", function() require("dap").step_over() end, { desc = "调试: 单步跳过" })
map("n", "<F11>", function() require("dap").step_into() end, { desc = "调试: 单步进入" })
map("n", "<F9>", function() require("dap").toggle_breakpoint() end, { desc = "调试: 切换断点" })
