set termguicolors
nnoremap -es :edit $VIMRC<CR>
nnoremap -s :w<CR>:source $VIMRC<CR>
set nu 
let g:python3_host_prog = 'D:\tools\python3.7\python.exe'
let wxtf="D:\\projects\\justGun"
set path+=**
set guifont =Courier:h15
set ignorecase
set cursorline
syntax on
set background=dark
colorscheme solarized8
highlight CursorLine guibg=Black
nnoremap <S-u> :exe 'cd' wxtf<CR>
nnoremap <S-e> :NERDTreeToggle<CR>
inoremap -n <c-\><c-n>

noremap -c caw
noremap <Plug>(TzzTest) :echo "haha"<CR>
nmap tzz <Plug>(TzzTest)
"inoremap <c-o> <c-x><c-o>
inoremap " ""<ESC>i
inoremap < <><ESC>i
inoremap ' ''<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap <c-CR> <CR><ESC>O
inoremap <c-d> <right>
inoremap <s-cr> <esc>o
inoremap <c-f> <right>


" Specify a directory for plugins
" " - For Neovim: ~/.local/share/nvim/plugged
" " - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

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

let list =["c","javascript","typescript","cpp","go"]

augroup tzz
	au!
	""autocmd FileType c,javascript,typescript,cpp nmap <buffer> <c-]> :w<CR><Plug>(coc-definition)
	exec "autocmd FileType " . join(list,",") . " inoremap <silent><expr> <c-o> coc#refresh()" 
	exec "autocmd FileType " . join(list,",") . " nmap <buffer> <c-]> :w<CR><Plug>(coc-definition)" 
	exec "autocmd FileType " . join(list,",") . " nmap <buffer> <c-n> <Plug>(coc-diagnostic-next)" 
	exec "autocmd FileType " . join(list,",") . " nmap <buffer> <s-f> <Plug>(coc-diagnostic-info)" 
	""autocmd FileType c,javascript,typescript nmap <buffer> <c-i> :w<CR><Plug>(coc-references)
	""autocmd FileType c,javascript,typescript,cpp inoremap <silent><expr> <c-o> coc#refresh()
	""autocmd FileType go inoremap  <c-o> <c-x><c-o>
	autocmd FileType go,ts,c call TzzInitGoSyntax()
augroup end

nmap -f <Plug>(coc-format)
command! Tzz echo 1112

set wildignore+=*.js

command! Fmt normal gg<s-v>G=


set nowrap

function! TzzInitGoSyntax()
	syntax keyword tzzTodo todo note
	highlight link tzzTodo Todo
	syntax match tzzGoComment /\/\/.*/ contains=tzzTodo 
	highlight link tzzGoComment Comment
endfunction
hi Normal guibg=NONE ctermbg=NONE
