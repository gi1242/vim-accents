# vim-accents

This plugin provides abbreviations for a few words/names with accents in it.
For example, typing `Holder` will result in `H\"older` if you are editing a
`TeX/LaTeX` file, and `Hölder` otherwise. (The accented abbreviations use
digraphs to make it encoding independent.)

Currently it only has abbreviations defined for names of Mathematicians I use
often. Feel free to update the list and send me a patch.

## Install details

Put `macros/accents.vim` in your `~/.vim/macros` directory and
`plugin/accents.vim` in your `~/.vim/plugin` directory.

Currently this plugin is only enabled for a few file types (`tex`, `mail`,
`markdown`, etc.). To enable it for a different file type (say `foo`) put the
following in your `~/.vimrc`:

    au FileType foo runtime macros/accents.vim

## Links.

* [Github page](https://github.com/gi1242/vim-accents)
