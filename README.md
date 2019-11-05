# cli_menu [![Build Status](https://travis-ci.org/MnlPhlp/cli_menu.svg?branch=master)](https://travis-ci.org/MnlPhlp/cli_menu)
A library to create interactive commandline menus without writing boilerplate code.

## Usage
There are different menu types that can be used.

### subMenus
Used to select subfunctions or submenus.

You need to specify a menu title and a sequence of tuples. Each tuple contains a string describing the option and the function that should be called when the option is selected.

The example:
```nim
    subMenus("test",@[
        ("option a",subMenuA),
        ("option b",subMenuB)
        ])
   ```
creates the output:
   ```
    test
      1) option a
      2) option b
      Q) quit
    choose: 
   ```
