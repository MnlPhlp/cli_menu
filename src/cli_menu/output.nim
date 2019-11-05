import terminal,strformat

proc printMenu*(header:string,options: seq[string]) =
    eraseScreen()
    echo header
    for i,option in options:
      echo fmt"  {i+1}) {option}"
    echo "  Q) quit"