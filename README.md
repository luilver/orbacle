# Orbacle
[![CircleCI](https://circleci.com/gh/swistak35/orbacle/tree/master.svg?style=shield)](https://circleci.com/gh/swistak35/orbacle/tree/master)
[![Gem Version](https://badge.fury.io/rb/orbacle.svg)](https://badge.fury.io/rb/orbacle)

![vokoscreen-2018-08-01_21-38-46][]

Language server for ruby, which can be used across different code
editors, like Vim, Emacs or Atom. Focus on understanding of the code in order
to provide best functionalities of "go-to definition", autocompletion and
refactorings. The idea is to infer information about variables (i.e. their
"types"), **without requiring developer to write any annotations**, just like
IDEs do that - through static analysis.

### Use

#### Jump to definition

* used on constant -> jump to constant definition
* used on method call -> jump to definition of that method
* used on `super` keyword -> jump to the definition of method from the parent
class (doesn't respect `include` / `prepend` yet)

## Setup

### Prerequisite indexing

1. Install `orbacle` gem.
2. Run `orbaclerun -d <your_project_directory> index`

It will show you how long does it take to index your project, i.e. how long do
you have to wait after editor start to have language server functional
underneath.

### Vim

Using `vim-plug`:

```
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }

let g:LanguageClient_serverCommands = {
  \ 'ruby': ['orbaclerun', 'file-server'],
  \ }
nnoremap <localleader>lj :call LanguageClient_textDocument_definition()<CR>
nnoremap T :call LanguageClient_textDocument_hover()<CR>
" timeout has to be bigger than time needed to index your project
let g:LanguageClient_waitOutputTimeout = 240
```

## Contributing

See [CONTRIBUTING][]

## Support

If you have found a bug, feel free to create an issue. However, because of the
fact that I'm focusing now more on the features required to MSc, support for
other developers are lower priority for me.

## Bibliography

* [Tern][]
* Fast Interprocedural Class Analysis, Greg DeFouw, David Grove, Craig Chambers,
July 1997

  [CONTRIBUTING]: ./CONTRIBUTING.md
  [Tern]: http://marijnhaverbeke.nl/blog/tern.html
  [vokoscreen-2018-08-01_21-38-46]: https://user-images.githubusercontent.com/332289/43544509-6b240d06-95d3-11e8-81e8-fe03b2c1cf6f.gif
