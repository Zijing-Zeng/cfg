" Date: 2024/12/21-01
"===========================================================================================================
"| TODO |
"===========================================================================================================
" - [] 探索vim中使用终端的工作流
" - [] 优化自动补全的片段与优先级
" - [] 解决ROS2工程的代码补全问题
" - [] 设置跳转到下一个报错行的快捷键，如果有的话
" - [x] 消除括号未知原因的自动检查与卡顿感
" - [x] 优化自动括号自动补全机制
" - [] 自动根据当前的工作区结构切换编译命令
" - [] 自动根据头文件排序源文件中的函数？感觉没办法

"===========================================================================================================
"| Config | vim :make 使用的编译命令，需要手动切换
"===========================================================================================================
" >>> cmake工程<<<
" set makeprg=cd\ build\ &&\ make

" >>> ROS2 工程<<<
" set makeprg=colcon\ build\ --symlink-install

"===========================================================================================================
"| Config | Key Map
"===========================================================================================================
" 通过 :verbose map <C-x> 命令就可以查看快捷键是否被使用
" Leader 按键映射
let mapleader = "\<space>"

" 取消高亮状态
nnoremap <C-h> :nohlsearch<CR>

" 模式切换
inoremap jj <Esc>
tnoremap <Esc> <C-\><C-n>
tnoremap jj <C-\><C-n>

" 批量替换操作
cnoremap SS %s/<C-r><C-w>/

" 文件写入与退出
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>
nnoremap <silent> <leader>q :q<CR>

" ZZ 默认是保存退出单个窗口
" nnoremap <unique><silent> ZZ :FloatermKill!<CR>:wqa<CR>

" 文本编辑
vnoremap < <gv
vnoremap > >gv
nnoremap <leader>a ggVG
nnoremap <silent> <CR> o<Esc>
" nnoremap <silent> <leader>J kddpkJ
nnoremap U <C-r>
nnoremap Y y$
nnoremap C c$
nnoremap D d$
nnoremap x "_x
nnoremap X "_X
nnoremap s "_s
nnoremap S "_S
nnoremap <leader>D "_D
nnoremap <leader>dd "_dd
vnoremap <leader>d "+d
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P
vnoremap <leader>y "+y
nnoremap <leader>yy "+yy

" 光标跳转
" nnoremap H ^
" nnoremap L $
nnoremap <silent> <C-e> 3<C-e>
nnoremap <silent> <C-y> 3<C-y>
nnoremap <silent> <C-o> <C-o>
nnoremap <silent> <C-i> <C-i>
nnoremap <silent> { {
nnoremap <silent> } }
nnoremap <silent> ( (
nnoremap <silent> ) )
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> G Gzz
nnoremap <silent> g* g*zz
nnoremap <silent> `` ``zz

" ==============================================
" 1. 基础设置 (解决 Alt 键延迟和识别问题)
" ==============================================
" 必须设置！否则 Vim 会把 Alt 误判为 Esc
set ttimeout
set ttimeoutlen=50

" ==============================================
" 2. 插件设置
" ==============================================
" 禁用插件默认键位（默认是 Ctrl），因为我们要用 Alt
let g:tmux_navigator_no_mappings = 1

" ==============================================
" 3. 统一键位映射
" ==============================================
" --- A. 导航 (跳转) ---
" 调用插件提供的命令，如果走到边缘，插件会自动通知 Tmux 切换
nnoremap <leader>h :TmuxNavigateLeft<CR>
nnoremap <leader>j :TmuxNavigateDown<CR>
nnoremap <leader>k :TmuxNavigateUp<CR>
nnoremap <leader>l :TmuxNavigateRight<CR>

" --- C. 调整大小 ---
" vertical resize 调整宽度，resize 调整高度
nnoremap <leader>H :vertical resize -5<CR>
nnoremap <leader>L :vertical resize +5<CR>
nnoremap <leader>k :resize +5<CR>
nnoremap <leader>j :resize -5<CR>

" --- B. 分割 (新建) ---
" 这里的方向逻辑尽量与 Tmux 保持一致
" aboveleft/belowright 用于强行指定分割方向
nnoremap <leader>V :aboveleft vsplit<CR><C-w>h
nnoremap <leader>v :belowright vsplit<CR><C-w>l
nnoremap <leader>s :aboveleft split<CR><C-w>j
nnoremap <leader>S :belowright split<CR><C-w>k

