" <------------------------@tribhuwan-kumar------------------------>
" <-------------------------Neovim Settings------------------------->
:syntax on
:set wrap
:set number
:set autoread
:set smarttab
:set hlsearch
:set ignorecase
:set smartcase
:set splitright
:set autoindent
:set termguicolors
:set relativenumber
:set mouse=a
:set tabstop=4
:set expandtab
:set shiftwidth=4
:set laststatus=3
:set softtabstop=4
:set signcolumn=yes
:set ttimeoutlen=0
:set updatetime=300
:set encoding=UTF-8
:set completeopt-=preview 
set foldmethod=manual
:set clipboard=unnamedplus " system clipboard
:set timeoutlen=1500
" :set clipboard+=unnamedplus

" <-------------------------Plugins------------------------->
call plug#begin()

Plug 'tpope/vim-obsession' " Session Management
" Plug 'github/copilot.vim' " Copilot
Plug 'tpope/vim-surround' " Surrounding ysw
Plug 'tpope/vim-commentary' " For Commenting gcc & gc
Plug 'lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'norcalli/nvim-colorizer.lua' " Colorizer
Plug 'preservim/tagbar' " Tagbar for code navigation
Plug 'mg979/vim-visual-multi' " CTRL + N for multiple cursors
Plug 'windwp/nvim-autopairs' " For auto closing ( [ {
Plug 'sheerun/vim-polyglot'  " Plugin for syntax highlighting and language features
Plug 'lewis6991/gitsigns.nvim' " For git tracking
Plug 'nvim-lua/plenary.nvim' " Pop-up api
Plug 'aurum77/live-server.nvim' " Live Server
Plug 'gregsexton/MatchTag' " For matching html tags
Plug 'pocco81/auto-save.nvim' " Auto Save
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy finder
Plug 'tribhuwan-kumar/CodeRunner' " Code Runner

Plug 'honza/vim-snippets' " snippets
Plug 'catppuccin/nvim', { 'as': 'catppuccin' } " theme
Plug 'tribhuwan-kumar/custom-vim-airline' " Airline
Plug 'ThePrimeagen/harpoon' " Harpoon
Plug 'lukas-reineke/indent-blankline.nvim' " Indent line
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'} " Markdown preview
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Better syntax highlighting
Plug 'tribhuwan-kumar/NVIMColorPicker' " Colorpicker

" Neotree & its dependencies
Plug 'nvim-tree/nvim-web-devicons'
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-neo-tree/neo-tree.nvim'

" Auto-completion for different file types 
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

" Wilder for Nvim command mode 
Plug 'gelguy/wilder.nvim', { 'do': 'UpdateRemotePlugins' }
Plug 'romgrk/fzy-lua-native', { 'do': 'make' }

" Debugger
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'nvim-neotest/nvim-nio'

" Language specific DAP
Plug 'mfussenegger/nvim-dap-python' " For python

" For database
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'

Plug 'ryanoasis/vim-devicons' " Developer Icons
Plug 'segeljakt/vim-silicon' " For screenshot
call plug#end()


" <-------------------------Paths & Variables-------------------------->
" paths
let g:tagbar_ctags_bin =  '/usr/bin/ctags' " Tagbar exburenant ctags path
let g:python3_host_prog = "/usr/bin/python3" " Python bin path

" <-------------------------Keybindings------------------------->
" let mapleader = "z" " My binding
let mapleader = "\<Space>" " for better convinience

" Help doc
nnoremap <Leader>h K<CR>

" Exit by 'Esc' in terminal mode
tnoremap <Esc> <C-\><C-n>

" Cursor navigation
:noremap j gj
:noremap k gk

" Tab management
nnoremap <C-o> :b#<CR>
nnoremap <C-i> :tabp<CR>

" Insert mode keybindings
inoremap <C-O> <C-o>o
inoremap <C-b> <C-o>diw

" Increase, decrease & scroll
nnoremap <C-e> <C-a>
nnoremap <C-p> <C-e>
nnoremap <C-b> diw

" Navigation in windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Commentary
nnoremap <C-_> :Commentary<CR>
vnoremap <C-_> :Commentary<CR>
nnoremap <Leader>/ :Commentary<CR>
vnoremap <Leader>/ :Commentary<CR>
nnoremap gc :Commentary<CR>
vnoremap gc :Commentary<CR>

