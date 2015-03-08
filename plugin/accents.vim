" Vim plugin to automatically expand accents
" Maintainer:	GI <gi1242+vim@nospam.com> (replace nospam with gmail)
" Created:	Sun 08 Mar 2015 02:20:14 PM EDT
" Last Changed:	Sun 08 Mar 2015 03:33:31 PM EDT
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

if &ft == 'tex'
    function! s:tex_or_digraph( ab, tex, digraph )
	exec 'iab <buffer>' a:ab a:tex
    endfunction
else 
    function! s:tex_or_digraph( ab, tex, digraph )
	exec 'iab <buffer>' a:ab a:digraph
    endfunction
endif

command! -nargs=+ Aab	:call s:tex_or_digraph( <f-args> )

" Common math terms with accents
Aab cadlag	c\`adl\`ag	    c<c-k>`adl<c-k>`ag

" Common Math names with accents
Aab Calderon	Calder\'on	    Calder<c-k>'on
Aab Cesaro	Ces\`aro	    Ces<c-k>`aro
Aab Cordoba	C\'ordoba	    C<c-k>'ordoba
Aab Fejer	Fej\'er		    Fej<c-k>'er
Aab Holder	H\<c-v>"older	    H<c-k>:older
Aab Hormander	H\<c-v>"ormander    H<c-k>:ormander
Aab Ito		It\^o		    It<c-k>^o
Aab Levy	L\'evy		    L<c-k>'evy
Aab Peclet	P\'eclet	    P<c-k>'eclet
Aab Poincare	Poincar\'e	    Poincar<c-k>'e
Aab Rozovskii	Rozovski\u\i{}	    Rozovski<c-k>(i
Aab Sverak	\v\ Sver\'ak	    <c-k><Sver<c-k>'ak
Aab Szego	Szeg\<c-v>"o	    Szeg<c-k>:o
Aab Zlatos	Zlato\v\ s	    Zlato<c-k><vs

" Other common words with accents
Aab Jenee	Jen\'ee		    Jen<c-k>'ee
Aab cafe	caf\'e		    caf<c-k>'e
Aab Cafe	Caf\'e		    Caf<c-k>'e
Aab fiancee	fianc\'ee	    fianc<c-k>'ee
