# hchess

Get a Haskell development environment up and running quickly, as long as Nix is available on your system[^windows].

[^windows]: On Windows, you may install Nix [under WSL2](https://nixos.wiki/wiki/Nix_Installation_Guide#Windows_Subsystem_for_Linux_.28WSL.29) and use the [Remote - WSL extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-wsl) to connect from the native VSCode. This runs your project under Linux while providing a near-native development experience on Windows.

This repository is a Haskell project template that is optimized for a fully reproducible and friendly development environment. It is based on:

- [Nix](http://www.srid.ca/haskell-nix) + [Flakes](https://serokell.io/blog/practical-nix-flakes) (via [`github:srid/haskell-flake`](https://github.com/srid/haskell-flake)) + GHC 9
- VSCode + [HLS](https://github.com/haskell/haskell-language-server)
- [fourmolu](https://github.com/fourmolu/fourmolu) autoformatting 
- [Relude](https://github.com/kowainik/relude#relude) as Prelude.
  - `.hlint.yaml` is [from relude](https://github.com/kowainik/relude/blob/main/.hlint.yaml)

## Getting Started

First-time setup:

- [Install Nix](https://nixos.org/download.html) (>= 2.8) & [enable Flakes](https://nixos.wiki/wiki/Flakes) (Using Windows? See footnote[^windows])
- Run `nix develop -c haskell-language-server` to sanity check your environment 
- [Open as single-folder workspace](https://code.visualstudio.com/docs/editor/workspaces#_singlefolder-workspaces) in Visual Studio Code
    - When prompted by VSCode, install the [workspace recommended](https://code.visualstudio.com/docs/editor/extension-marketplace#_workspace-recommended-extensions) extensions
    - <kbd>Ctrl+Shift+P</kbd> to run command "Nix-Env: Select Environment" and then select `shell.nix`. 
        - The extension will ask you to reload VSCode at the end. Do it.

To run the program with auto-recompile:

- Press <kbd>Ctrl+Shift+B</kbd> in VSCode, or run `bin/run` in terminal, to launch Ghcid running your program.

Open `Main.hs`, and expect all HLS IDE features like hover-over tooltip to work out of the box. Try changing the source, and expect Ghcid to re-compile and re-run the app in the terminal below.

---

Renaming the project:

```sh
# First, click the green "Use this template" button on GitHub to create your copy.
git clone <your-clone-url>
cd your-project
NAME=myproject

git mv hchess.cabal ${NAME}.cabal
nix run nixpkgs#sd -- hchess ${NAME} * */*
git add . && git commit -m rename
```

## Tips

- Run `nix flake update` to update all flake inputs.
- Run `treefmt` in nix shell to autoformat the project. This uses [treefmt](https://github.com/numtide/treefmt), which uses `./treefmt.toml` (where fourmolu and nixpkgs-fmt are specified).
- Run `bin/hoogle` to start Hoogle with packages in your cabal file.
- Run the application without installing: `nix run github:srid/hchess` (or `nix run .` from checkout)

## Alternatives

- [Serokell's Flake template](https://github.com/serokell/templates/tree/master/haskell-cabal2nix)
