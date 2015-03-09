# vim-accents

This plugin provides abbreviations for a few words/names with accents in it.
For example, typing `Holder` will result in `H\"older` if you are editing a
`TeX/LaTeX` file, and `Hölder` otherwise. (The accented abbreviations use
digraphs to make it encoding independent.)

Defining your own abbreviations is really easy. Just use the "Aab" command as
follows:

    Aab H\"older

This creates the abbreviation

    iab <buffer> Holder H\"older

if you're editing a TeX file, and the abbreviation

    iab <buffer> Holder H<c-k>o"lder

otherwise. The script has heuristics to guess the non-accented and the
digraph version given the TeX code. If it gets it wrong, you can of course
specify them yourself. Using

    Aab H\"older Holder H<c-k>o"lder

will equivalently generate the above "iab" commands as appropriate.

Currently it only has abbreviations defined for names of Mathematicians I've
used. Feel free to update the list to include really common names and send me
a patch.

## Install details

Put `macros/accents.vim` in your `~/.vim/macros` directory and
`plugin/accents.vim` in your `~/.vim/plugin` directory.

Currently this plugin is only enabled for a few file types (`tex`, `mail`,
`markdown`, etc.). To enable it for a different file type (say `foo`) put the
following in your `~/.vimrc`:

    au FileType foo runtime macros/accents.vim

## Links.

* [Github page](https://github.com/gi1242/vim-accents)
