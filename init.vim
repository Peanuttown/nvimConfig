""set termguicolors 
nnoremap -es :edit $VIMRC<CR>
nnoremap -ees :w<CR>:source $VIMRC<CR>
nnoremap -s caw

let mapleader="-"
set nu
"let g:python3_host_prog = 'D:\tools\python3.7\python.exe'
set path+=**
set guifont =Courier:h20
set ignorecase
let g:EasyMotion_smartcase = 1
set smartcase
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
inoremap <c-f> <right>
inoremap <c-l> <esc>o
inoremap <c-a> <esc>A
inoremap <c-b> <left>
inoremap <c-e> <esc><left>wa

nnoremap -tt :tabnew<CR>:terminal<CR>
nnoremap -tv :vs<CR>:terminal<CR>
nnoremap -tc :terminal<CR>
nnoremap <s-c> caw
nnoremap <c-s> :update <cr>
tnoremap <c-j> <c-\><c-n>

set wildignorecase


set runtimepath +=~/.vim/tzzNvimPlugin

" Specify a directory for plugins
" " - For Neovim: ~/.local/share/nvim/plugged
" " - Avoid using standard Vim directory names like 'plugin'
""call plug#begin('/data/vimplugged')
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'leafgarland/typescript-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
""Plug 'sebdah/vim-delve'
Plug 'fatih/vim-go', 
""Plug 'sebdah/vim-delve'
Plug 'joshdick/onedark.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'easymotion/vim-easymotion'
Plug 'Peanuttown/tzzNvimPlugin'
""Plug 'neovim/nvim-lsp'
Plug 'peanuttown/tzzNvimPlugin'
Plug 'liuchengxu/space-vim-theme'
Plug 'tpope/vim-fugitive'

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
	""""exec "autocmd FileType " . join(list,",") . " inoremap <silent><expr> <c-o> coc#refresh()" 
	exec "autocmd FileType " . join(list,",") . " nmap <buffer> <c-]> :up<CR><Plug>(tzz_go_to_definition)" 
	exec "autocmd FileType " . join(list,",") . " nmap <buffer> <c-n> <Plug>(tzz_go_to_next_err)" 
	exec "autocmd FileType " . join(list,",") . " nmap <buffer> <s-f> <Plug>(coc-diagnostic-info)" 
	exec "autocmd FileType " . join(list,",") . "  nmap <buffer> <c-h> :up<CR><Plug>(tzz_find_references)" 
	""autocmd FileType c,javascript,typescript,cpp inoremap <silent><expr> <c-o> coc#refresh()
	""autocmd FileType go inoremap  <c-o> <c-x><c-o>
	autocmd FileType go,ts,c call TzzInitGoSyntax()
augroup end

let g:tzz_lsp_coc =1 
if exists("g:tzz_lsp_coc")
    augroup tzz_lsp
        au!
        exec "autocmd FileType " . join(list,",") . " inoremap <silent><expr> <c-o> coc#refresh()" 
    augroup end
    nmap <Plug>(tzz_go_to_definition) <Plug>(coc-definition)
    nmap <Plug>(tzz_go_to_next_err) <Plug>(coc-diagnostic-next)
    nmap <Plug>(tzz_find_references) <Plug>(coc-references)
endif


""call tzz#RequireLua("tzzLsp.lua")
""lua tzz_lsp_go_setup()
""let g:tzz_lsp_nvim=1
if exists("g:tzz_lsp_nvim")
    augroup tzz_lsp
        au!
        exec "autocmd FileType " . join(list,",") . " inoremap <silent><expr> <c-o> v:lua.vim.lsp.omnifunc()" 
    augroup end
    nmap <Plug>(tzz_go_to_definition) <cmd>lua vim.lsp.buf.definition()<CR>
    nmap <Plug>(tzz_go_to_next_err) <Plug>(coc-diagnostic-next)
    nmap <Plug>(tzz_find_references) <cmd>lua vim.lsp.buf.references()<CR>
endif


     



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



command! -nargs=1 TestCmd call TestEcho(<args>)


inoremap ) <Cmd> call MoveIfLeftParenthese()<Cr>
inoremap <cr> <Cmd> call TzzEnter()<Cr>
nnoremap -nn :NERDTree<Cr>
nnoremap -nf :NERDTreeFind<Cr>
nnoremap -nc :NERDTreeClose<Cr>


nnoremap -c :call TzzcdFile()<Cr>

function! Enter()

endfunction!
hi Normal guibg=NONE ctermbg=NONE
""hi Normal guibg=NONE ctermbg=NONE
let g:go_gopls_enabled = 0
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
            \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
            \,sm:block-blinkwait175-blinkoff150-blinkon175
highlight Comment guifg=Red
inoremap <c-n> <c-x><c-n>
inoremap <c-p> <c-x><c-p>

syntax enable
nnoremap -w :up<cr>
inoremap -a <esc>A
inoremap <c-s> <esc><s-s>
nnoremap <s-u> :b#<cr>
nnoremap -b :Buffers<cr>
nnoremap -f :Files<cr>
nnoremap -vs :vs<cr> <c-w>l
nnoremap -q :q<cr>
nmap <Leader>g <Plug>(easymotion-s2)
let g:coc_disable_startup_warning=1


nnoremap <m-1> :tabfirst<CR>
nnoremap <m-2> 2gt
nnoremap <m-3> 3gt
nnoremap <m-4> 4gt
inoremap <c-s> <esc>S


nnoremap -ec :e %:p


nn <m-1> 1gt
nn <m-2> 2gt
nn <m-3> 3gt
nn <m-4> 4gt

" emoj
ab :pushpin: 📌
ab :flower: 🌸
ab :devil: 😈
ab :tada: 🎉

set background=light
colorscheme space_vim_theme
""let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'

if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

