" vundle插件设置
set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=$VIM/vimfiles/vundle/

" 设置vundle插件的存放位置（rc括号内的路径)
call vundle#rc('$VIM/vimfiles/bundle/')

" let Vundle manage Vundle
" required! 
Bundle 'VundleVim/vundle.vim'

"bundles here:
Bundle 'tomtom/tlib_vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'
Bundle 'https://github.com/easymotion/vim-easymotion.git'
Bundle 'bling/vim-airline'
Bundle 'scrooloose/nerdtree'
Bundle 'https://github.com/lifepillar/vim-solarized8.git'
Bundle 'https://github.com/vim-scripts/taglist.vim.git'

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编码设置
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set encoding=utf-8
set termencoding=chinese
" 语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
language message zh_CN.UTF-8
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 基础设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
set expandtab "使用空格代替tab
set softtabstop=2
set shiftwidth=2
set tabstop=2
set bs=2
set history=300
set nobackup
set noswapfile
set autoread              " read open files again when changed outside Vim
set autowrite             " write a modified buffer on each :next , ...
set browsedir=current     " which directory to use for the file browser
set wildmenu
set wildignore=*.bak,*.o,*.e,*~
set complete+=k           " scan the files given with the 'dictionary' option
set path+=**
set noeb
autocmd BufEnter * :lchdir %:p:h " Change the working directory to the directory containing the current file
syntax on

" 设置工作目录为当前编辑文件的目录
set bsdir=buffer
set autochdir

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"颜色设置
set background=light
colorsc solarized8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"字体设置
set guifont=YaHei\ Consolas\ Hybrid:h12:cGB2312

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"折叠设置
set foldmethod=indent
set foldlevelstart=99
"nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"缩进设置
set autoindent 
set smartindent
set cindent
set nowrap

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"界面设置
set showtabline=1 "只有一个页签时不显示标签栏
set guitablabel=%{tabpagenr()}.%t\ %m "每个tab上显示编号
set guioptions-=T "去掉工具条
set guioptions-=m "去掉菜单
set guioptions-=r "去掉右边的滚动条
set guioptions-=L
set statusline=%F%m%r%h%w\ [FMT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [%{(&fenc==\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set laststatus=2
set scrolloff=3
set number
set ruler
au GUIEnter * simalt ~x

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"查找搜索设置
set incsearch             " use incremental search
set ignorecase smartcase
set hlsearch
set incsearch

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"按键映射
map <F12> :!%<CR> "将键盘上的F12健映射为执行当前文件
map <C-TAB> :tabn<CR> "使用Ctrl+Tab键来切换标签页
set showcmd
let mapleader="\<Space>" "set leaderkey=Space
runtime macros/matchit.vim "使用增强版的%百分号跳转


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"快捷键设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    F2   -  write file without confirmation
"    F3   -  call NERDTree
"    F4   -  show taglist
"    F5   -  open quickfix error window
"    F6   -  close quickfix error window
"    F7   -  display previous error
"    F8   -  display next error   
"  S-Tab  -  Fast switching between buffers (see below)
"    C-q  -  Leave the editor with Ctrl-q (see below)
map   <silent> <F2>    :write<CR>
map   <silent> <F3>    :NERDTree<CR>
nmap  <silent> <F4>    :Tlist<CR>
map   <silent> <F5>    :copen<CR>
map   <silent> <F6>    :cclose<CR>
map   <silent> <F7>    :cp<CR>
map   <silent> <F8>    :cn<CR>
"
imap  <silent> <F2>    <Esc>:write<CR>
imap  <silent> <F3>    <Esc>:NERDTree<CR>
imap  <silent> <F4>    <Esc>:Tlist<CR>
imap  <silent> <F5>    <Esc>:copen<CR>
imap  <silent> <F6>    <Esc>:cclose<CR>
imap  <silent> <F7>    <Esc>:cp<CR>
imap  <silent> <F8>    <Esc>:cn<CR>
map  <silent> <s-tab>  <Esc>:if &modifiable && !&readonly && 
     \                  &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
imap  <silent> <s-tab>  <Esc>:if &modifiable && !&readonly && 
     \                  &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
nmap  <C-q>    :wqa<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"taglist设置
let tlist_make_settings  = 'make;m:makros;t:targets'
let tlist_qmake_settings = 'qmake;t:SystemVariables'
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"特定文件类型设置
au BufNewFile,BufRead *.mxml set filetype=mxml
au FileType python setlocal et sta sw=2 sts=2
au BufNewFile,BufRead *.pro  set filetype=qmake
au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.qml set filetype=qml
"设置html文件的缩进
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
let g:html_indent_inctags = "html,body,head,tbody"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"CTAGS
" configure tags - add additional tags here or comment out not-used ones
set tags+=$VIM/vimfiles/ctags/cpp
set tags+=$VIM/vimfiles/ctags/mingw
set tags+=$VIM/vimfiles/ctags/qt4
" build tags of your own project with Ctrl-F12
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"个别插件设置
"-- snipMate-deprecate version 0
let g:snipMate = { 'snippet_version' : 1 }
"---airline空白字符检查关闭（会拖慢vim速度）
let g:airline_detect_whitespace=0

"snip-mate
let g:snips_author = "sbabybird"
let g:snips_email = "sbabybird@gmail.com"
let g:snips_github = "http://sbabybird.github.com"
