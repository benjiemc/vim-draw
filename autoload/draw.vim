let g:im_dir = "./figures"
let g:inkscape_template = "default.svg"


function! s:Draw(im_name)
    if !isdirectory(g:im_dir)
	    call mkdir(g:im_dir, "p")
    endif

    if filereadable(expand("~/.config/inkscape/templates/". g:inkscape_template))
		exe ":silent !cp ~/.config/inkscape/templates/". g:inkscape_template. " ". g:im_dir. "/". a:im_name. ".svg"
    else
        finish
    end
    exe ":silent !inkscape ". g:im_dir. "/". a:im_name. ".svg"
    exe ":silent !inkscape --export-filename=". g:im_dir. "/". a:im_name. ".png ". g:im_dir. "/". a:im_name. ".svg"
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
