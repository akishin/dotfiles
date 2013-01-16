" .rb ファイルのインデントを 2 文字に設定
setlocal tabstop=2
setlocal shiftwidth=2
setlocal expandtab

" ##<ESC> でマジックコメント挿入
function! MagicComment()
  return "# -*- coding: " . &fileencoding . " -*-\<CR>"
endfunction

inoreabbrev <buffer> ## <C-R>=MagicComment()<CR>
