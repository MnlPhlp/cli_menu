import terminal,strutils,strformat

when defined(testing):
  import ../../tests/read # make unittests possible
else:
  import rdstdin

proc getSelection*(optCount: int): int =
  var failed = false
  var finished = false
  while not finished:
    let input = readLineFromStdin("choose: ")
    if input.toUpper == "Q":
      result = -1
      finished = true
    else:
      try:
        result = input.parseInt()-1
        if result notin 0..optCount-1:
          raise new ValueError
        finished = true
      except ValueError,IndexError:
        cursorUp()
        eraseLine()
        if not failed:
          styledEcho(fgRed,"Invalid Input")
          failed = true
        stdout.flushFile()

proc getInput*(prompt,error: string,check: proc(x: string): bool): string =
  var failed = false
  var finished = false
  while not finished:
    result = readLineFromStdin(fmt"{prompt}: ")
    if check(result) or result == "":
      finished = true
    else:
      cursorUp()
      eraseLine()
      if not failed:
        styledEcho(fgRed,"Invalid Input\n  " & error)
        failed = true
      stdout.flushFile()
