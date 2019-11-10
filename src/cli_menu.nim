import 
  cli_menu/[output,input],
  terminal

proc selectMenu*(header:string, options: seq[string]): int =
  ## Asks the user to select one of the given `options`.
  ##
  ## The function checks if the user input is valid for the amount of options and returns the input if corret.
  ## If the input is incorrect the user is notified and asked to enter a new input.
  ## If the user quits `-1` is returned. 
  ##
  ## example: 
  ## ```nim
  ##  subMenus("test",@["option a","option b"])
  ## ```
  ## creates the output
  ## ```
  ##  test
  ##    1) option a
  ##    2) option b
  ##    Q) quit
  ##  choose: 
  ## ```
  printMenu(header,options)
  result = getSelection(options.len)

template subMenus*(header:string, options: seq[tuple[text:string,subMenu:untyped]]) =
  ## Creates an interactive menu with submenus or other subfunctions choosen by entering a number.
  ## The functions given as subfunctions must not have return values.
  ##
  ## example: 
  ## ```nim
  ##  subMenus("test",@[
  ##      ("option a",subMenuA),
  ##      ("option b",subMenuB)
  ##      ])
  ## ```
  ## creates the output
  ## ```
  ##  test
  ##    1) option a
  ##    2) option b
  ##    Q) quit
  ##  choose: 
  ## ```
  var optionTexts: seq[string]
  for option in options:
    optionTexts.add(option[0])
  while true:
    printMenu(header,optionTexts)
    let selection = getSelection(options.len)
    if selection == -1:
      return
    (proc)(options[selection][1])()
  
proc waitForEnter*() = 
  ## Does what the name suggests.
  ## Waits until the user presses enter.
  hideCursor()
  discard readPasswordFromStdin("press Enter to continue")
  showCursor()

proc clearScreen*() =
  eraseScreen()
  stdout.flushFile()

proc getUserInput*(header,prompt,error: string,check: proc(x: string): bool): string =
  ## Asks the user to input something and then checks the input.
  ## The `checkFunction` must have a single string argument and the return type boolean.
  ##
  ## If the input is invalid the user is notified with the `error` string and asked for new input.
  ## Empty input is always accepted.
  ##
  ## In this example the proc `existsFile` from the `os` module is used to check
  ## if the user entered a valid filepath
  ##
  ## example:
  ## ```nim
  ##  import os
  ##  let input = getUserInput("Select a file to hide.","Filename","not a valid file",existsFile)
  ## ```  
  ## creates the output:
  ## ```
  ##  Select a file to hide.
  ##  Filename: 
  ## ```
  clearScreen()
  echo header
  result = getInput(prompt,error,check)
