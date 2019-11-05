import terminal,rdstdin,strutils

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
          setForegroundColor(fgRed)
          echo "invalid Input"
          resetAttributes()
          failed = true
        stdout.flushFile() # make sure attributes are reset
    