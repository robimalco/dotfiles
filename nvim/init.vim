call plug#begin('~/.config/nvim/plugged')
Plug 'neovim/nvim-lspconfig'                        " LSP config
Plug 'nvim-lua/completion-nvim'                     " Autocompletion
Plug 'preservim/nerdtree'                           " Nerdtree
Plug 'kyazdani42/nvim-web-devicons'                 " Nerdtree icons
Plug 'psliwka/vim-smoothie'                         " Scrolling
Plug 'b3nj5m1n/kommentary'                          " Comment
Plug 'pseewald/vim-anyfold'                         " Folding
Plug 'vim-airline/vim-airline'                      " Status bar
Plug 'nvim-lua/popup.nvim'                          " For telescope
Plug 'nvim-lua/plenary.nvim'                        " For telescope
Plug 'nvim-telescope/telescope.nvim'                " For telescope
Plug 'nvim-telescope/telescope-fzy-native.nvim'     " For telescope
Plug 'pacha/vem-tabline'                            " For tabs
Plug 'ryanoasis/vim-devicons'                       " Icons
Plug 'miyakogi/conoline.vim'                        " Cursor highlight
Plug 'Xuyuanp/scrollbar.nvim'                       " Scrollbar
Plug 'tpope/vim-surround'                           " Sourround elements
Plug 'yggdroot/indentline'                          " Show line indentation
Plug 'neoclide/coc.nvim', {'branch': 'release'}     " Cocinstall plugings
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }  " Golang
call plug#end()

let g:coc_global_extensions = [
      \'coc-json',
      \'coc-html', 
      \'coc-go', 
      \'coc-tailwindcss',
      \'coc-sql',
      \'coc-python'
      \]

" Autostart
let g:conoline_auto_enable = 1
let g:indentLine_conceallevel=1

" Scrollbar settings
augroup ScrollbarInit
  autocmd!
  autocmd CursorMoved,VimResized,QuitPre * silent! lua require('scrollbar').show()
  autocmd WinEnter,FocusGained           * silent! lua require('scrollbar').show()
  autocmd WinLeave,BufLeave,BufWinLeave,FocusLost            * silent! lua require('scrollbar').clear()
augroup end

set hidden
set encoding=utf-8                          " The encoding displayed.
set fileencoding=utf-8                      " The encoding written to file.
scriptencoding utf-8                        " Set utf-8 as default script encoding

set number                                  " Line numbers on
set relativenumber                          " Dinamic line numbers
set showmode                                " Always show mode
set showcmd                                 " Show commands as you type them
set textwidth=120                           " Text width is 120 characters
set cmdheight=1                             " Command line height
set showmatch                               " Show matching brackets when text indicator is over them
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set ignorecase                              " Ignore case by default
set smartcase                               " Make search case sensitive only if it contains uppercase letters
set wrapscan                                " Search again from top when reached the bottom
set nohlsearch                              " Don't highlight after search
set completeopt=menuone,noinsert,noselect
set clipboard=unnamedplus                   " Always copy to clipboard
set conceallevel=1
set termguicolors                           " Better colors

" Folding
filetype plugin indent on                    " required
syntax on                                    " required
autocmd Filetype * AnyFoldActivate           " activate for all filetypes
set foldlevel=99                             " close all folds


" Autocompletion
lua require'lspconfig'.pyright.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.vuels.setup{ on_attach=require'completion'.on_attach }

" Mappings
nnoremap <up> <C-w>k
nnoremap <down> <C-w>j
nnoremap <left> <C-w>h
nnoremap <right> <C-w>l

" Mappings telescope
nnoremap <silent>ff <cmd>Telescope find_files<cr>
nnoremap <silent>fg <cmd>Telescope live_grep<cr>
nnoremap <silent>fb <cmd>Telescope buffers<cr>
nnoremap <silent>fh <cmd>Telescope help_tags<cr>

" Mapping tabbar
map <C-A-PageUp> <Plug>vem_move_buffer_left-
map <C-A-PageDown> <Plug>vem_move_buffer_right-
map <C-PageUp> :bp<CR>
map <C-PageDown> :bn<CR>