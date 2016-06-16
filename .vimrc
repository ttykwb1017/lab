set number
set cursorline
set cursorcolumn
set laststatus=2
set cmdheight=2
set showmatch
set helpheight=999
set scrolloff=8
set sidescrolloff=12
set confirm
set hidden
set autoread
set nobackup
set noswapfile
set hlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan
set gdefault
set autoindent
set expandtab
set tabstop=3
set shiftwidth=3
set softtabstop=3
set smartindent
set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjia,utf-8
set imdisable
set fenc=utf-8

" map [...] {lhs} {rhs} がKey mappingの基本の形
" mapとは、インサート（挿入モード）の時に使えるエイリアスのようなもの
" noremapとは、{rhs}に他のKey mappingの{lhs}が含まれていた場合、
" それが再帰的に展開されない形式。
" mapだと再帰的に展開される。
" つまりKey mappingの使い回しをしたかったらmapで定義すべき。

" [と打ったら[]と入力されてしかもカーソルが括弧の中にいる（以下同様）
inoremap [ []<left>
inoremap ( ()<left>
inoremap { {}<left>
inoremap < <><left>
inoremap " ""<left>
inoremap ' ''<left>


" nmapとはノーマルモードの時に使えるキーマッピング（エイリアスのようなもの）
" 2回escを押したら検索のハイライトをやめる
nnoremap <Esc><Esc> :nohlserach<CR><Esc>

function! s:WithoutBundles()
   colorscheme desert
endfunction

function! s:LoadBundles()
   call neobundle#begin(expand('~/.vim/bundle/'))
   NeoBundleFetch 'Shougo/neobundle.vim'
   NeoBundle 'Shougo/neobundle.vim'
   NeoBundle 'tpope/vim-surround'
   NeoBundle 'altercation/vim-colors-solarized'
   NeoBundle 'croaker/mustang-vim'
   NeoBundle 'jeffreyiacono/vim-colors-wombat'
   NeoBundle 'nanotech/jellybeans.vim'
   NeoBundle 'vim-scripts/Lucius'
   NeoBundle 'vim-scripts/Zenburn'
   NeoBundle 'mrkn/mrkn256.vim'
   NeoBundle 'jpo/vim-railscasts-theme'
   NeoBundle 'therubymug/vim-pyte'
   NeoBundle 'tomasr/molokai'
   NeoBundle 'Shougo/unite.vim'
   NeoBundle 'ujihisa/unite-colorscheme'
   call neobundle#end()
endfunction

function! s:InitNeoBundle()
   if isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
      filetype plugin indent off
      if has('vim_starting')
         set runtimepath+=~/.vim/bundle/neobundle.vim/
      endif
      try
         call neobundle#begin(expand('~/.vim/bundle/'))
         NeoBundleFetch 'Shougo/neobundle.vim'
         call neobundle#end()
         call s:LoadBundles()
      catch
         call s:WithoutBundles()
      endtry
   else
      call s:WithoutBundles()
   endif

   filetype indent plugin on
   syntax on
endfunction

call s:InitNeoBundle()

colorscheme molokai
set t_Co=256

" add"



