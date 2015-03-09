" Vim plugin to automatically expand accents
" Maintainer:	GI <gi1242+vim@nospam.com> (replace nospam with gmail)
" Created:	Sun 08 Mar 2015 02:20:14 PM EDT
" Last Changed:	Mon 09 Mar 2015 04:41:04 PM EDT
" Version:	0.1
"
" Description:
"   
"   Sets up insert mode abbreviations for a few common terms / names. Typing
"   'Holder' will result in 'H\"older' if you are editing a TeX/LaTeX file, or
"   result in 'H<c-k>:older' otherwise.
"
"   Using the digraph <c-k>:o instead of the actual umlaut makes the
"   abbreviation encoding independent.
"
"   The current abbreviation list is woefully incomplete (but is what I use
"   most often). Feel free to add to it (and send me a patch).

let s:digraph_replacements = {
	    \ '\\''(\{.\}|[^{])'    : '<c-k>\1''',
	    \ '\\\=(\{.\}|[^{])'    : '<c-k>\1-',
	    \ '\\\^(\{.\}|[^{])'    : '<c-k>\1>',
	    \ '\\\.(\{.\}|[^{])'    : '<c-k>\1.',
	    \ '\\`(\{.\}|[^{])'	    : '<c-k>\1`',
	    \ '\\"(\{.\}|[^{])'     : '<c-k>\1:',
	    \ '\\G\s+(.)'	    : '<c-k>\1"',
	    \ '\\G\{(.)\}'	    : '<c-k>\1"',
	    \ '\\k\s+(.)'	    : '<c-k>\1;',
	    \ '\\k\{(.)\}'	    : '<c-k>\1;',
	    \ '\\u\s+(.)'	    : '<c-k>\1(',
	    \ '\\u\{(.)\}'	    : '<c-k>\1(',
	    \ '\\v\s+(.)'	    : '<c-k>\1<',
	    \ '\\v\{(.)\}'	    : '<c-k>\1<',
	    \ '\\(O)'		    : '<c-k>O/',
	    \ }

function! s:get_digraph( tex )
    let dig = a:tex
    for pat in keys( s:digraph_replacements )
	let dig = substitute( dig, '\v'.pat, s:digraph_replacements[pat], 'g' )
    endfor

    return dig
endfunction

function! s:strip_accents( tex )
    let plain = a:tex
    for pat in keys( s:digraph_replacements )
	let plain = substitute( plain, '\v'.pat, '\1', 'g' )
    endfor
    return plain
endfunction

function! s:tex_or_digraph( tex, ... )
    let ab = ( a:0 > 0 && a:1 != 'NONE' ) ? a:1 : s:strip_accents( a:tex )

    if &ft == 'tex'
	exec 'iab <buffer>' ab a:tex
    else
	let digraph = ( a:0 > 1 ? a:2 : s:get_digraph( a:tex ) )
	exec 'iab <buffer>' ab digraph
    endif
endfunction

command! -nargs=+ Aab	:call s:tex_or_digraph( <f-args> )

" Common math terms with accents
Aab c\`adl\`ag

"" Common Math names with accents
Aab Calder\'on
Aab Carath\'eodory
Aab Ces\`aro
Aab C\'ordoba
Aab Fej\'er
Aab H\"older
Aab H\"ormander
Aab It\^o
Aab L\'evy
Aab \Oksendal
Aab P\'eclet
Aab Poincar\'e
Aab Rozovski\u\i{}  Rozovskii	    Rozovski<c-k>(i
Aab Ser\"egin
Aab Slep\v\ cev
Aab Szeg\"o
Aab \v\ Centsov
Aab \v\ Sver\'ak
Aab Zlato\v\ s

"" Other common words with accents
Aab Jen\'ee
Aab caf\'e
Aab Caf\'e
Aab fianc\'ee
