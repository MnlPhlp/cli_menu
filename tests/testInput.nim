import 
    unittest,
    cli_menu/input,
    read

proc check(input: string): bool =
    input == "testInput"

test "test getInput with valid string":
    read.testInput = "testInput"
    check(getInput("","",check) == "testInput")

test "test getInput with empty string":
    read.testInput = ""
    check(getInput("","",check) == "")
