let g:im_dir = "./figures"
let g:inkscape_template = "default.svg"


function! draw#Draw(im_name)
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
    exe "normal! o![". a:im_name. "](". g:im_dir. "/". a:im_name. ".png)"
    exe 'redraw!'
endfunction
