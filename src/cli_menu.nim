import 
  cli_menu/[output,input]

proc selectMenu*(header:string, options: seq[string]): int =
  printMenu(header,options)
  result = getSelection(options.len)

template subMenus*(header:string, options: seq[tuple[text:string,subMenu:untyped]]) =
  ## creates an interactive menu with submenus or other subfunctions choosen by entering a number
  ## the functions given as subfunctions must not have return values
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
  