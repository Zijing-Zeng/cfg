" Date: 2025/04/24-03
" Author: 曾子敬
" For All

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

" 批量替换操作
cnoremap SS %s/<C-r><C-w>/

" 文件保存
" ZZ 默认是保存退出单个窗口
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>
nnoremap <unique><silent> ZZ :FloatermKill!<CR>:wqa<CR>

" 文本编辑
vnoremap < <gv
vnoremap > >gv
nnoremap <silent> <leader>sa ggVG
nnoremap <silent> <CR> o<Esc>
nnoremap <silent> <leader>J kddpkJ
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
vnoremap <leader>d "_d
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
nnoremap <silent> <C-o> <C-o>zz
nnoremap <silent> <C-i> <C-i>zz
" nnoremap <silent> { {zz
" nnoremap <silent> } }zz
" nnoremap <silent> ( (zz
" nnoremap <silent> ) )zz
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> G Gzz
nnoremap <silent> g* g*zz
nnoremap <silent> `` ``zz

" 窗口操作
nnoremap <silent> <leader>h <C-w>h
nnoremap <silent> <leader>j <C-w>j
nnoremap <silent> <leader>k <C-w>k
nnoremap <silent> <leader>l <C-w>l
nnoremap <silent> <leader>H <C-w>H
nnoremap <silent> <leader>L <C-w>L
" nnoremap <silent> <leader>J <C-w>J  一般也不用上下移动窗口。这个用与连接上下行
" nnoremap <silent> <leader>K <C-w>K
nnoremap <silent> <leader>w <C-w>w
nnoremap <silent> <leader>q :wq<CR>
nnoremap <silent> <leader>t <C-w>v<C-w>T:LeaderfFile<cr>
nnoremap <silent> <leader>v <C-w>v<C-w>L

"===========================================================================================================
"| Config | 折叠
"===========================================================================================================
" 一开始需要使用zM 创建折叠
" zi 切换折叠状态
" zo 打开当前光标下的折叠
" zc 关闭当前光标下的折叠
set wrap                    " 开启自动折行
set linebreak               " 只有遇到指定的符号（比如空格、连词号和其他标点符号），才发生折行。也就是说，不会在单词内部折行
set foldenable              " 开启代码折叠
set foldmethod=indent       " 设置折叠类型为缩进等级
set foldlevel=3 
" set foldmethod=marker       " 设置折叠类型为特殊符号
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
set mouse=v                 " 允许在任何模式下，通过鼠标选中
set selection=inclusive     " 光标下的字符也被选中
set selectmode=""           " 不允许任何方式进行选中（选中模式下，再输入将删除选中并输入！！！）
set cursorline              " 光标所在的当前行高亮
set nocursorcolumn          " 光标所在的当前列高亮

"===========================================================================================================
"| Config | 状态栏
"===========================================================================================================
set showmode
set showcmd
set laststatus=2            " 是否显示状态栏。0 表示不显示，1 表示只在多窗口时显示，2 表示显示。
set ruler                   " 在状态栏显示光标的当前位置（位于哪一行哪一列）

"===========================================================================================================
"| Config | 外观
"===========================================================================================================
colorscheme desert                    " 设置主题

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
set autoindent              " 自动复制上一行的缩进
set cindent                 " c/c++风格的缩进
set smartindent             " 根据语言智能缩进，接管autoindent"
set shiftwidth=2            " >> 或 << 每一级的字符数
set softtabstop=2           " Tab 转为多少个空格
set tabstop=2               " 按下 Tab 键时，Vim 显示的空格数
set expandtab               " 自动使用space替换tab
set smarttab

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
set complete=.,t,i                              " 优先从当前缓冲区、标签和包含文件补全
set completeopt=longest,menu
set pumheight=10                                " 限制补全菜单高度
set ignorecase                                  " 补全时忽略大小写

"===========================================================================================================
"| Config | vim报错
"===========================================================================================================
set novisualbell                                " 出错时，发出视觉提示，通常是屏幕闪烁。
set noerrorbells                                " 关闭出错时的声音提醒

"===========================================================================================================
"| Config | Netrw 目录配置
"===========================================================================================================
" 使用说明：
"  通常使用 vim . 打开文件夹
"  在目录中打开文件于新的标签页
"  默认使用 1gt 去到第一个标签页，即文件树
nmap <leader>e :Lexplore<CR>                    " 映射快捷键快速切换文件浏览器（替代NERDTree）
set autochdir                                   " 自动切换工作目录。这主要用在一个 Vim 会话之中打开多个文件的情况，
                                                " 默认的工作目录是打开的第一个文件的目录。
                                                " 该配置可以将工作目录自动切换到，正在编辑的文件的目录。
let g:netrw_liststyle = 3                       " 树形视图 + 侧边栏布局
let g:netrw_winsize = 20                        " 设置文件浏览器窗口宽度为25%（适合侧边栏布局）
let g:netrw_list_hide = '.*\.swp$,.git/,*.pyc'  " 隐藏系统文件（如 .git、.swp）
let g:netrw_banner = 0                          " 隐藏顶部横幅（减少视觉干扰）
let g:netrw_dirhistmax = 0                      " 禁止保存浏览历史文件（避免生成.netrwhist）
" let g:netrw_browse_split = 3                    " 打开文件的位置(0:当前窗口, 1:上方新栏, 2:右方新栏, 3:新标签页, 4:上方新栏,但不多次创建新栏 )
let g:netrw_x_cmd = 'xdg-open'                  " 使用系统默认程序打开非文本文件（如图片、PDF）
let g:netrw_special_syntax = 1                  " 启用按文件扩展名高亮（需已启用语法高亮）
let g:netrw_hide = 1                            " 允许通过`gh`快速切换隐藏文件显示
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro' " 打开目录的行号和其他配置

" 垂直分屏时始终将文件浏览器放在右侧
" let g:netrw_altv = 3

" 水平分屏时始终将文件浏览器放在上方
" let g:netrw_alto = 1

" 启动Vim时自动打开文件浏览器（类似IDE布局）
" autocmd VimEnter * :Vexplore

"===========================================================================================================
"| Config | Tag 标签栏设置
"===========================================================================================================
" 定义标签栏高亮颜色
hi TabLineSel ctermfg=Red ctermbg=LightGray  " 当前选中标签颜色
hi TabLine    ctermfg=Black ctermbg=LightGray " 其他标签颜色

" 自定义标签栏函数
function! MyTabLine()
    let s = ''
    " 遍历所有标签页
    for t in range(tabpagenr('$'))
        let tab_num = t + 1
        " 高亮当前标签页（网页3）
        if tab_num == tabpagenr()
            let s .= '%#TabLineSel#'  " 应用选中颜色
        else
            let s .= '%#TabLine#'      " 应用普通颜色
        endif
        " 添加序号和文件名
        let s .= ' ' . tab_num . ':%{MyTabLabel(' . tab_num . ')} '
    endfor
    return s
endfunction

" 获取标签页名称
function! MyTabLabel(n)
    let buflist = tabpagebuflist(a:n)
    let winnr = tabpagewinnr(a:n)
    let name = bufname(buflist[winnr - 1])
    return fnamemodify(name, ':t')  " 仅显示文件名（非完整路径）
endfunction

" 激活自定义标签栏
set tabline=%!MyTabLine()

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
"| End of .vimrc for all
"===========================================================================================================