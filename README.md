# Vim plugin to open test spec of a source file

This plugin opens a related test file of a given source file.

![Related Test Screenshot](http://example.walterdalmut.com/relatedtest.gif)

When you are editing a source file, eg: `App.php` and you want to open the test file
you have to issue `tt` and the `AppTest.php` will required from your test folder.
If the test file is missing you can create it on the fly.

## Examples

- In PHP if you open `src/Name/App.php` and issue `tt` the plugin tries to open `tests/Name/AppTest.php`
- In Golang if you open `boat.go` and issue `tt` the plugin tries to open `boat_test.go`

## Install

You can use Vundle for install this plugin

```viml
Bundle 'wdalmut/vim-relatedtest'
```

## Supported languages

Actually only PHP and Golang are supported. You can add a programming language
through ftplugin dedicated script.

The system works through 2 regular expression substitution base test folders and filename.

## Your configuration

You can redefine shortcuts

```viml
let g:relatedtest_open_command = '<C-t>'
```

