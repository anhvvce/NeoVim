" Vim plugin
call plug#begin('~/.config/nvim')
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'projekt0n/github-nvim-theme'
    Plug 'vim-python/python-syntax'
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'L3MON4D3/LuaSnip'
    Plug 'nvim-tree/nvim-web-devicons'
call plug#end()

set termguicolors
colorscheme github_dark_high_contrast

" Indention Options
set autoindent
set expandtab
set shiftround
set shiftwidth=4
set smarttab
set tabstop=4
set smartindent

" Search Options
set hlsearch
set ignorecase
set incsearch
set smartcase

" Performance Options
set complete-=i
set lazyredraw

" Text Rendering Options
set display+=lastline
set encoding=utf-8
set linebreak
syntax enable
syntax on
set wrap

" User Interface Options
set laststatus=2
set ruler
set wildmenu
set tabpagemax=10
set cursorline
set number
set mouse=a
set title
set background=dark

" Code Folding Options
set foldmethod=indent
set foldnestmax=3
set nofoldenable

" Miscellaneous Options
set autoread
set backspace=indent,eol,start
set confirm
set formatoptions+=j
set hidden
set history=500
set nomodeline
set noswapfile
set filetype=c
filetype plugin indent on

let g:python_highlight_all = 1
let g:lightline = {'colorscheme': 'github_dark_high_contrast'}

" Automatically append closing characters
inoremap        (  ()<Left>
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>": ")"
inoremap        {  {}<Left>
inoremap <expr> }  strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
inoremap        [  []<Left>
inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<Right>" : "\'\'\<Left>"
inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\"\"\<Left>"

lua << EOF
vim.lsp.enable('pylsp')
vim.lsp.config('pylsp', {
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = { enabled = false },
        pylint = { enabled = false },
        jedi_completion = { fuzzy = true },
      },
    },
  },
})

local cmp = require'cmp'
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = {
    { name = 'nvim_lsp' },
  }
})
EOF

