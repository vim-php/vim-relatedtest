# Vim plugin to open test spec of a source file and viceversa

**THIS PLUGIN IS NO LONGER WORKING with vim patch 7.4.260**

This plugin opens a related test file of a given source file (and viceversa).

![Related Test Screenshot](http://example.walterdalmut.com/relatedtest.gif)

When you are editing a source file, eg: `App.php` and you want to open the test file
you have to issue `tt` and the `AppTest.php` will be opened from your tests folder.
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

## PHP Filetype configuration

Sometimes you need to set up where sources and tests folders are located, for doing
that you can set in your `.exrc` file for your project.

For example for Symfony2 application you can limit the search operation in your
`src` folder only...

```vim
let g:relatedtest_php_src="src/"
let g:relatedtest_php_tests="src/"
```

