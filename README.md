# vim-accents

This plugin provides abbreviations for a few words/names with accents in it.
For example, typing `Poincare` will result in `Poincar\'e` if you are editing a
`TeX/LaTeX` file, and `Poincaré` otherwise. (The accented abbreviations use
digraphs to make it encoding independent.)

By default, only abbreviations for Poincaré and càdlàg are defined.

## Defining your own abbreviations.

The **Aab** (short for *Accent ABbreviate*) command can be used to define new
abbreviations. Since they will likely be filetype specific, here's how you can
set up your own accents.

1. Put the following in your `~/.vimrc`

        au FileType plaintex,tex,html,mmd,markdown,mediawiki,ikiwiki,mail,text
            \ runtime macros/myaccents.vim
        
2. Create the file `~/.vim/macros/myaccents.vim` and use the `Aab` command to
   define your custom abbreviations there.
   
### Using the Aab command

Accent abbreviations can be defined using the `Aab` command. This has the
following two forms:

    Aab <TeX Accent> <Abbreviation> <Digraph>
    Aab <TeX Accent>

The second form will create a buffer local insert mode abbreviation that
expands `<Abbreviation>` to `<TeX Accent>` in TeX files and to `<Digraph>` in
non-tex files. The second form will guess `<Abbreviation>` and `<Digraph>`
from the `<TeX Accent>`. If you'd like to only specify `<Digraph>` and have
the script guess `<Abbreviation>`, pass `NONE` for the second argument.

Here are a few examples that work.

    Aab Ces\`aro
    Aab H\"older
    Aab It\^o
    Aab \Oksendal
    Aab Poincar\'e

## Install details (quick start)

* Put `plugin/accents.vim` in your `~/.vim/plugin` directory.

* Create `~/.vim/macros/myaccents.vim` defining your custom accents
  abbreviations. E.g.:

        Aab Poincar\'e

* Enable it using the FileType autocommand by putting the following in your
  `~/.vimrc`:

    au FileType tex,mail,mediawiki runtime macros/myaccents.vim

## Links.

* [Github page](https://github.com/gi1242/vim-accents)
