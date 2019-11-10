# cli_menu [![Build Status](https://travis-ci.org/MnlPhlp/cli_menu.svg?branch=master)](https://travis-ci.org/MnlPhlp/cli_menu)
A library to create interactive commandline menus without writing boilerplate code.

## Usage
There are different menu types that can be used.\
These are just some examples. To learn about all functions read the [docs](https://mnlphlp.github.io/cli_menu/).

---
## `subMenus`
Used to select subfunctions or submenus.\
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
---

## `selectMenu`
Asks the user to select one of the given options.\
The function checks if the user input is valid for the amount of options and returns the input if corret.
If the input is incorrect the user is notified and asked to enter a new input.
If the user quits `-1` is returned. 

You need to specify a menu title and a sequence of strings describing the options.

example: 
```nim
   subMenus("test",@["option a","option b"])
```
creates the output
```
   test
   1) option a
   2) option b
   Q) quit
   choose: 
```
---
## `getUserInput`
Asks the user to input something and then checks the input.

example:
```nim
import os
# getUserInput(title,prompt,error: string, check: proc(x: string):bool)
let input = getUserInput("Select a file to hide.","Filename","not a valid file",existsFile)
```  
creates the output:
```
  Select a file to hide.
  Filename: 
```

The `checkFunction` must have a single string argument and the return type boolean.
In this example the proc existsFile from the `os` module is used to check if the user entered a valid filepath\
If the input is invalid the user is notified with the `error` string and asked for new input.
Empty input is always accepted.

---
## [Docs](https://mnlphlp.github.io/cli_menu/)