return {
  "nvim-telescope/telescope.nvim",
  keys = {
    -- 复刻 LeaderF 的习惯
    -- 你的习惯: <leader>fs -> LeaderfFile
    { "<leader>fs", "<cmd>Telescope find_files<cr>", desc = "查找文件 (项目根目录)" },
    -- 你的习惯: <leader>fh -> LeaderfFile (当前目录/split) - 这里我们用 find_files 但指定 cwd
    { "<leader>fh", "<cmd>Telescope find_files cwd=.<cr>", desc = "查找文件 (当前目录)" },

    -- 你的习惯: <leader>fl -> LeaderfLine (搜索行)
    -- Telescope 对应的功能是 live_grep (实时搜索文本) 或 current_buffer_fuzzy_find (搜当前文件)
    { "<leader>fl", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "当前缓冲区搜索" },

    -- 你的习惯: <leader>fw -> 搜索光标下的词
    { "<leader>fw", "<cmd>Telescope grep_string<cr>", desc = "搜索光标下单词" },

    -- 你的习惯: <leader>fm -> MRU (最近文件)
    { "<leader>fm", "<cmd>Telescope oldfiles<cr>", desc = "最近打开的文件" },

    -- 你的习惯: <leader>ff -> LeaderfFunction (搜索函数)
    -- Telescope 使用 lsp_document_symbols 搜索当前文件的符号(函数/变量)
    { "<leader>ff", "<cmd>Telescope lsp_document_symbols<cr>", desc = "跳转符号" },

    -- 你的习惯: <leader>ft -> BufTag (搜索所有Buffer的tag) -> Telescope buffers
    { "<leader>ft", "<cmd>Telescope buffers<cr>", desc = "查找缓冲区" },
  },
  opts = {
    defaults = {
      layout_strategy = "horizontal",
      layout_config = { prompt_position = "top" },
      sorting_strategy = "ascending",
      winblend = 0, -- 不透明，避免背景干扰
    },
  },
}