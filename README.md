# Neovim-IDE

This is my Neovim config with everything you need for a full fledged IDE experience

## Prerequesits

### Neovim and NVChad

Have Neovim installed on your system. Since this config uses NVChad, there are some prerequisits: - A Nerd Font (I chose JetBrainMono Nerd Font) and set it in your terminal - ripgrep (optional, though I highly recommend it) - GCC and make (Windows user can install that via mingw-w64)

The packages below are required to install everything (LSPs, Debugger, Linter and Formatter) via Mason

### node and npm

Have node and npm installed on your system. Instructions can be found [here](https://nodejs.org/en/download/package-manager)

### Python and pip

Have Python and pip installed on your system. Instructions can be found [here](https://docs.python.org/3/using/index.html) and [here](https://packaging.python.org/en/latest/guides/installing-using-linux-tools/#installing-pip-setuptools-wheel-with-linux-package-managers)

### PHP and Composer

Have PHP and Composer installed on your system. Instructions can be found [here](https://getcomposer.org/doc//00-intro.md)

### Cargo

Have Cargo installed on your system. Instructions can be found [here](https://rust-lang.org/learn/get-started)

### Go

Have Go/Golang installed on your system. Instructions can be found [here](https://go.dev/doc/install)

### GHCUp

Have GHCUp installed on your system. Instructions can be found [here](https://www.haskell.org/ghcup/install/)

## Installation

### On Linux and macOS

```sh
git clone https://github.com/Conarius/Neovim-IDE/config ~/.config/nvim --depth 1 && nvim
```

### On Windows

```sh
git clone https://github.com/Conarius/Neovim-IDE/config $HOME\AppData\Local\nvim --depth 1 && nvim
```

## Post Installation

After you have installed it, Neovim will ask you if you wanna install the example config. Enter n for no. After you have done that, run `:Lazy update` and `:Mason` to update all the neovim plugins. Also don't forget to install all the necessary TreeSitter parsers for all the languages via `:TSInstall <enter language/file format here>`. All available parsers can be listed via `:TSInstallInfo`
