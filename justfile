alias s := ship
alias b := build
alias l := live

ship: build
  scp ~/things/dill/index.html root@45.79.238.25:/var/www/convictus.au  

build:
  elm make ~/things/dill/src/Convictus.elm

live:
  elm-live ~/things/dill/src/Convictus.elm
