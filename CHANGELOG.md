# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.2.1] - 2018-11-22 21:43:06 +0100

### Changed

* Better help for CLI

## [0.2.0] - Sun Nov 11 17:32:03 2018 +0100

### Added

* Ability to find definition as super keyword
* Allows to jump to foo.(bar) (shorthand `call` notation).
* Autocompletion
* Jump to definition now works when using it on `super` keyword.
* Jump to method definition works when jumping on the dot.
* Major speedup for some big files, having large arrays or hashes
* Make full command

### Changed

* Update bundler gem version to 1.16.4
* Update bundle
* Update lsp-protocol gem version to 0.0.6

### Fix

* Mutant
* Tests

### Removed

* Hard coded polymorphism
* Hard coded primitives
* Ruby version file

## [0.1.0]

* First public version released