" FZF, Wrap, Tagbar keybindings 
nmap <F1> :TagbarToggle<CR>
nnoremap <C-c> :set nowrap<CR>
nnoremap <Leader>v <C-v>
nnoremap <Leader>f :FZF<CR>
nnoremap <Leader>k :q<CR>
nnoremap <Leader>p :vsplit \| terminal<CR>
nnoremap <Leader>b :botright split \| terminal<CR>
nnoremap <Leader>r :vsplit \| RunCode<CR>
nnoremap <Leader><Leader>b :botright split \| RunCode<CR>
nnoremap <Leader><Leader>p :tabnew \| term bash<CR>
nnoremap <Leader>R :source ~/.config/nvim/init.vim<CR>

" Prevent registering to clipboard
nnoremap S "_S
nnoremap c "_c
nnoremap d "_d
nnoremap D "_D
nnoremap C "_C
nnoremap X "+x
nnoremap xx dd
nnoremap dd "_dd
" Visual mode
vnoremap p "_dP
vnoremap d "_d
vnoremap D "_D
vnoremap c "_c

" For selecting strings by 'h,j,k,l' keys 
nnoremap <S-h> vh
nnoremap <S-j> vj
nnoremap <S-k> vk
nnoremap <S-l> vl

" Save, Cut, Undo, Redo, Selection & Yank keybindings
vmap <C-h> b
vmap <C-l> e
nmap ,p o<Esc>p==
nnoremap <C-s> :w<CR>
nnoremap <C-a> ggVG
vnoremap <BS> "_d
nnoremap <Leader>z ^vg_

" Short the SORROUNDINGS
"CUT with no REG
nnoremap c( "_ci(
nnoremap c) "_ci)
nnoremap c[ "_ci[
nnoremap c] "_ci]
nnoremap c{ "_ci{
nnoremap c} "_ci}
nnoremap c< "_ci<
nnoremap c> "_ci>
nnoremap c" "_ci"
nnoremap c' "_ci'
nnoremap c` "_ci`
nnoremap cw "_ciw
nnoremap cp "_cip
nnoremap ct "_cit

" Visually Select
nnoremap v( vi(
nnoremap v) vi)
nnoremap v[ vi[
nnoremap v] vi]
nnoremap v{ vi{
nnoremap v} vi}
nnoremap v< vi<
nnoremap v> vi>
nnoremap v" vi"
nnoremap v' vi'
nnoremap v` vi`
nnoremap vw viw
nnoremap vp vip
nnoremap vt vit

" Delete with no REG
nnoremap d( "_di(
nnoremap d) "_di)
nnoremap d[ "_di[
nnoremap d] "_di]
nnoremap d{ "_di{
nnoremap d} "_di}
nnoremap d< "_di<
nnoremap d> "_di>
nnoremap d" "_di"
nnoremap d' "_di'
nnoremap d` "_di`
nnoremap dw "_diw
nnoremap dp "_dip
nnoremap dt "_dit

" Yank
nnoremap y( yi(
nnoremap y) yi)
nnoremap y[ yi[
nnoremap y] yi]
nnoremap y{ yi{
nnoremap y} yi}
nnoremap y< yi<
nnoremap y> yi>
nnoremap y" yi"
nnoremap y' yi'
nnoremap y` yi`
nnoremap yw yiw
nnoremap yp yip
nnoremap yt yit

" CUT in REG
nnoremap q( ci(
nnoremap q) ci)
nnoremap q[ ci[
nnoremap q] ci]
nnoremap q{ ci{
nnoremap q} ci}
nnoremap q< ci<
nnoremap q> ci>
nnoremap q" ci"
nnoremap q' ci'
nnoremap q` ci`
nnoremap qw ciw
nnoremap qp cip
nnoremap qt cit

" Alt + arrow Up/Down or 'j,k' to move line up and down
inoremap <M-Up> <Esc>:m-2<CR>==gi
inoremap <M-Down> <Esc>:m+<CR>==gi
nnoremap <M-Up> :m-2<CR>==
nnoremap <M-Down> :m+<CR>==
nnoremap <M-j> :m .+1<CR>==
nnoremap <M-k> :m .-2<CR>==
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv


" <-----------------------------Indentline------------------------------------>
lua require("indentline-config")


" <-----------------------------Markdown------------------------------------>
let g:instant_markdown_theme = 'dark'
let g:instant_markdown_autostart = 0
let g:instant_markdown_allow_unsafe_content = 1


