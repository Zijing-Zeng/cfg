return {
  "Civitasv/cmake-tools.nvim",
  event = "VeryLazy",
  opts = {
    cmake_command = "cmake",
    cmake_build_directory = "build", -- 默认构建目录
    cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" }, -- 自动生成 compile_commands.json 给 clangd 用
    cmake_build_options = {},
    cmake_console_size = 10, -- 下方终端高度
    cmake_show_console = "always", -- 构建时自动弹出终端
    -- 核心：集成了 Toggleterm 和 DAP (调试器)
    cmake_dap_configuration = { name = "cpp", type = "codelldb", request = "launch" },
    cmake_dap_open_window = false,
  },
  keys = {
    { "<leader>cg", "<cmd>CMakeGenerate<cr>", desc = "CMake 生成" },
    { "<leader>cb", "<cmd>CMakeBuild<cr>", desc = "CMake 构建" },
    { "<leader>cr", "<cmd>CMakeRun<cr>", desc = "CMake 运行" },
    { "<leader>cd", "<cmd>CMakeDebug<cr>", desc = "CMake 调试" },
    { "<leader>ct", "<cmd>CMakeSelectBuildTarget<cr>", desc = "选择构建目标" },
  },
}