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
" 行番号の色
"highlight LineNr ctermfg=yellow

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
   NeoBundle 'Shougo/neomru.vim'
   " ファイルをtree表示してくれる
   NeoBundle 'scrooloose/nerdtree'
   " インデントに色を付けて見やすくする
   NeoBundle 'nathanaelkane/vim-indent-guides'
   " 行末の半角スペースを可視化
   NeoBundle 'bronson/vim-trailing-whitespace'
   "スニペットの導入
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

" Unit.vimの設定
" """"""""""""""""""""""""""""""
" " 入力モードで開始する
 let g:unite_enable_start_insert=1
" " バッファ一覧
 noremap <C-P> :Unite buffer<CR>
" " ファイル一覧
 noremap <C-N> :Unite -buffer-name=file file<CR>
" " 最近使ったファイルの一覧
 noremap <C-Z> :Unite file_mru<CR>
" " sourcesを「今開いているファイルのディレクトリ」とする
 noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" " ウィンドウを分割して開く
 au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
 au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
 " ウィンドウを縦に分割して開く
 au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
 au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
 " ESCキーを2回押すと終了する
 au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
 au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
 let g:indent_guides_enable_on_vim_startup = 1

" http://inari.hatenablog.com/entry/2014/05/05/231307
" """"""""""""""""""""""""""""""
" " 全角スペースの表示
" """"""""""""""""""""""""""""""
 function! ZenkakuSpace()
     highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray"
 endfunction

 if has('syntax')
     augroup ZenkakuSpace
         autocmd!
         autocmd ColorScheme * call ZenkakuSpace()
         autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
     augroup END
     call ZenkakuSpace()
 endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" https://sites.google.com/site/fudist/Home/vim-nihongo-ban/-vimrc-sample
" """"""""""""""""""""""""""""""
" " 挿入モード時、ステータスラインの色を変更
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
" 最後のカーソル位置を復元する
" """"""""""""""""""""""""""""""
 if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif
""""""""""""""""""""""""""""""
