#!/bin/bash

# 1. 动态获取当前脚本所在的目录
SHELL_DIR="$(dirname "${BASH_SOURCE[0]:-$0}")"

# 2. 定义仓库根目录 (可选，如果其他脚本需要用到 $DOTFILES 变量)
# 假设 shell 目录的上一级是 macos，再上一级是 cfg 根目录
export DOTFILES="$(cd "$SHELL_DIR/../../" && pwd)"

# 3. 遍历加载同目录下的所有 .sh 文件
for file in "$SHELL_DIR"/*.sh; do
    # === [关键！] 防止死循环 ===
    # 因为 init.sh 自己也是 .sh 文件，必须把它排除掉，
    # 否则它会无限 source 自己，导致终端卡死。
    if [[ "$(basename "$file")" == "init.sh" ]]; then
        continue
    fi

    # 4. 加载文件
    if [ -r "$file" ]; then
        # 可选：打印正在加载的文件，调试用
        # echo "正在加载: $(basename "$file")"
        source "$file"
    fi
done

# 4. 其他一些配置
# Add Matlab CLI Tools
export PATH=$PATH:/Applications/MATLAB_R2024b.app/bin

# Init zoxide cmd
eval "$(zoxide init zsh)"

# You can use whatever you want as an alias, like for Mondays:
eval $(thefuck --alias FUCK)