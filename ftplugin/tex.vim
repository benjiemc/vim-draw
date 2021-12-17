if exists("g:loaded_draw")
    finish
endif
let g:loaded_draw = 1

if !exists(':Draw')
  :command! -nargs=1 -buffer Draw call draw#DrawTEX(<f-args>)
endif

if !hasmapto('Draw')
  nnoremap <unique> <leader>dw :Draw 
endif

if !exists('EditDrawing')
  :command! -nargs=1 -buffer EditDrawing call draw#EditDrawing(<f-args>)
endif

if !hasmapto('EditDrawing')
  nnoremap <unique> <leader>de :EditDrawing 
endif
