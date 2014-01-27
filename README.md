# Vim plugin to open test spec of a source file

This plugin opens a related test file of a given source file.

![Related Test Screenshot](http://example.walterdalmut.com/relatedtest.gif)

When you are editing a source file, eg: `App.php` and you want to open the test file
you have to issue `tt` and the `AppTest.php` will required from your test folder

## Install

You can use Vundle for install this plugin

```
Bundle 'wdalmut/vim-relatedtest'
```

## Supported languages

Actually only PHP and Golang is supported. You can add your programming languages
through ftplugin dedicated script.

The system works through 2 regular expression substitution base test folders and filename.

## Your configuration

You can redefine shortcuts

```
g:relatedtest_open_command = '<C-t>'
```