" --- D. 交换 (移动) ---
" 使用 Vim 原生的窗口移动命令
" nnoremap HT  <C-w>H
" nnoremap LT <C-w>L
" nnoremap KT <C-w>K
" nnoremap JT <C-w>J

" 标签操作——创建标签并搜索打开文件
nnoremap <silent> <leader>t <C-w>v<C-w>T:LeaderfFile<cr>

" 标签操作——标签快速跳转
nnoremap <silent> <leader>1 1gt
nnoremap <silent> <leader>2 2gt
nnoremap <silent> <leader>3 3gt
nnoremap <silent> <leader>4 4gt
nnoremap <silent> <leader>5 5gt
nnoremap <silent> <leader>6 6gt
nnoremap <silent> <leader>7 7gt
nnoremap <silent> <leader>8 8gt
nnoremap <silent> <leader>9 9gt

"===========================================================================================================
"| Config | Vim 官方支持的gdb Termdebug
"===========================================================================================================
" 好教程：https://fzheng.me/2018/05/28/termdebug/
" <C-l>：刷新窗口
" K:     查看当前变量
nnoremap <unique> <F10> :packadd termdebug<CR>:Termdebug<CR>
nnoremap <unique> <F5> :Step<CR>
nnoremap <unique> <F6> :Over<CR>
nnoremap <unique> <F7> :Break<CR>
nnoremap <unique> <F8> :Continue<CR>
let g:termdebug_wide = 163 " debug时采用上下右布局，方便跳转

"===========================================================================================================
"| Config | Vim 官方支持的quickfix功能
"===========================================================================================================
nnoremap <unique><silent> <F9> :make<CR>
nnoremap <unique><silent> <leader>[ :cprevious<CR>:cwindow<CR>
nnoremap <unique><silent> <leader>] :cnext<CR>:cwindow<CR>

"===========================================================================================================
"| Config | 折叠
"===========================================================================================================
" 一开始需要使用zM 创建折叠
" zi 切换折叠状态
" zo 打开当前光标下的折叠
" zc 关闭当前光标下的折叠
set wrap                    " 开启自动折行
set foldenable              " 开启代码折叠
set foldmethod=indent       " 设置折叠类型
set foldlevel=3
" set foldmethod=marker       " 设置折叠类型
" set foldmarker={,}
set foldlevelstart=99       " 避免开启vim后自动折叠
set textwidth=120           " 超过会自动添加回车换行

"===========================================================================================================
"| Config | 编码
"===========================================================================================================
set encoding=utf-8
set termencoding=utf-8      "设置终端编码"
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936

"===========================================================================================================
"| Config | 光标
"===========================================================================================================
set mouse=a                 " 允许在任何模式下，通过鼠标选中
set selection=inclusive     " 光标下的字符也被选中
set selectmode=""           " 不允许任何方式进行选中（选中模式下，再输入将删除选中并输入！！！）
set cursorline              " 光标所在的当前行高亮
set nocursorcolumn          " 光标所在的当前列高亮

"===========================================================================================================
"| Config | 状态栏
"===========================================================================================================
set showmode
set showcmd
set laststatus=0            " 是否显示状态栏。0 表示不显示，1 表示只在多窗口时显示，2 表示显示。
set ruler                   " 在状态栏显示光标的当前位置（位于哪一行哪一列）

"===========================================================================================================
"| Config | 外观
"===========================================================================================================
set termguicolors                     " 启动终端对于真彩色的支持

if &term =~# '^screen'
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

endif
set number                            " 打开终端左侧的行号
set relativenumber                    " 启动相对行号
set nocompatible                      " 关闭vi兼容模式
set scrolloff=3                       " 垂直滚动时，光标距离顶部/底部的位置（单位：行）。
set sidescrolloff=10                  " 水平滚动时，光标距离行首或行尾的位置（单位：字符）
set fillchars=vert:\ ,stl:\ ,stlnc:\  " 在窗口之间显示空白，增加分离度
set cc=80
"===========================================================================================================
"| Config | 高亮
"===========================================================================================================
filetype on                 " 开启文件类型检测
filetype plugin on          " 打开对应文件类型的插件
syntax enable               " 开启语法检查
set showmatch               " 自动高亮匹配的括号

"===========================================================================================================
"| Config | 缩进
"===========================================================================================================
filetype indent on
set smarttab
set autoindent              " 自动复制上一行的缩进
set cindent                 " c/c++风格的缩进
set smartindent             " 根据语言智能缩进，接管autoindent"
set shiftwidth=4            " >> 或 << 每一级的字符数
set softtabstop=4           " 按退格键时一次删掉 4 个空格
set tabstop=4               " 按下 Tab 键时，Vim 显示的空格数
set expandtab               " 将 Tab 转换为空格

