# Package

version       = "0.1.5"
author        = "MnlPhlp"
description   = "A library to create interactive commandline menus without writing boilerplate code."
license       = "MIT"
srcDir        = "src"



# Dependencies

requires "nim >= 1.0.0"

# Tasks

import os
task docs,"generate docs":
  selfExec "doc2 --project --git.url:https://github.com/MnlPhlp/cli_menu --git.commit:master src/cli_menu.nim"
  rmDir("docs")
  mvDir("src/htmldocs","docs")
  mvFile("docs/cli_menu.html","docs/index.html")

task test,"run Tests":
  selfExec"c -r -d:testing tests/t**.nim"