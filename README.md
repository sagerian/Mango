# dill - a playground for elm and haskell

## Getting Started:

### Nix as Package Manager (trust me):
Run this and blindly say yes:
```sh
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```
So what it says at the end about the daemon.

Open either `{HOME}/.zshrc` or `{HOME}/.bashrc` and add this function:
```sh
npi() {
  if [ "$#" -eq 0 ] || [ "$#" -gt 2 ]; then
    echo "Usage: npi <package_name> [impure]"
    return 1
  fi
  if [ "$#" -eq 1 ]; then
    nix profile install nixpkgs#$1
    return 0
  fi
  if [ "$#" -eq 2 ]; then
    export NIXPKGS_ALLOW_UNFREE=1 && nix profile install nixpkgs#$1 --impure
    return 0
  fi
}
```

### Things you need:
```sh
npi just
```
```sh
npi elmPackages.elm
```
```sh
npi elmPackages.elm-live
```
```sh
npi elmPackages.elm-review
```
```sh
npi elmPackages.elm-format
```
```sh
npi elmPackages.elm-language-server
```

### Develop
```sh
cd REPO_ROOT
just l
```