set number
set nocompatible              " be iMproved, required
filetype off                  " required

set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

" Uncomment the following to have Vim jump to the last position when
" " reopening a file
if has("autocmd")
   au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

execute pathogen#infect()
syntax on
filetype plugin indent on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'fatih/vim-go'

Plugin 'Valloric/YouCompleteMe'

" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

Plugin 'davidhalter/jedi-vim'

Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'tacahiroy/ctrlp-funky'

Plugin 'tmhedberg/SimpylFold'

Plugin 'vim-scripts/indentpython.vim'

Plugin 'scrooloose/syntastic'

Plugin 'nvie/vim-flake8'

Plugin 'jnurmine/Zenburn'

Plugin 'altercation/vim-colors-solarized'

Plugin 'scrooloose/nerdtree'

Plugin 'jistr/vim-nerdtree-tabs'

Plugin 'tpope/vim-fugitive'

Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" hilight function name {
" 下面两行为了匹配函数名的，为下面的给函数名定义颜色做准备)
autocmd BufNewFile,BufRead * :syntax match cfunctions "\<[a-zA-Z_][a-zA-Z_0-9]*\>[^()]*)("me=e-2 
autocmd BufNewFile,BufRead * :syntax match cfunctions "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*("me=e-1
" 这一行就是给函数名加颜色的
hi cfunctions ctermfg=81

hi Type ctermfg=118 cterm=none
hi Structure ctermfg=118 cterm=none
hi Macro ctermfg=161 cterm=bold
hi PreCondit ctermfg=161 cterm=bold

" 设置光标行，效果相当棒，光标移到哪一行，哪一行的行号就变成了浅黄色，相当的动感
set cursorline

" 这句我给注掉了，是让光标所在行整一行都显示下划线的，就是加一条水平下划线
" hi CursorLine cterm=underline  
"}


"gotargs {
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }
"}


"powerline{
set guifont=PowerlineSymbols\ for\ Powerline
set nocompatible
let g:Powerline_symbols = 'fancy'
"}


" vim-go mapping {
" set mapleader
let mapleader = ","

" vim-go custom mappings
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>e <Plug>(go-rename)
" } 
" vim-go settings {
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
"}

" YCM settings {
let g:ycm_key_list_select_completion = ['', '']
let g:ycm_key_list_previous_completion = ['']
let g:ycm_key_invoke_completion = ''
let g:ycm_disable_for_files_larger_than_kb = 10240 
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
" }


" UltiSnips setting {
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
"}


"  tagbar
nmap <F8> :TagbarToggle<CR>


" 目录浏览器 nerdtree {
" map <C-t> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
" }


"taglist{
let Tlist_Show_One_File = 1
"只显示当前文件的taglist，默认是显示多个
let Tlist_Exit_OnlyWindow = 1
"如果taglist是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist
let Tlist_GainFocus_On_ToggleOpen = 1
"打开taglist时，光标保留在taglist窗口
let Tlist_Ctags_Cmd='/usr/bin/ctags'
"设置ctags命令的位置
nnoremap <leader>tl : Tlist<CR>
"设置关闭和打开taglist窗口的快捷键
"}

set cc=81
set ff=unix
set tabstop=4
set softtabstop=4
set shiftwidth=4
set nosmarttab
set expandtab
set hlsearch
set autoindent

set autowrite
set makeprg=go\ build\ -o\ $GOPATH/bin/asterisk\ asterisk

" 分割布局 {
set splitbelow
set splitright
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" }

" SimpylFold { 
" Python 代码折叠
" Enable folding
set foldlevel=99
set foldmethod=indent

" Enable folding with the spacebar
nnoremap <space> za
let g:SimpylFold_docstring_preview=1
" }

" indentpython.vim {
" Python代码缩进
au BufNewFile,BufRead *.py
    \ set tabstop=4     |
    \ set softtabstop=4 |
    \ set shiftwidth=4  |
    \ set textwidth=79  |
    \ set expandtab     |
    \ set autoindent    |
    \ set fileformat=unix

hi BadWhitespace guifg=gray guibg=red ctermfg=gray ctermbg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
" }

" 支持Virtualenv虚拟环境 {
"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF
" }

" Python 语法检查/高亮 {
syntax on
let python_highlight_all=1
" }

" color scheme {
set t_Co=256
colorscheme molokai

"if has('gui_running')
"  set background=dark
"  colorscheme solarized
"else
"  colorscheme zenburn
"endif
"}

function! PythonFmt()
    let f = expand("%:p")
    let cmd = printf("grep %s %s", '"\s\+$"', f)
    let output = system(cmd)
    if v:shell_error
        return
    endif
    %s/\s\+$//g
endfunction

if has("autocmd")
    autocmd BufWritePost *.py call PythonFmt()
endif

set cursorline
set cursorcolumn
highlight CursorLine   cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
highlight CursorColumn cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
