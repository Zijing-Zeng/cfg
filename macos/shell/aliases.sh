# ==================================================
# 常用
# ==================================================
alias 'cl'='clear'

alias 'GR'='cd /'
alias 'GH'='cd ~'
alias 'GD'='cd ~/Desktop'
alias 'GP'='cd ~/Desktop/SynSpace/project'

# ==================================================
# cmake project
# ==================================================
alias 'mk'='make -j10'
alias 'cm'='cmake .. && make -j10'
alias 'smi'='sudo make install'
alias 'srm'='sudo rm -r ./*'
alias 'br'='clear && make -j10 && ./test' # build and run

# ==================================================
# git
# ==================================================
alias 'gf'='git fetch && git status'
alias 'ga'='git add ../.'

# ==================================================
# tmux
# ==================================================
alias 'tmls'="tmux list-windows -F '#{window_layout}' | head -n 1"

# ==================================================
# matlab
# ==================================================
alias 'matlab'='matlab -nodesktop -nosplash'
