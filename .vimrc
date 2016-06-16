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

" map [...] {lhs} {rhs} $B$,(BKey mapping$B$N4pK\$N7A(B
" map$B$H$O!"%$%s%5!<%H!JA^F~%b!<%I!K$N;~$K;H$($k%(%$%j%"%9$N$h$&$J$b$N(B
" noremap$B$H$O!"(B{rhs}$B$KB>$N(BKey mapping$B$N(B{lhs}$B$,4^$^$l$F$$$?>l9g!"(B
" $B$=$l$,:F5"E*$KE83+$5$l$J$$7A<0!#(B
" map$B$@$H:F5"E*$KE83+$5$l$k!#(B
" $B$D$^$j(BKey mapping$B$N;H$$2s$7$r$7$?$+$C$?$i(Bmap$B$GDj5A$9$Y$-!#(B

" [$B$HBG$C$?$i(B[]$B$HF~NO$5$l$F$7$+$b%+!<%=%k$,3g8L$NCf$K$$$k!J0J2<F1MM!K(B
inoremap [ []<left>
inoremap ( ()<left>
inoremap { {}<left>
inoremap < <><left>
inoremap " ""<left>
inoremap ' ''<left>


" nmap$B$H$O%N!<%^%k%b!<%I$N;~$K;H$($k%-!<%^%C%T%s%0!J%(%$%j%"%9$N$h$&$J$b$N!K(B
" 2$B2s(Besc$B$r2!$7$?$i8!:w$N%O%$%i%$%H$r$d$a$k(B
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