"===========================================================================================================
"| Config | 搜索
"===========================================================================================================
set incsearch               " 增量式搜索，输入搜索模式时，每输入一个字符，就自动跳到第一个匹配的结果
set hlsearch                " 搜索时，高亮匹配结果，但每次搜索完会一直显示
set ignorecase              " 忽略搜索时的大小写
set smartcase

"===========================================================================================================
"| Config | 命令模式的行为
"===========================================================================================================
set wildmenu
set wildmode=longest:list,full                  " 允许命令模式下的自动补全与行为设置"
set cmdheight=2                                 " 命令行（在状态行下）的高度

"===========================================================================================================
"| Config | 编辑
"===========================================================================================================
" set paste                                     " 使能粘贴模式，避免自动缩进的影响(不能开！否则coc自动补全会失效)
" autocmd InsertLeave * write                   " 当离开插入模式时自动保存
autocmd FocusLost * if &mod | write | endif     " 或者，当文件被修改且失去焦点时自动保存
set clipboard+=unnamed                          " 共享剪切板
set backspace=2                                 " 能使用backspace回删,等价于backspace=indent,eol,start
set nobackup                                    " 从不备份
set noswapfile                                  " 从不备份
set hidden                                      " 允许隐藏不保存的缓存区，即不保存就退出，修改将在下次打开文件后恢复
set history=100                                 " Vim 需要记住多少次历史操作
set autoread                                    " 打开文件监视。如果在编辑过程中文件发生外部改变，就会发出提示
set timeoutlen=500                              " 组合键的判断时间
set ttimeoutlen=0                               " 终端模式的组合键判断时间
set confirm                                     " 在处理未保存或只读文件的时候，弹出确认

"===========================================================================================================
"| Config | 自动补全
"===========================================================================================================
set complete = "i,d"
set completeopt=longest,menu

