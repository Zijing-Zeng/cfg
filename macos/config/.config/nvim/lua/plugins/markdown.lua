return {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    opts = {}, -- 默认配置已经很棒了
    ft = { "markdown" },
    -- "MeanderingProgrammer/render-markdown.nvim",
    -- opts = {
    --     -- 开启反隐藏：光标移动到表格上时，自动展开源码让你编辑
    --     anti_conceal = {
    --         enabled = true,
    --         ignore = {
    --             code_background = true,
    --             sign = true,
    --         },
    --         -- 在表格行上方和下方预留几行不渲染，防止光标移动时视觉跳动
    --         above = 1,
    --         below = 1,
    --     },
    --     -- 强制使用简单的表格字符，防止乱码
    --     pipe_table = {
    --         style = "heavy", -- 试试 'full', 'normal', 'none' 看哪个顺眼
    --         cell = "padded", -- 让单元格内容不紧贴边框
    --     }
    -- }
}