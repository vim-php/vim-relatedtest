# Vim plugin to open test spec of a source file and viceversa

This plugin opens a related test file of a given source file (and viceversa).

![Related Test Screenshot](http://example.walterdalmut.com/relatedtest.gif)

When you are editing a source file, eg: `App.php` and you want to open the test file
you have to issue `tt` and the `AppTest.php` will required from your test folder.
If the test file is missing you can create it on the fly.

## Examples

- In PHP if you open `src/Name/App.php` and issue `tt` the plugin tries to open `tests/Name/AppTest.php`
- In Golang if you open `boat.go` and issue `tt` the plugin tries to open `boat_test.go`

... And viceversa! ;-)

## Install

You can use Vundle for install this plugin

```viml
Bundle 'wdalmut/vim-relatedtest'
```

## Your configuration

You can redefine shortcuts

```viml
let g:relatedtest_open_command = '<C-t>'
```