" <-------------------------Tresssitter----------------------------->
lua require('tree-sitter-config')


" <--------------------------Colorscheme---------------------------->
lua require('theme-config')


" <----------------------------Colorizer----------------------------->
lua require('colorizer').setup()


" <-------------------------Autopairs------------------------->
lua require("nvim-autopairs").setup {}
lua require('autopairs-config')


" <-----------------------------Neotree------------------------------------>
" config
lua require("Neotree-config")

" keybindings
nnoremap <C-z> :Neotree focus<CR>
nnoremap <Leader>q :Neotree toggle<CR>
nnoremap <C-q> :Neotree toggle<CR>


" <------------------------------Autorefresh---------------------------->
autocmd BufWritePost *  ColorizerReloadAllBuffers
autocmd BufWritePost,DirChanged * Gitsigns refresh
autocmd BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
autocmd BufNewFile,BufRead * setlocal formatoptions-=ro
au FileType html let b:coc_root_patterns = ['.git', '.env', 'tailwind.config.js', 'tailwind.config.cjs']


" <-----------------------------Gitsigns------------------------------------>
lua require('Gitsigns-Config')
set statusline+=%{get(b:,'gitsigns_status','')}

" keybindings
nnoremap <Leader>i :Gitsigns preview_hunk_inline<CR>
nnoremap <Leader>o :Gitsigns preview_hunk<CR>
nnoremap <Leader>u :Gitsigns reset_hunk<CR>
nnoremap <Leader>n :Gitsigns next_hunk<CR>
nnoremap <Leader>m :Gitsigns prev_hunk<CR>
nnoremap gs :Gitsigns stage_hunk<CR>
nnoremap gr :Gitsigns undo_stage_hunk<CR>


" <-----------------------------Copilot------------------------------------>
" global variable
let g:copilot_no_tab_map = v:true

" copilot keybindings
imap <C-L> <Plug>(copilot-accept-word)
imap <silent><script><expr> <C-A> copilot#Accept("\<CR>")


" <-----------------------------DAP------------------------------------>
" config
lua require("dapui").setup()
lua require('debugger')
lua require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
lua require('dap').set_log_level('DEBUG')

" debugger keybindings
nnoremap <Leader>db :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <Leader>dc :lua require'dap'.continue()<CR>
nnoremap <Leader>ds :lua require'dap'.step_into()<CR>
nnoremap <Leader>do :lua require'dap'.step_over()<CR>
nnoremap <Leader>dr :lua require'dap'.repl.open()<CR>


" <-----------------------------Coc------------------------------------>
" global variables
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-python', 'coc-clangd', 'coc-copilot', 'coc-vimlsp']

" accept auto complete by 'Tab' key & move up and down by 'C-j' and 'C-k' keys, 'C-l' for jump to definition 
:imap <C-J> <C-n> 
:imap <C-K> <C-p>
nnoremap <Leader>l :call CocActionAsync('jumpDefinition')<CR>
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"
" inoremap <silent><expr> <TAB> pumvisible() ? coc#_select_confirm() : "\<TAB>"

" coc filetype config
let g:coc_filetype_map = {
  \ 'htmldjango': 'html',
  \ 'blade': 'html',
  \ 'twig': 'html',
  \ 'jst': 'html',
  \ 'ejs': 'html',
  \ }

" List of CoC extensions needed
" friendly-snippets  
" coc-vimlsp  
" coc-snippets
" coc-prettier
" coc-html-css-support
" coc-html                                                                                        
" coc-copilot
" coc-tsserver
" coc-tslint-plugin
" coc-python
" coc-json
" coc-htmldjango
" coc-css
" coc-clangd
" @yaegassy/coc-tailwindcss3


" <-----------------------------Harpoon------------------------------------>
" config
lua require("harpoon").setup()

" keybindings
nnoremap <Leader>a  :lua require("harpoon.mark").add_file()<CR>
nnoremap <Leader>j :lua require("harpoon.ui").toggle_quick_menu()<CR>

" Jump to arround files
nnoremap <Leader>1 :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <Leader>2 :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <Leader>3 :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <Leader>4 :lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <Leader>5 :lua require("harpoon.ui").nav_file(5)<CR>
nnoremap <Leader>6 :lua require("harpoon.ui").nav_file(6)<CR>
nnoremap <Leader>7 :lua require("harpoon.ui").nav_file(7)<CR>
nnoremap <Leader>8 :lua require("harpoon.ui").nav_file(8)<CR>

