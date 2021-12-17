if exists("g:loaded_draw")
    finish
endif
let g:loaded_draw = 1

if !exists(':Draw')
  :command! -nargs=1 -buffer Draw call draw#Draw(<f-args>)
endif

if !hasmapto('Draw')
  nnoremap <unique> <leader>dw :Draw 
endif