inoremap { {}<Esc>i
inoremap [ []<ESC>i
inoremap ( ()<ESC>i
inoremap < <><ESC>i

inoremap } <c-r>=ClosePair('}')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap > <c-r>=ClosePair('>')<CR>

" inoremap " ""<ESC>i
" inoremap ' ''<ESC>i

function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction

"===========================================================================================================
"| Config | vim报错
"===========================================================================================================
set novisualbell                                " 出错时，发出视觉提示，通常是屏幕闪烁。
set noerrorbells                                " 关闭出错时的声音提醒

"===========================================================================================================
"| Config | 安装vim-plug -----------------------------------------------------------------------------------
"===========================================================================================================
" 如果没有安装vim-plug则自动安装
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" 如果有插件没有安装，则自动安装
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
      \| PlugInstall --sync | source $MYVIMRC | endif

"===========================================================================================================
"| Config | 自动安装插件
"===========================================================================================================
call plug#begin()

Plug 'phanviet/vim-monokai-pro'                                 " 主题
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'                                   " 图标库

" Plug 'lilydjwg/fcitx.vim'                                       " 自动切换输入法插件（MacOS和Linux）

Plug 'tpope/vim-obsession'                                      " 会话管理插件
Plug 'preservim/nerdtree'                                       " 文件树
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'                  " 文件树中给文件或文件夹高亮
Plug 'PhilRunninger/nerdtree-visual-selection'                  " 增加文件树中可视批量操作
" Plug 'majutsushi/tagbar'                                        " 文件大纲
Plug 'liuchengxu/vista.vim'                                     " 文件大纲

Plug 'powerline/powerline'                                      " 状态栏美化
Plug 'vim-airline/vim-airline'                                  " 状态栏美化
Plug 'vim-airline/vim-airline-themes'                           " 状态栏主题

Plug 'Yggdroot/LeaderF', {'do': ':LeaderfInstallCExtension'}    " 模糊搜索
Plug 'voldikss/vim-floaterm'                                    " 浮动终端

Plug 'luochen1990/rainbow'                                      " 彩虹括号
Plug 'rrethy/vim-illuminate'                                    " 高亮相同区域
Plug 'yggdroot/indentline'                                      " 缩进线

Plug 'tpope/vim-surround'                                       " 环绕操作

Plug 'preservim/nerdcommenter'                                  " 代码注释
Plug 'junegunn/vim-easy-align'                                  " 快捷对齐
Plug 'mg979/vim-visual-multi', {'branch': 'master'}             " 多光标
Plug 'iamcco/markdown-preview.nvim'                             " markdown预览

Plug 'easymotion/vim-easymotion'                                " 快捷移动光标
" Plug 'justinmk/vim-sneak'                                     " 快速移动光标(更轻量)
Plug 'christoomey/vim-tmux-navigator'                           " tmux 与 vim 之间光标跳转
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-autoformat/vim-autoformat'                            " 自动格式化代码
Plug 'puremourning/vimspector'                                  " gdb 插件
Plug 'tpope/vim-fugitive'                                       " git 插件
Plug 'tpope/vim-rhubarb'                                        " 快速跳转到github
Plug 'github/copilot.vim'

call plug#end()

"===========================================================================================================
"| coloer scheme | 主题
"===========================================================================================================
set background=dark
" colorscheme monokai_pro
" colorscheme gruvbox
colorscheme onedark

"===========================================================================================================
"| Plug Config | powerline (Not Support MacOS)
"===========================================================================================================
" python3 from powerline.vim import setup as powerline_setup
" python3 powerline_setup()
" python3 del powerline_setup

"===========================================================================================================
"| Plug Config | airline (状态栏与标签栏)
"===========================================================================================================
" 1. 基础设置
let g:airline_theme='onedark'
set encoding=utf-8

" 2. 初始化符号字典 (如果没有这一步，下面的设置可能报错)
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" 3. 【关键】手动指定 Powerline 符号
" 既然你安装了 Nerd Font，我们可以直接用更现代的圆角或直角，或者干脆用空字符
" --- 方案 A: 极简纯净版 (完全去掉那个方块) ---
" 下面两行决定了状态栏左右两边的箭头，设为空字符串即可消除方块
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" --- 方案 B: 使用 Nerd Font 的圆角/三角 (如果你想要花哨一点) ---
" let g:airline_left_sep = ''
" let g:airline_right_sep = ''

" 4. Tabline (顶部标签栏) 的专用分割符
let g:airline#extensions#tabline#enabled = 1

" [选中 Tab] 和 [未选中 Tab] 之间的分割符 (原本这里可能是个方块)
" 我们把它改成空，或者只要一个空格
let g:airline#extensions#tabline#left_sep = ''

" [未选中 Tab] 和 [未选中 Tab] 之间的分割符
let g:airline#extensions#tabline#left_alt_sep = '|'

" 5. 其他必要配置
" unique_tail: 只显示文件名。如果有两个文件同名(如 a/main.cpp 和 b/main.cpp)，它才会智能显示路径区分
let g:airline#extensions#tabline#formatter = 'unique_tail'

" 显示 Tab 的序号 (1, 2, 3...)
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 1

" 显示关闭按钮
let g:airline#extensions#tabline#show_close_button = 1

" 当只有一个 tab 时不显示标签栏 (可选，如果你喜欢一直显示就注释掉这行)
let g:airline#extensions#tabline#show_buffers = 0
"===========================================================================================================
"| Plug Config | indentline
"===========================================================================================================
let g:indentLine_enabled = 1  " 使能插件

" [关键] 设置字符 (推荐用更细的线，视觉干扰更小)
" 备选字符: '¦', '┆', '│', '⎸', '▏'
let g:indentLine_char = '┆'

" [关键] 调整颜色实现'透明度'
" 239 是中灰色，235-237 是深灰色。
" 在深色背景下，数字越小越接近黑色背景，看起来越'透明'
let g:indentLine_color_term = 236
let g:indentLine_color_gui = '#3a3a3a'

" 移除无效配置 (插件不支持这些参数，写了也没用)
" let g:indentLine_indentLevel = 4  <-- 这个参数是不存在的
" let g:indent_guides_guide_size = 1 <-- 这是另一个插件(vim-indent-guides)的参数

" 排除某些文件类型 (比如 Markdown 或 json 有时不需要)
let g:indentLine_fileTypeExclude = ['markdown', 'json', 'help', 'nerdtree']

"===========================================================================================================
"| Plug Config | fcitx.vim (macOS 输入法自动切换)
"===========================================================================================================
" 告诉插件使用 im-select 命令
" let g:fcitx5_remote = 'im-select'
let g:fcitx5_remote = '/opt/homebrew/bin/im-select'

" 如果你在 tmux 里面使用，可能需要开启这个（可选）
let g:fcitx_remote_check_timeout = 0

"===========================================================================================================
"| Plug Config | nerdcommenter
"===========================================================================================================
noremap <unique> <leader>c <plug>NERDCommenterToggle

let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1                           " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1                       " Use compact syntax for prettified multi-line comments
let g:NERDDefaultAlign = 'left'                     " Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDAltDelims_java = 1                        " Set a language to use its alternate delimiters by default
let g:NERDCustomDelimiters = { 'c': { 'left': '/*','right': '*/' } }       " Add your own custom formats or override the defaults
let g:NERDCommentEmptyLines = 1                     " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 1                " Enable trimming of trailing whitespace when uncommenting
let g:NERDToggleCheckAllLines = 1                   " Enable NERDCommenterToggle to check all selected lines is commented or not

"===========================================================================================================
"| Plug Config | nerdtree
"===========================================================================================================
" 使用<C-n>打开关闭文件树
nnoremap <Leader>e :NERDTreeToggle<CR>

let NERDChristmasTree=1                             "显示增强
let NERDTreeAutoCenter=1                            "自动调整焦点，居中
let NERDTreeShowFiles=1                             "显示文件
let NERDTreeShowLineNumbers=1                       "显示行号
let NERDTreeHightCursorline=1                       "高亮当前文件
let NERDTreeShowHidden=1                            "显示隐藏文件
let NERDTreeMinimalUI=1                             "不显示'Bookmarks' label 'Press ? for help'
let NERDTreeWinSize=30                              "窗口宽度
let NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'              " 设置树的显示图标
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeHidden=0                              "不显示隐藏文件
let NERDTreeIgnore = ['\.pyc$']                     "过滤所有.pyc文件不显示

" 防止其他buffer抢占NERDTree的位置，让buffer到其他window
autocmd BufEnter * if winnr() == winnr('h')
      \ && bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
      \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" 在新的Tab里打开相同的NERDTree
autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif

" 如果退出vim后只剩Tree的Tag的话，则自动退出Tree的Tag
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" 定义一个函数来实现 Yazi 风格的 h 键
function! NERDTreeSmartH()
  let l:node = g:NERDTreeFileNode.GetSelected()

  " 如果是展开的目录，就收起 (模拟 h 收起)
  if l:node.path.isDirectory && l:node.isOpen
    call nerdtree#ui_glue#invokeKeyMap("x")
  " 否则（是文件，或者已经是收起的目录），就跳到父节点 (模拟 h 返回上一级)
  else
    call nerdtree#ui_glue#invokeKeyMap("p")
  endif
endfunction

" 定义一个函数来实现 Yazi 风格的 l 键 (可选优化)
function! NERDTreeSmartL()
  let l:node = g:NERDTreeFileNode.GetSelected()
  if l:node.path.isDirectory && !l:node.isOpen
    call nerdtree#ui_glue#invokeKeyMap("o") " 展开
  elseif !l:node.path.isDirectory
    call nerdtree#ui_glue#invokeKeyMap("o") " 打开文件
  else
    " 如果已经是展开的目录，就移动到它的第一个子节点 (可选)
    normal! j
  endif
endfunction

" 绑定按键
autocmd FileType nerdtree nnoremap <buffer> <silent> h :call NERDTreeSmartH()<CR>
autocmd FileType nerdtree nnoremap <buffer> <silent> l :call NERDTreeSmartL()<CR>

" 当文件类型是 nerdtree 时，绑定 h 和 l (备用)
" autocmd FileType nerdtree nnoremap <buffer> <silent> l :call nerdtree#ui_glue#invokeKeyMap("o")<CR>
" autocmd FileType nerdtree nnoremap <buffer> <silent> h :call nerdtree#ui_glue#invokeKeyMap("x")<CR>

" 建议：如果你想更像 Yazi，建议把'自动关闭'给关了，否则一选文件树就没了
" 把原来那行 let NERDTreeQuitOnOpen=1 改为 0，或者直接注释掉
let NERDTreeQuitOnOpen=0

"===========================================================================================================
"| Plug Config | vim-nerdtree-syntax-highlight
"===========================================================================================================
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:Turquoise = "40E0D0"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = "FE405F"
let s:git_orange = "F54D27"
let s:gray = "808A87"
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1
let g:NERDTreeExtensionHighlightColor = {}              " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['o'] = s:gray     " sets the color of o files to blue
let g:NERDTreeExtensionHighlightColor['h'] = s:blue     " sets the color of h files to blue
let g:NERDTreeExtensionHighlightColor['c'] = s:green    " sets the color of c files to blue
let g:NERDTreeExtensionHighlightColor['cpp'] = s:green  " sets the color of cpp files to blue
let g:NERDTreeExtensionHighlightColor['c++'] = s:green

"===========================================================================================================
"| Plug Config | tarbar (保留tagbar，但禁用)
"===========================================================================================================
" nnoremap <Leader>bt :TagbarToggle<CR>
let g:tagbar_width=35                                 " 设置tagbar的宽度
let g:tagbar_compact = 1                              " 紧凑模式：不显示顶部的帮助信息，节省空间
let g:tagbar_sort = 0                                 " 关闭自动排序：让标签按代码里的顺序显示（而不是按字母a-z排序）
let g:tagbar_indent = 1                               " 缩进显示，层级更清晰

"在某些情况下自动打开tagbar
" autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()

" 图标美化 (如果你用了 Nerd Font，这一步其实 Tagbar 会自动检测，但手动指定更稳)
let g:tagbar_iconchars = ['▸', '▾']

" 强制在 tagbar 类型的文件中，让 <Left> 键也能切换回左边窗口
autocmd FileType tagbar nnoremap <buffer> <silent> <C-w>h

"===========================================================================================================
"| Plug Config | vista.vim (替代 tagbar)
"===========================================================================================================
" 配合你的光标移动习惯 (在 vista 窗口中)
" 它的逻辑是：按 <CR> 跳转并关闭 vista，按 o 跳转但不关闭

" 打开/关闭大纲视图
nnoremap <Leader>bt :Vista!!<CR>

" 默认使用 coc 作为数据源 (如果 coc 没准备好，它会自动回退到 ctags)
let g:vista_default_executive = 'coc'

" 设置图标 (需要 Nerd Font)
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista#renderer#enable_icon = 1

" 窗口宽度
let g:vista_sidebar_width = 35

"===========================================================================================================
"| Plug Config | illuminate
"===========================================================================================================
" hi illuminatedWord ctermfg=white ctermbg=99
hi illuminatedWord cterm=underline gui=underline

"===========================================================================================================
"| Plug Config | LeaderF
"===========================================================================================================
" 除作者自己写的教程外，其他人写的比较好的教程：https://retzzz.github.io/dc9af5aa/
" 如果一个目录含有任何具有list中指定的名字的子目录或者文件, 可以认定其为根目录. 搜索根目录的办法是,
" 1. 先找当前文件的所有祖先目录里最近的根目录, 如果找到就使用这个根目录为查找起点. (A的含义)
" 2. 如果没找到任何根目录, 看看当前打开的文件是否在VIM的工作目录(working directory)下, 或者任何其子目录下.
"    如果是, 就是用工作目录作为查找起点. (F的含义)
" 3. 如果当前文件不在工作目录和其后代目录下, 则以当前文件所在目录为查找起点.(default)
let g:Lf_WorkingDirectoryMode = 'AF'
let g:Lf_WindowPosition = 'popup'                   "文件在弹出窗口
let g:Lf_PreviewInPopup = 1                         "文件预览窗口在新的弹窗中显示
let g:Lf_AutoResize = 1                             "自动调整大小
let g:Lf_DefaultExternalTool = 'rg'                 "设置默认外部工具
let g:Lf_WindowHeight = 0.30                        "设置预览窗口高度
let g:Lf_ShowDevIcons = 1                           " Show icons, icons are shown by default
let g:Lf_DevIconsFont = "SauceCodePro Nerd Font"    " For GUI vim, the icon font can be specify like this
let g:Lf_HideHelp = 1                               " don't show the help in normal mode
let g:Lf_UseVersionControlTool = 1                  "使用git或gh
let g:Lf_UseCache = 0
let g:Lf_CacheDirectory = expand('~/.VimCache/')
let g:Lf_IgnoreCurrentBufferName = 1
let g:Lf_WildIgnore={'file':['*.vcproj', '*.vcxproj'],'dir':['build', 'log', 'install', '.git']}
let g:Lf_RootMarkers = ['.git', '.project', '.vscode'] "寻找根目录的参考
let g:Lf_ShowHidden = 0                             "不显示隐藏文件

" noremap <unique><silent> <leader>fh :LeaderfSelf<cr>
noremap <unique><silent> <leader>fs :LeaderfFile<cr>
noremap <unique><silent> <leader>fh <C-w>v<C-w>l:LeaderfFile<cr>
noremap <unique><silent> <leader>fl :LeaderfLine<cr>
noremap <unique><silent> <leader>ff :LeaderfFunction<cr>
noremap <unique><silent> <leader>fm <C-w>v<C-w>l:LeaderfMru<cr>
noremap <unique><silent> <leader>fd :Leaderf rg -F -e todo<cr>
noremap <unique> <leader>ft :LeaderfBufTag<cr>
" noremap <unique> <leader>fb :LeaderfBufTagAll<cr>
" noremap <unique> <leader>fw :LeaderfWindow<cr>

" 与rg的结合
let g:Lf_RgConfig = [
      \ "--max-columns=20",
      \ '--type-add "web:*.{html,css,js}*"',
      \ "--glob=!git/*",
      \ "--glob=!build/*",
      \ "--glob=!log/*",
      \ "--glob=!install/*",
      \ "--hidden"
      \ ]
" nmap <unique> <leader>frr <Plug>LeaderfRgPrompt
nnoremap <unique> <leader>fw <Plug>LeaderfRgCwordLiteralNoBoundary
nmap <unique> <leader>fb <Plug>LeaderfRgCwordLiteralBoundary
" nmap <unique> <leader>frc <Plug>LeaderfRgCwordRegexNoBoundary
" nmap <unique> <leader>frd <Plug>LeaderfRgCwordRegexBoundary

" 与gtags结合(目前还没有成熟)
let g:Lf_GtagsAutoGenerate = 1 "自动生成gtags数据库。保存在~/.vimcache/.lfcache/gtags/。
let g:Lf_RootMarkers = ['.git', '.svn', '.project'] "工程根目录标识。
let g:Lf_Gtagslabel = 'native-pygments'

"===========================================================================================================
"| Plug Config | floaterm
"===========================================================================================================
let g:floaterm_autoclose = 1
let g:floaterm_width = 200
let g:floaterm_winblend = 10
let g:floaterm_shell = 'bash'
hi Floaterm guibg=black                                     " Set floaterm window's background to black
nnoremap <unique><silent> <F1> :FloatermToggle<CR>
tnoremap <unique><silent> <F1> <C-\><C-n>:FloatermToggle<CR>
nnoremap <unique><silent> <F2> :FloatermNext<CR>
tnoremap <unique><silent> <F2> <C-\><C-n>:FloatermNext<CR>
nnoremap <unique><silent> <F3> :FloatermNew<CR>
tnoremap <unique><silent> <F3> <C-\><C-n>:FloatermNew<CR>
nnoremap <unique><silent> <F4> :FloatermKill<CR>
tnoremap <unique><silent> <F4> <C-\><C-n>:FloatermKill<CR>

"===========================================================================================================
"| Plug Config | easy-align
"===========================================================================================================
" Start interactive EasyAlign in visual mode (e.g. vipga)
vnoremap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nnoremap ga <Plug>(EasyAlign)

"===========================================================================================================
"| Plug Config | coc.nvim
"===========================================================================================================
" 修改选择栏的背景色
hi CocMenuSel ctermbg=237 guibg=#13354A
let g:coc_default_semantic_highlight_groups = 1
set pumheight=30                          " 设置选项数量

" 下载LSP服务器和coc插件

let g:coc_global_extensions = [
      \ 'coc-highlight',
      \ 'coc-snippets',
      \ 'coc-prettier',
      \ 'coc-clangd',
      \ 'coc-pyright',
      \ 'coc-cmake',
      \ 'coc-translator',
      \ 'coc-marketplace',
      \ 'coc-json',
      \ 'coc-tabnine',
      \ 'coc-vimlsp',
      \ 'coc-markdownlint',
      \ 'coc-xml',
      \ 'coc-imselect',
      \ 'coc-explorer',
      \ 'coc-git',
      \]
"      \ 'coc-java',
"      \ 'coc-java-intellicode',

nnoremap <silent> gd <Plug>(coc-definition)zz
" nnoremap <silent> gy <Plug>(coc-type-definition)zz
" nnoremap <silent> gi <Plug>(coc-implementation)zz
nnoremap <silent> gr <Plug>(coc-references)zz
" nnoremap <silent> gh :CocCommand clangd.symbolInfo<CR>
nnoremap <silent> gs :CocCommand clangd.switchSourceHeader<CR>
" 重命名
nnoremap <silent> <leader>rn <Plug>(coc-rename)
" 显示TODO列表
" nnoremap <silent> gl :CocCommand coc-todo-tree.showTree<CR>

set nobackup
set nowritebackup
set signcolumn=yes " 始终显示列报错状态，否则每次都会移动文本

inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<C-j>'
let g:coc_snippet_prev = '<C-k>'

command! -nargs=0 Format :call CocActionAsync('format')
command! -nargs=? Fold :call CocAction('fold', <f-args>)

"===========================================================================================================
"| Config | Coc Highlight Style (修改 Coc 高亮样式)
"===========================================================================================================
" 清除默认的下划线，改用背景色块
" ctermbg: 终端模式下的背景色 (237~240 是不同深度的灰色)
" guibg:   GUI/真彩色模式下的背景色 (HEX 颜色码)
" gui=none/cterm=none: 强制去掉下划线
" ---------------------------------------------------------------------
autocmd CursorHold * silent call CocActionAsync('highlight')
set updatetime=50  " 高亮刷新时间

" 方案 A：深灰色背景 (推荐，适合大多数深色主题)
highlight CocHighlightText cterm=none gui=none ctermbg=237 guibg=#3e4452

" 方案 B：如果觉得方案 A 太暗看不清，试试稍亮一点的灰色
" highlight CocHighlightText cterm=none gui=none ctermbg=239 guibg=#4e4e4e

" 方案 C：淡蓝色背景 (如果你想要更醒目一点)
" highlight CocHighlightText cterm=none gui=none ctermbg=24 guibg=#2b506e

" 有些配色主题（如 gruvbox, onedark 等）会在加载时强行重置所有高亮。为了保证你的设置永远生效，建议把上面的命令包在一个 autocmd 里
" 只要配色方案发生变化，就强行把 Coc 高亮改成我要的样式

autocmd ColorScheme * highlight CocHighlightText cterm=none gui=none ctermbg=239 guibg=#4e4e4e

"===========================================================================================================
"| Plug Config | coc-explorer (替代 NERDTree)
"===========================================================================================================
" 使用 <Leader>e 打开文件树 (explorer)
nnoremap <Leader>bf :CocCommand explorer<CR>

" 预设配置：禁用 nerdtree，用 coc-explorer 接管
let g:coc_explorer_global_presets = {
\   'default': {
\     'position': 'left',
\     'width': 30,
\     'open-action-strategy': 'sourceWindow',
\     'file-child-template': '[git | 2] [selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]',
\     'keyMappings': {
\       'h': 'collapse',
\       'l': ['expandable?', 'expand', 'open'],
\       '<cr>': ['expandable?', 'cd', 'open'],
\     }
\   }
\ }

" 自动关闭行为 (类似你之前的脚本)
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

"===========================================================================================================
"| Plug Config | coc-git (视觉增强)
"===========================================================================================================
" 开启行号旁边的 Git 状态标记 (默认开启，这里是确保)
set signcolumn=yes

" 导航到上一个/下一个修改块 (类似 VS Code 的 F7)
" nmap [c <Plug>(coc-git-prevchunk)
" nmap ]c <Plug>(coc-git-nextchunk)

" 显示当前修改块的详细信息 (浮动窗口显示 Diff)
nmap <Leader>gi <Plug>(coc-git-chunkinfo)

" 撤销当前块的修改 (相当于 VS Code 的 Revert Change)
" nmap <Leader>gu <Plug>(coc-git-chunkundo)

"===========================================================================================================
"| Plug Config | auto-format
"===========================================================================================================
" https://liam.page/2020/11/04/Vim-auto-format-codes-on-save/
" autocmd FileType c,cpp autocmd BufWritePre * :Autoformat
" styles: LLVM, file, Chromium
autocmd FileType c,cpp autocmd BufWritePre * :call FormatCode("", "file")

func! FormatCode(exe_mode, style) range
  if a:exe_mode == ""
    let firstline_no = 1
    let lastline_no = line("$")
  else
    let firstline_no = a:firstline
    let lastline_no = a:lastline
  endif
  let l:save_formatdef = g:formatdef_clangformat
  let l:tmpa = join(["clang-format --lines=", firstline_no, ":", lastline_no], "")
  let g:formatdef_clangformat = "'" . l:tmpa . " --assume-filename=' . bufname('%') . ' -style=" . a:style . "'"
  let formatcommand = ":Autoformat"
  exec formatcommand
  let g:formatdef_clangformat = l:save_formatdef
endfunc

"===========================================================================================================
"| End of .vimrc
"===========================================================================================================
