let g:im_dir = "figures"
let g:inkscape_template = "default.svg"


function! s:Draw(im_name)
    let l:im_path = expand('%:p:h'). "/". g:im_dir
    if !isdirectory(l:im_path)
	    call mkdir(l:im_path, "p")
    endif

    if filereadable(expand("~/.config/inkscape/templates/". g:inkscape_template))
		exe ":silent !cp ~/.config/inkscape/templates/". g:inkscape_template. " ". l:im_path. "/". a:im_name. ".svg"
    else
        finish
    end
    exe ":silent !inkscape ". l:im_path. "/". a:im_name. ".svg"
    exe ":silent !inkscape --export-filename=". l:im_path. "/". a:im_name. ".png ". l:im_path. "/". a:im_name. ".svg"
    exe 'redraw!'
endfunction

function! draw#EditDrawing(im_name)
    let l:im_path = expand('%:p:h'). "/". g:im_dir

    exe ":silent !inkscape ". l:im_path. "/". a:im_name. ".svg"
    exe ":silent !inkscape --export-filename=". l:im_path. "/". a:im_name. ".png ". l:im_path. "/". a:im_name. ".svg"
    exe 'redraw!'
endfunction

function! draw#DrawMD(im_name)
    call s:Draw(a:im_name)
    exe "normal! o![". a:im_name. "](". g:im_dir. "/". a:im_name. ".png)"
endfunction

function! draw#DrawTEX(im_name)
    call s:Draw(a:im_name)
    exe "normal! o\\includegraphics{". a:im_name. "}"
endfunction
