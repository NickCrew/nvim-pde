# Neovim IDE

Development environment for Python, Rust, Javascript/Typescript and Lua based on Neovim and macOS (or Linux).

- Git Integration
- VS Code compatible:
	- Debug adapter and graphical debugger
	- Language servers
	- Completion
	- Auto Formatting


## __BEWARE__
You will only find pain and despair if you attempt to blindly copy some nutjob's huge Vim configuration. Nevertheless,
it is helpful to have a rough guide as to which plugin's do what and their compatibility or customization options.  

Only a lunatic would go through this effort when you can have the cheap version in VS Code ready in 5 minutes. If you
are one of those lunatics... read on...

> This guide is a work in progress. I will try to add details over time.

---

## Building the IDE ...

### Prerequisites
Some must-haves before beginning.

#### Neovim (duh)

It is recommended that you install Neovim from `HEAD`.
```bash
brew install --HEAD Neovim
```
Upgrade with

```bash
brew upgrade --fetch-HEAD neovim
```

#### Ripgrep

Ripgrep is used in multiple spots for fast searching. Use `cargo` or brew to install.

```bash
brew install Ripgrep
```

#### Fonts, DevIcons and Glyphs

- [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)

A patched nerd font is recommended to properly display glyphs.
```bash
brew tap homebrew/cask-fonts
brew install --cask font-fira-code-nerd-font
```

---

### Language Servers
We're using Neovim's new builtin language server support here because it is the future. _Coc.vim_ might get you off the
ground faster but it's a bloated node project that will be abandonware one day.

- [nvim-lspconfig](https://github/com/neovim/nvim-lspconfig)

#### LSP Plugins
- [lsp-signature.nvim](https://github.com/ray-x/lsp_signature.nvim)
- [nvim-lsp-installer](https://github.com/williamboman/nvim-lsp-installer)
- [nvim-lsp-ts-utils](https://github.com/jose-elias-alvarez/nvim-lsp-ts-utils)
- [lsp-colors.nvim](https://github.com/folke/lsp-colors.nvim)
- [toggle-lsp-diagnostics.nvi](https://github.com/WhoIsSethDaniel/toggle-lsp-diagnostics.nvi)

#### Lua Support
The `luarocks` package manager is useful.
```bash
brew install luarocks
```
A formating tool for Lua
```bash
luarocks install --server=https://luarocks.org/dev luaformatter
```

---

### Completion

#### nvim-cmp
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)

##### Completion Plugins
- [lspkind-nvim](https://github.com/onsails/lspkind-nvim)
- [vim-vsnip](https://github.com/hrsh7th/vim-vsnip)
- [cmp-vsnip](https://github.com/hrsh7th/cmp-vsnip)
- [vim-vsnip-integ](https://github.com/hrsh7th/vim-vsnip-integ)
- [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline)
- [cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
- [cmp-path](https://github.com/hrsh7th/cmp-path)
- [cmp-nvim-lua](https://github.com/hrsh7th/cmp-nvim-lua)

---

### Debuggers

#### Vimspector
- [vimspector/](https://puremourning.github.io/vimspector/)

#### nvim-dap
- [nvim-dap](https://github.com/mfussenegger/nvim-dap)
- [nvim-dap-virtual-text](https://github.com/mfussenegger/nvim-dap-virtual-text)
- [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)
- [DAPInstall.nvim](https://github.com/Pocco81/DAPInstall.nvim)

### Debug Information
These plugins both use VS Code-compatible debug adapters and configuration formats (e.g. `launch.json`). See links below
for more info.
- [Debug-configuration-settings](https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings)
- [Vimspector Configuration](https://puremourning.github.io/vimspector/configuration.html#)
- [neovim-python/](https://quinoa42.github.io/en/oceanus/neovim-python/)

To debug node.js code, you can install a config for vimspector to your project.

```bash
npm -g install vimspector-config
```

---

### Command Palette
Telescope acts as command palette and highly extensible interface to Neovim

- [telescope.nvim/](https://github.com/nvim-telescope/telescope.nvim/)

#### Telescope Dependencies
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
- [popup.nvim](https://github.com/nvim-lua/popup.nvim)
- [sqlite.lua](https://github.com/tami5/sqlite.lua)

##### Telescope Extensions
- [trouble.nvim](https://github.com/folke/trouble.nvim)
- [telescope-symbols.nvim](https://github.com/nvim-telescope/telescope-symbols.nvim)
- [telescope-zoxide](https://github.com/jvgrootveld/telescope-zoxide)
- [telescope-github.nvim](https://github.com/nvim-telescope/telescope-github.nvim)
- [telescope-frecency.nvim](https://github.com/nvim-telescope/telescope-frecency.nvim)
- [telescope-vimspector.nvim](https://github.com/nvim-telescope/telescope-vimspector.nvim)
- [telescope-ui-select.nvim](https://github.com/nvim-telescope/telescope-ui-select.nvim)
- [telescope-vimspector.nvim](https://github.com/nvim-telescope/telescope-vimspector.nvim)
- [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim)
- [dash.nvim](https://github.com/mrjones2014/dash.nvim)

---

### Tags, Symbols and File Tree

- [vista.vim](https://github.com/liuchengxu/vista.vim)
- [vim-gutentags](https://github.com/ludovicchabant/vim-gutentags)
- [nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua)

The `vim-gutentags` plugin can automatically manage tags. `ctags` is recommended.  
For macOS:
```bash
brew install --HEAD universal-ctags/universal-ctags/universal-ctags
```

---

### Parsing
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

#### Treesitter Extensions
- [nvim-ts-rainbow](https://github.com/p00f/nvim-ts-rainbow)
- [nvim-treesitter-context](https://github.com/romgrk/nvim-treesitter-context)
- [playground](https://github.com/nvim-treesitter/playground)
- [nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects)

---

### Auto-formatting

- [neoformat](https://github.com/sbdchd/neoformat)

---

### Bookmarks

- [chentau/marks.nvim](https://github.com/chentau/marks.nvim)

---

### Editing Enhancements

- [vim-sandwich](machakann/vim-sandwich) 
- [nvim-autopairs](windwp/nvim-autopairs) 
- [vim-mundo](simnalamburt/vim-mundo)

---

### Fancy-pants UI Enhancements

- [nvim-notify](rcarriga/nvim-notify)
- [lualine.nvim](nvim-lualine/lualine.nvim)

---

### Cheatsheets and Custom help
Store some of your notes here in the custom help docs: `doc/halp`. To update help keywords for searching:

```vim
:helptags ~/.config/nvim/docs/
```

Add entries to the cheatsheet by editing `cheatsheet.txt`. The `:Cheatsheet` command will allow searching the cheatsheet
using telescope. `:Cheatsheet!` will open in a popup window.

