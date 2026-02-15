# ==================================================
# fzf functions
# ==================================================
ff() {
  local file
  file=$(find . -type f 2>/dev/null | fzf --height 40% --reverse --preview 'bat --color=always {}' --preview-window=right:60%:wrap)
  if [ -n "$file" ]; then
    local absolute_path
    absolute_path=$(realpath "$file")  # 将相对路径转换为绝对路径
    echo "Selected file: $absolute_path"
  else
    echo "No file selected."
  fi
}

function cdf() {
   local dir
   # 查找当前所有子目录 -> fzf 选择 -> 如果选中了就 cd 进去
   dir=$(find . -path '*/\.*' -prune -o -type d -print 2> /dev/null | fzf +m) &&
   cd "$dir"
}

function fzfc() {
    fzf | tr -d '\n' | tee >(pbcopy)
}

function fzfm() {
    fzf --multi --bind='ctrl-a:select-all'
}

# ==================================================
# yazi functions
# ==================================================
 function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}
