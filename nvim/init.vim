set mouse=a
set number
set relativenumber
syntax on
set noswapfile
let mapleader = " "
set background=dark
set tabstop=4
set nuw=8
set clipboard+=unnamedplus

inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap ' ''<Esc>i
inoremap " ""<Esc>i


inoremap jj <Esc>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <C-j> :bprev<CR>
nnoremap <C-k> :bnext<CR>
nnoremap <Leader>x :bd<CR>

nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <Leader><cr> :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fr <cmd>Telescope resume<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>

nnoremap <silent><nowait> <Leader>a  :<C-u>CocList diagnostics<cr>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

call plug#begin()
 " Plugin Section
 Plug 'scrooloose/nerdtree'
 Plug 'Xuyuanp/nerdtree-git-plugin'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
 Plug 'morhetz/gruvbox'
 Plug 'airblade/vim-gitgutter'
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
 Plug 'nvim-lua/plenary.nvim'
 Plug 'nvim-telescope/telescope.nvim'
 Plug 'fatih/vim-go'
 Plug 'tpope/vim-fugitive'
 Plug 'tpope/vim-rhubarb'
 Plug 'elixir-editors/vim-elixir'
 Plug 'mhinz/vim-mix-format'
 Plug 'mg979/vim-visual-multi', {'branch': 'master'}
 Plug 'edluffy/hologram.nvim'
 Plug 'Lommix/godot.nvim'
call plug#end()

lua require('init')

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme = 'powerlineish'
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1

"let g:go_fmt_command = "goimports"
"let g:go_fmt_autosave = 0
let g:mix_format_on_save = 1

colorscheme gruvbox
