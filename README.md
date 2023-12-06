# Neovim-IDE

This is my Neovim config with everything you need for a full fledged IDE experience. Based on NvChad.

## Features

- Preconfigured Autocompletion, Debugging, Formatting and Linting for Rust, Go, C/C++, JS/TS and Lua
- Easy installation for LSPs, Debuggers, Linters and Formatters via [mason.nvim](https://github.com/williamboman/mason.nvim)
- Schemas for yaml, json and toml files you need via [Schemastore.nvim](https://github.com/b0o/SchemaStore.nvim)
- Debugging via [nvim-dap](https://github.com/mfussenegger/nvim-dap)
- A UI interface when running a debugger via [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)
- LSP Configuration via [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- Inline hints for linters via [none-ls](https://github.com/nvimtools/none-ls.nvim)
- Formatting on save via [none-ls](https://github.com/nvimtools/none-ls.nvim)
- Preconfigured catppuccin theme, theme can be changed through Space+th
- Folding of functions, classes, etc. via [nvim-origami](https://github.com/chrisgrieser/nvim-origami)
- Github Integration via [Octo.nvim](https://github.com/pwntester/octo.nvim)
- Gitui integration for a good git workflow via [Gitui.nvim](https://github.com/brneor/gitui.nvim)
- All inline comments from linters and LSPs within a small windows at the bottom via [trouble.nvim](https://github.com/folke/trouble.nvim)
- Test runner for your test suite via [neotest](https://github.com/nvim-neotest/neotest)
- Code Runner like in vscode, integrates with nvim-dap and neotest, via [overseer.nvim](https://github.com/stevearc/overseer.nvim)
- Note Taking via [neorg](https://github.com/nvim-neorg/neorg)
- tmux integration via [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)
- Markdown preview via [Glow.nvim](https://github.com/ellisonleao/glow.nvim)
- LaTeX PDF Preview via [knap](https://github.com/frabjous/knap)
- Sleak UI for interacting with Vim commands via [noice.nvim](https://github.com/folke/noice.nvim)
- Notifications in the top right corner via [nvim-notify](https://github.com/rcarriga/nvim-notify)
- A Discord Rich Presence via [presence.nvim](https://github.com/andweeb/presence.nvim)

## Prerequesits

### Glow

For the markdown preview, [Glow](https://github.com/ellisonleao/glow.nvim) is required.

### Gitui

For the gitui plugin, [gitui](https://github.com/extrawurst/gitui) is required.

### Github CLI

For the Github Integration, the [Github CLI](https://github.com/cli/cli#installation) is required.

### Sioyek

For the LaTeX pdf preview [Sioyek](https://sioyek.info/) is required.

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

### GHCUp, Cargo and Stack

Have GHCUp installed on your system. Instructions can be found [here](https://www.haskell.org/ghcup/install/). With ghcup installed you should then install cabal and stack through ghcup itself.

## Installation

### On Linux and macOS

```sh
git clone https://github.com/Conarius/Neovim-IDE.git ~/.config/nvim --depth 1 && nvim
```

### On Windows

```sh
git clone https://github.com/Conarius/Neovim-IDE.git $HOME\AppData\Local\nvim --depth 1 && nvim
```

## Post Installation

After you have installed it, Neovim may ask you if you wanna install the example config. Enter n for no. After you have done that, run `:Lazy update` and `:Mason` to update all the neovim plugins. Also don't forget to install all the necessary TreeSitter parsers for all the languages via `:TSInstall <enter language/file format here>`. All available parsers can be listed via `:TSInstallInfo`

## Special thanks

Special thanks to [siduck](https://github.com/siduck) for [NVChad](https://github.com/NvChad/NvChad), the none-ls team for maintaining **the fork** of null-ls, [williamboman](https://github.com/williamboman) for his work on Mason and the mason ragistry.
