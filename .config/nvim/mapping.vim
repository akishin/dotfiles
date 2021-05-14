" 文字コードを変えて開き直す
command! Utf8 e ++enc=utf-8
command! Euc  e ++enc=euc-jp
command! Sjis e ++enc=cp932
command! Jis  e ++enc=iso-2022-jp

" vimrc を編集反映
command! Ev edit $MYVIMRC
" vimrc を再読込み
command! Rv source $MYVIMRC

" Escの2回押しでハイライト消去
nmap <ESC><ESC> :nohlsearch<CR><ESC>

" 挿入モードで Ctrl-p でクリップボード内容を貼り付け
imap <C-p> <ESC>"*pa

" CTRL-hjkl でウインドウ移動
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
" 前のバッファ
noremap <C-Tab> :bp<CR>
" 次のバッファ
noremap <C-S-Tab> :bn<CR>

" ビジュアルモードでインデント変更後も選択を維持する
vnoremap < <gv
vnoremap > >gv

" 文字列選択してから「*」で選択した文字列で検索
vnoremap * "zy:let @/ = @z<CR>n

" 補完の設定
" see: https://note.com/yasukotelin/n/na87dc604e042
set completeopt=menuone,noinsert
" 補完表示時のEnterで改行をしない
inoremap <expr><CR>  pumvisible() ? "<C-y>" : "<CR>"
inoremap <expr><C-n> pumvisible() ? "<Down>" : "<C-n>"
inoremap <expr><C-p> pumvisible() ? "<Up>" : "<C-p>"
