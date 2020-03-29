set termguicolors
nnoremap -es :edit $VIMRC<CR>
nnoremap -s :w<CR>:source $VIMRC<CR>

let mapleader="-"
set nu
"let g:python3_host_prog = 'D:\tools\python3.7\python.exe'
set path+=**
set guifont =Courier:h20
set ignorecase
let g:EasyMotion_smartcase = 1
set cursorline
set tabstop=4       " Tab键替换的空格长度，默认8
set softtabstop=4   " 退格键退回缩进空格的长度
set shiftwidth=4    " 表示每一级缩进的长度
set expandtab       " 设置缩进用空格来表示""""
set autoindent
""set background=dark
highlight CursorLine guibg=Black 
nnoremap <S-u> :exe 'cd' wxtf<CR>
nnoremap <S-e> :NERDTreeToggle<CR>
inoremap -n <c-\><c-n>
noremap <Plug>(TzzTest) :echo "haha"<CR>
nmap tzz <Plug>(TzzTest)
"inoremap <c-o> <c-x><c-o>
inoremap " ""<ESC>i
inoremap ' ''<ESC>i
inoremap <c-j> <esc>
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap <c-d> <right>
inoremap <c-l> <right>
inoremap <c-a> <esc>A
inoremap <c-b> <Cr><esc>O
nnoremap -t :tabnew<CR>:terminal<CR>
nnoremap <s-c> caw
nnoremap <c-s> :update <cr>
tnoremap <c-j> <c-\><c-n>

set wildignorecase


set runtimepath +=~/.vim/tzzNvimPlugin

" Specify a directory for plugins
" " - For Neovim: ~/.local/share/nvim/plugged
" " - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'joshdick/onedark.vim'
Plug 'leafgarland/typescript-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sebdah/vim-delve'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'sebdah/vim-delve'
Plug 'joshdick/onedark.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'easymotion/vim-easymotion'

call plug#end()

"let g:LanguageClient_autoStart = 1

"let g:LanguageClient_serverCommands = {
"\ 'javascript': ['node','D:\\globalLib\nodejs\\javascript-typescript-langserver-master\\lib\\language-server-stdio.js'],
"     \ 'go': ['gopls'],
"    \ }


"nnoremap <F5> :call LanguageClient_contextMenu()<CR>

" Or map each action separately
" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
"



""let g:go_def_mode='gopls'
""let g:go_info_mode='gopls'
let g:love2dPath='D:\projects\megasource\libs\love\src'
let g:goPlayground ='D:\projects\goPlayground\'

let list =["c","javascript","typescript","cpp","go","rust"]

augroup tzz
	au!
	""autocmd FileType c,javascript,typescript,cpp nmap <buffer> <c-]> :w<CR><Plug>(coc-definition)
	exec "autocmd FileType " . join(list,",") . " inoremap <silent><expr> <c-o> coc#refresh()" 
	exec "autocmd FileType " . join(list,",") . " nmap <buffer> <c-]> :up<CR><Plug>(coc-definition)" 
	exec "autocmd FileType " . join(list,",") . " nmap <buffer> <c-n> <Plug>(coc-diagnostic-next)" 
	exec "autocmd FileType " . join(list,",") . " nmap <buffer> <s-f> <Plug>(coc-diagnostic-info)" 
	exec "autocmd FileType " . join(list,",") . "  nmap <buffer> <c-h> :up<CR><Plug>(coc-references)" 
	""autocmd FileType c,javascript,typescript,cpp inoremap <silent><expr> <c-o> coc#refresh()
	""autocmd FileType go inoremap  <c-o> <c-x><c-o>
	autocmd FileType go,ts,c call TzzInitGoSyntax()
augroup end

""nmap -f <Plug>(coc-format)
command! Tzz echo 1112
command! NF NERDTreeFind

"set wildignore+=*.js

command! Fmt normal gg<s-v>G=

command! CocImpl normal <Plug>(coc-implementation)
command! CocDef normal <Plug>(coc-definition)
command! CocRef normal <Plug>(coc-references)
command! CocTypeDef normal <Plug>(coc-type-definition)

set nowrap

function! TzzInitGoSyntax()
	syntax keyword tzzTodo todo note
	highlight link tzzTodo Todo
	syntax match tzzGoComment /\/\/.*/ contains=tzzTodo 
	highlight link tzzGoComment Comment
endfunction

hi NormalFloat guifg=White
""hi CursorIM guifg=Green  guibg=NONE
hi lCursor guifg=Green guibg=Black

function! TestEcho(param)
	echom a:param
	return 10
endfunction

let name="tzz"

command! -nargs=1 TestCmd call TestEcho(<args>)


inoremap ) <Cmd> call GetCursorChar()<Cr>
nnoremap -nn :NERDTree<Cr>
nnoremap -nf :NERDTreeFind<Cr>
nnoremap -nc :NERDTreeClose<Cr>


nnoremap -c :call TzzcdFile()<Cr>

function! Enter()

endfunction!
""hi Normal guibg=NONE ctermbg=NONE
let g:go_gopls_enabled = 0
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
            \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
            \,sm:block-blinkwait175-blinkoff150-blinkon175
highlight Comment guifg=Red
inoremap <c-n> <c-x><c-n>
inoremap <c-p> <c-x><c-p>

syntax enable
colorscheme desert
nnoremap -w :up<cr>
inoremap -a <esc>A
nnoremap <s-u> :b#<cr>
nmap <Leader>g <Plug>(easymotion-s2)

