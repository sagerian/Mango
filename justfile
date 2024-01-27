alias s := ship
alias b := build
alias l := local

ship: build
  scp index.html root@172.105.167.119:/var/www/convictus.au  

build:
  elm make {{justfile_directory()}}/client/src/Main.elm
  rm -rf {{justfile_directory()}}/elm-stuff/
  rm -rf {{justfile_directory()}}/dist-newstyle/

local:
  elm-live ~/things/dill/client/src/Main.elm -- --debug
