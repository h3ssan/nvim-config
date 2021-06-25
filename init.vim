set syntax=on
set number
set relativenumber
set nohlsearch
set incsearch


" Remapping
let mapleader = " "
inoremap ,, <Esc>
nnoremap <Leader>f :NERDTreeToggle<CR>
" Windows
nnoremap <Leader>h :new<CR>
nnoremap <Leader>v :vnew<CR>


call plug#begin('~/.config/nvim/plugged')

" C/C++ autocomplete; Must install `clang`
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Nerd file tree
Plug 'scrooloose/nerdtree'

" Nerd Commenter
Plug 'scrooloose/nerdcommenter'

" colorscheme
Plug 'morhetz/gruvbox'

" css3 syntax highlight
Plug 'hail2u/vim-css3-syntax'

" highlight colors
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

" less syntax highlight
Plug 'groenewege/vim-less'

" Elixir syntax highlight
Plug 'elixir-editors/vim-elixir'

" Shakespeare (Yesod templating)
Plug 'pbrisbin/vim-syntax-shakespeare'

" file tree
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }

" fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" commenting text
Plug 'tpope/vim-commentary'

" git wrapper
Plug 'tpope/vim-fugitive'

" Syntax highlight for .tsx
Plug 'ianks/vim-tsx', { 'for': 'typescript.tsx' }

" Syntax highlight for .ts
Plug 'HerringtonDarkholme/yats.vim', { 'for': 'typescript' }

" Syntax hightlight for .jsx
Plug 'mxw/vim-jsx'

" Syntax hightlight for .js
Plug 'pangloss/vim-javascript'

" Show indentation
Plug 'Yggdroot/indentLine'

" Highlink yank for a second
Plug 'machakann/vim-highlightedyank'

" Visual local history
Plug 'sjl/gundo.vim'

" Surround text with something
Plug 'tpope/vim-surround'

" Allow repeating of custom commands like surround
Plug 'tpope/vim-repeat'

" Typescript autocomplete
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-pairs', {'do': 'yarn install --frozen-lockfile'}
Plug 'iamcco/coc-angular', {'do': 'yarn install --frozen-lockfile && yarn build'}
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}

" Haskell highlighting
Plug 'neovimhaskell/haskell-vim'

" Markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}

" Handlebars highlight
Plug 'mustache/vim-mustache-handlebars'

" Smart replace, abbreviations, convert case
Plug 'tpope/vim-abolish'

" Multifile replace
Plug 'wincent/ferret'

" Show list of merge conflicts
Plug 'wincent/vcs-jump'

" Functions for manipulating highlight groups
Plug 'wincent/pinnacle'

" Vim elm syntax
Plug 'andys8/vim-elm-syntax'

call plug#end()

" Rename tabs to show tab number.
if exists("+showtabline")
    function! MyTabLine()
        let s = ''
        let wn = ''
        let t = tabpagenr()
        let i = 1
        while i <= tabpagenr('$')
            let buflist = tabpagebuflist(i)
            let winnr = tabpagewinnr(i)
            let s .= '%' . i . 'T'
            let s .= (i == t ? '%1*' : '%2*')
            let s .= ' '
            let wn = tabpagewinnr(i,'$')

            let s .= '%#TabNum#'
            let s .= i
            " let s .= '%*'
            let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
            let bufnr = buflist[winnr - 1]
            let file = bufname(bufnr)
            let buftype = getbufvar(bufnr, 'buftype')
            if buftype == 'nofile'
                if file =~ '\/.'
                    let file = substitute(file, '.*\/\ze.', '', '')
                endif
            else
                let file = fnamemodify(file, ':p:t')
            endif
            if file == ''
                let file = '[No Name]'
            endif
            let s .= ' ' . file . ' '
            let i = i + 1
        endwhile
        let s .= '%T%#TabLineFill#%='
        let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
        return s
    endfunction
    set stal=2
    set tabline=%!MyTabLine()
    set showtabline=1
    highlight link TabNum Special
endif
