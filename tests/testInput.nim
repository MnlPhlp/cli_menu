import unittest,cli_menu/input

proc check(input: string): bool =
    input == "testInput"

test "getInput":
    check(getInput("","",check) == "testInput")

