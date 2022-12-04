" create incremented number each time the macro(register a) is executed, to set the starting number, set g:custom_counter
function! s:auto_numbering(...)
  let label = "create incremented number, the second parameter is the starting number"
  let g:custom_counter=1
  if len(a:000) == 1 
    let g:custom_counter=a:1
  else
    let g:custom_counter=1
  endif
  " let @a = ':let @s = g:custom_counter"sP:let g:custom_counter = g:custom_counter + 1:redraw!'
  " let @a = ':let @s = g:custom_counter"sP:let g:custom_counter = 2'
  " let @a = ToRealMacroString(':let @s = g:custom_counter\<cr>"sP:let g:custom_counter = 2\<cr>')
  let @a = ToRealMacroString(':let @s = g:custom_counter\<cr>"sP:let g:custom_counter = g:custom_counter + 1\<cr>:redraw!\<cr>')
  " let @a = ''
  " let @a = ":let @s = g:custom_counter"
  echom "use register a to spawn the number"
endfunction 

:command! -nargs=* -range AutoNumbering call s:auto_numbering(<f-args>)
