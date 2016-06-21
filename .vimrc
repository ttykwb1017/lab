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
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smartindent
set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjia,utf-8
set imdisable
set fenc=utf-8
" $B9THV9f$N?'(B
"highlight LineNr ctermfg=yellow

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
   NeoBundle 'Shougo/neomru.vim'
   " $B%U%!%$%k$r(Btree$BI=<($7$F$/$l$k(B
   NeoBundle 'scrooloose/nerdtree'
   " $B%$%s%G%s%H$K?'$rIU$1$F8+$d$9$/$9$k(B
   NeoBundle 'nathanaelkane/vim-indent-guides'
   " $B9TKv$NH>3Q%9%Z!<%9$r2D;k2=(B
   NeoBundle 'bronson/vim-trailing-whitespace'
   "$B%9%K%Z%C%H$NF3F~(B
   NeoBundle 'Shougo/neocomplete'
   NeoBundle 'Shougo/neosnippet'
   NeoBundle 'Shougo/neosnippet-snippets'
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

" Unit.vim$B$N@_Dj(B
" """"""""""""""""""""""""""""""
" " $BF~NO%b!<%I$G3+;O$9$k(B
 let g:unite_enable_start_insert=1
" " $B%P%C%U%!0lMw(B
 noremap <C-P> :Unite buffer<CR>
" " $B%U%!%$%k0lMw(B
 noremap <C-N> :Unite -buffer-name=file file<CR>
" " $B:G6a;H$C$?%U%!%$%k$N0lMw(B
 noremap <C-Z> :Unite file_mru<CR>
" " sources$B$r!V:#3+$$$F$$$k%U%!%$%k$N%G%#%l%/%H%j!W$H$9$k(B
 noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" " $B%&%#%s%I%&$rJ,3d$7$F3+$/(B
 au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
 au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
 " $B%&%#%s%I%&$r=D$KJ,3d$7$F3+$/(B
 au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
 au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
 " ESC$B%-!<$r(B2$B2s2!$9$H=*N;$9$k(B
 au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
 au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim$B$rN)$A>e$2$?$H$-$K!"<+F0E*$K(Bvim-indent-guides$B$r%*%s$K$9$k(B
 let g:indent_guides_enable_on_vim_startup = 1

" http://inari.hatenablog.com/entry/2014/05/05/231307
" """"""""""""""""""""""""""""""
" " $BA43Q%9%Z!<%9$NI=<((B
" """"""""""""""""""""""""""""""
 function! ZenkakuSpace()
     highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray"
 endfunction

 if has('syntax')
     augroup ZenkakuSpace
         autocmd!
         autocmd ColorScheme * call ZenkakuSpace()
         autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '$B!!(B')
     augroup END
     call ZenkakuSpace()
 endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" https://sites.google.com/site/fudist/Home/vim-nihongo-ban/-vimrc-sample
" """"""""""""""""""""""""""""""
" " $BA^F~%b!<%I;~!"%9%F!<%?%9%i%$%s$N?'$rJQ99(B
" """"""""""""""""""""""""""""""
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=darkyellow cterm=none'

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
   if a:mode == 'Enter'
      silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
      silent exec g:hi_insert
   else
      highlight clear StatusLine
      silent exec s:slhlcmd
   endif

endfunction

function! s:GetHighlight(hi)
   redir => hl
   exec 'highlight '.a:hi
   redir END
   let hl = substitute(hl, '[\r\n]', '', 'g')
   let hl = substitute(hl, 'xxx', '', '')
   return hl
endfunction
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" $B:G8e$N%+!<%=%k0LCV$rI|85$9$k(B
" """"""""""""""""""""""""""""""
 if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif
""""""""""""""""""""""""""""""