" Use <Leader>w and <Leader>e for navigation when the Harpoon UI is open
nnoremap <Leader>w :lua require("harpoon.ui").nav_next()<CR>
nnoremap <Leader>e :lua require("harpoon.ui").nav_prev()<CR>


" <------------------------------Clipboard----------------------------->
" wl-clipboard 'sudo pacman -S wl-clipboard'
   let g:clipboard = {
     \   'copy': {
     \       '+': ['wl-copy', '--trim-newline'],
     \       '*': ['wl-copy', '--trim-newline'],
     \   },
     \   'paste': {
     \       '+': ['wl-paste', '--no-newline'],
     \       '*': ['wl-paste', '--no-newline'],
     \   },
     \ }


" <---------------------------Airline--------------------------------->
let g:airline#extensions#default#section_truncate_width = {
    \ 'b': 80,
    \ 'x': 70,
    \ 'y': 80,
    \ 'z': 40,
    \ 'warning': 40,
    \ 'error': 40,
    \ }

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" theme
let g:airline_theme='dark' 

" Airline symbols
let g:airline_section_z = '%2p%% %2l/%L:%1v'
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''

let g:airline#extensions#whitespace#enabled = 0
let g:airline_symbols.whitespace = 'Ξ'
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1

" Tagbar
let g:airline#extensions#tagbar#enabled = 0

" Airline with COC
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#coc#show_coc_status = 1
let g:airline#extensions#coc#warning_symbol = '   '
let g:airline#extensions#coc#error_symbol = ' '
let g:airline#extensions#coc#stl_format_err = '%C(%L)'
let g:airline#extensions#coc#stl_format_warn = '%C(%L)'


" <-----------------------------Wilder------------------------------------>
" ++once supported in Nvim 0.4+ and Vim 8.1+
autocmd CmdlineEnter * ++once call s:wilder_init() | call wilder#main#start()

function! s:wilder_init() abort
  call wilder#setup({
    \ 'modes': [':', '/', '?'],
    \ 'next_key': '<Tab>',
    \ 'previous_key': '<S-Tab>',
    \ 'accept_key': '<Down>',
    \ 'reject_key': '<Up>',
    \ 'enable_cmdline_enter': 0,
    \ })

  let s:highlighters = [
    \ wilder#pcre2_highlighter(),
    \ wilder#basic_highlighter(),
    \ ]

  call wilder#set_option('pipeline', wilder#branch(
    \ wilder#cmdline_pipeline({
    \   'fuzzy': 1,
    \   'fuzzy_filter': wilder#lua_fzy_filter(),
    \ }),
    \ wilder#python_search_pipeline(),
    \ ))

  call wilder#set_option('renderer', wilder#popupmenu_renderer(wilder#popupmenu_border_theme({
    \ 'highlights': {
    \   'border': 'Normal',
    \ },
    \ 'border': 'rounded',
    \ 'highlighter': s:highlighters,
    \ 'left': [' ', wilder#popupmenu_devicons()],
    \ 'right': [' ', wilder#popupmenu_scrollbar()],
    \ })))
endfunction


" <-----------------------------ColorPicker------------------------------------>
let g:NVIMColorPicker#InsertBefore#TheCursor = 1
nnoremap <Leader>s :ColorPicker<CR>
vnoremap <Leader>s :ColorPicker<CR>
inoremap <C-c> <C-o>:ColorPicker<CR>

" <-----------------------------Preview------------------------------------>
function! OpenPreview()
    setlocal previewheight=1
    let l:line = line('.')
    execute 'pedit +' . l:line . ' %'
endfunction

nnoremap <silent> gp :call OpenPreview()<CR>
nnoremap gq :pclose<CR>

" <-----------------------------Folds------------------------------------>
augroup RememberFolds
  autocmd!
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent! loadview
augroup END

" <-----------------------------Manage 'term' buffers----------------------------------->
function! s:deleteTermBuffers() abort
    for termBuf in filter(range(1, bufnr('$')), 'bufname(v:val) =~ "^term://"')
        execute 'bdelete! ' . termBuf
    endfor
endfunction

augroup CloseTerminalWindow
    autocmd!
    autocmd TermClose * call timer_start(10, { -> s:deleteTermBuffers() })
augroup END

" <-----------------------------Sources------------------------------------>
:setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
