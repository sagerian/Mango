alias s := ship
alias b := build
alias l := local

ship: build
  scp {{justfile_directory()}}/index.html root@172.105.167.119:/var/www/convictus.au
  scp {{justfile_directory()}}/convictus.js root@172.105.167.119:/var/www/convictus.au
  scp {{justfile_directory()}}/font-face.css root@172.105.167.119:/var/www/convictus.au
  scp {{justfile_directory()}}/client/assets/* root@172.105.167.119:/var/www/convictus.au/assets

build:
  elm make {{justfile_directory()}}/client/src/Main.elm --output convictus.js
  rm -rf {{justfile_directory()}}/elm-stuff/
  rm -rf {{justfile_directory()}}/dist-newstyle/

local:
  elm-live ~/things/dill/client/src/Main.elm -- --debug --output convictus.js