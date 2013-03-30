" CoffeeScript REPL enters multi-line mode with Ctrl+v
function! SlimuxPre_coffee(target_pane)
  if !exists('g:SlimuxUseNodeReplForCoffee')
    call system("tmux send-keys -t " . a:target_pane . " C-v")
  endif
endfunction

" Exit multi-line REPL mode with Ctrl+d
function! SlimuxPost_coffee(target_pane)
  if !exists('g:SlimuxUseNodeReplForCoffee')
    call system("tmux send-keys -t " . a:target_pane . " C-d")
  endif
endfunction

" Compile coffee script since the node REPL is far better
function! SlimuxEscape_coffee(text)
  if exists('g:SlimuxUseNodeReplForCoffee')
    let escaped_text = substitute(shellescape(a:text), "\\\\\n", "\n", "g")
    let l:compiled_text = system("coffee -bep " . escaped_text)
    return l:compiled_text
  endif
endfunction
