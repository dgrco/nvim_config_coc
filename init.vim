:set autoindent
:set mouse=a
:set number
:set relativenumber
:set shiftwidth=2
:set smartindent
:set softtabstop=2
:set tabstop=2

call plug#begin("~/.config/nvim/plugged")

Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}

call plug#end()

nnoremap <leader>v <cmd>CHADopen<cr>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

:colorscheme angr

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <CR> pumvisible() ? coc#_select_confirm() : "<CR>"

" setup tree-sitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}
EOF

command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
