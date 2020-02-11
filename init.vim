set termguicolors
nnoremap -es :edit $VIMRC<CR>
nnoremap -s :w<CR>:source $VIMRC<CR>

set nu
"let g:python3_host_prog = 'D:\tools\python3.7\python.exe'
set path+=**
set guifont =Courier:h20
set ignorecase
set cursorline
set autoindent
set expandtab
syntax on
""set background=dark
colorscheme desert
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



"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

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
	exec "autocmd FileType " . join(list,",") . "  nmap <buffer> <c-h> :w<CR><Plug>(coc-references)" 
	""autocmd FileType c,javascript,typescript,cpp inoremap <silent><expr> <c-o> coc#refresh()
	""autocmd FileType go inoremap  <c-o> <c-x><c-o>
	autocmd FileType go,ts,c call TzzInitGoSyntax()
augroup end

nmap -f <Plug>(coc-format)
command! Tzz echo 1112

"set wildignore+=*.js

command! Fmt normal gg<s-v>G=

command! CocImpl normal <Plug>(coc-implementation)
command! CocDef normal <Plug>(coc-definition)
command! CocRef normal <Plug>(coc-references)

set nowrap

function! TzzInitGoSyntax()
	syntax keyword tzzTodo todo note
	highlight link tzzTodo Todo
	syntax match tzzGoComment /\/\/.*/ contains=tzzTodo 
	highlight link tzzGoComment Comment
endfunction

hi Normal guibg=NONE ctermbg=NONE
hi NormalFloat guifg=White
hi CursorIM guifg=Green  guibg=NONE
hi lCursor guifg=Green guibg=Black
""colorscheme solarized8

function! TestEcho(param)
	echom a:param
	return 10
endfunction

let name="tzz"

command! -nargs=1 TestCmd call TestEcho(<args>)


inoremap ) <Cmd> call GetCursorChar()<Cr>
nnoremap -n :NERDTree<Cr>
nnoremap -c :call TzzcdFile()<Cr>

function! Enter()



endfunction!
