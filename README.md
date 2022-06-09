# Neovim IDE 

_A PDE (Personal Development Environment) built on Neovim and customized with Lua._
---

Table of Contents
=================

* [Neovim IDE](#neovim-ide)
   * [Features](#whats-inside)
      * [VCS Integration](#vcs-integration)
      * [Graphical Debugger](#graphical-debugger)
      * [Large Language Support](#large-language-support)
      * [Snippets](#snippets)
      * [Fast Search and Navigation](#fast-search-and-navigation)
      * [Beautiful Interface](#beautiful-interface)
      * [Easily discoverable commands and documentation](#easily-discoverable-commands-and-documentation)
   * [BEWARE](#beware)
   * [Preparing Your Workstation](#preparing-your-workstation)
      * [Neovim](#neovim)
      * [Fonts](#fonts)
      * [External Tools](#external-tools)
   * [Language Support](#language-support)
   * [Neovim Plugin Overview](#neovim-plugin-overview)
      * [Completion](#completion)
         * [nvim-cmp](#nvim-cmp)
            * [Completion Plugins](#completion-plugins)
      * [Debuggers](#debuggers)
         * [Vimspector](#vimspector)
         * [nvim-dap](#nvim-dap)
      * [Debug Information](#debug-information)
      * [Command Palette](#command-palette)
         * [Telescope Dependencies](#telescope-dependencies)
            * [Telescope Extensions](#telescope-extensions)
      * [Tags, Symbols and File Tree](#tags-symbols-and-file-tree)
      * [Parsing](#parsing)
         * [Treesitter Extensions](#treesitter-extensions)
      * [Auto-formatting](#auto-formatting)
      * [Bookmarks](#bookmarks)
      * [Editing Enhancements](#editing-enhancements)
      * [Fancy-pants UI Enhancements](#fancy-pants-ui-enhancements)
      * [Cheatsheets and Custom help](#cheatsheets-and-custom-help)
   * [Special Thanks](#special-thanks)

---

## Features

---
### VS Code Compatibility

These features are directly compatible with components used with VS Code.  

- __Graphical Debugger__
	- Implements VS Code's Debug Adapter Protocol (DAP)
	- Evaluate under cursor (or hover) and virtual text display
	- Compatible with `launch.json`
	- Easily install debug adapters using `DAPInstall`
- __Task Automation__ compatible with `tasks.json`
- __Snippets__ 
	- Compatible with `snippets.json`
	- Includes snippets from several VS Code snippet extensions by defaults
- __Icons__ (from VS Code)
	- File Icons 
	- Language-specific LSP signs in menus and tab bar
- __Command Palette__ - most functionality is available through an extensible command palletekkkkkkkkkkkk

---
### Keybindings

- Easy and logical method for assigning keybindings
- Inline (zero overhead) help remembering or discovering keybindings
- Complete (including native keybindings) and searchable legend

---
### Auto-Completion

Includes __Path intellisense__ and __command-mode__ (`:`) completion.  

Auto-complete is highly configurable and supports many sources:  

- Language server
- Current Buffer
- Git 
- Ripgrep
- Github Copilot
- Treesitter

---
### Source Control Management

- Show changes in the sign column (gutter)
- Local git repo integrations including _Stage/Unstage_ chunk
- Github integration (PRs, issues)
- Blame and commit messages for current line

---
### Language Support

There are several language servers installed by default. You can easily add/remove additonal
language servers using `:LSPInstall`. 

_Enable/Disable_ installed language servers using the config at `lua/lsp/servers.lua`.  

- Ansible
- Bash
- CSS
- Dockerfile
- Javascript
- Lua
- Markdown
- Python
- Rust
- TOML
- Terraform
- Typescript
- Vimscript
- YAML
- HTML


> __LSP Capabilities__
>
> - Auto-completion Source
> - (Automatic) Formatting and Linting
> - Go To definition (preview available)
> - Find All References (preview available)
> - Callstack
> - Code Outline
> - Symbol Outline
> - Signature Help
> - Preview Definition
> - Recommended Code Actions/Fixes

---
### Convenience Features

- Color highlight (by hex value)
- Integrated personal wiki and cheatsheet editor
- Intergation with Dash.app (API documentation app for macOS)
- Powerful find and replace tool
- Extremely fast code search tool
- Innovative fast navigation tool based on the idea that in most cases for a given project, we are frequently returning
  the same set of 4-5 files

---
### Easily discoverable commands and documentation
- All default and custom keybindings are automatically added to the command palette
- Customizable quick cheatsheet
- Integrated personal wiki 
- Integrated with Dash.app or devdocs.io documentation sources
- Easy user-level customizations

---
## BEWARE 

> __!! BE YE WARNED NOW LEST YE SUFFER MOST HORRIBLY !!__

You will only find pain and despair if you attempt to blindly copy some nutjob's huge Vim configuration. Nevertheless,
it is helpful to have a rough guide as to which plugin's do what and their compatibility or customization options.  

Only a lunatic would go through this effort when you can have the cheap version in VS Code ready in 5 minutes. If you
are one of those lunatics... read on...

My hope is this will eventually get to the point that it can act as a framework to bootstrap you into a productive
environment and guide your through more advanced Neovim concepts.


---

## Preparing Your Workstation 


Bootstrap scripts are provided for a good deal of the dependencies and rerequisites but we will still go over them here.  

These instructions are for macOS but you can work out the details if you're on Linux. 

### Neovim 


It is recommended that you install Neovim from `HEAD` to get the latest and greatest.
```bash
brew install --HEAD Neovim
```
Don't forget to upgrade often with:

```bash
brew upgrade --fetch-HEAD neovim
```

### Fonts 
You need a patched font in order to see the full range of icons and symbols. A Nerd Font is a good bet.  

The [devicons](https://github.com/kyazdani42/nvim-web-devicons) are available as a Neovim extension but we'll need to
install the Nerd Font(s) manually or using our package manager.

```bash
brew tap homebrew/cask-fonts
brew install --cask font-fira-code-nerd-font
```

### External Tools 

Many tools used here are created with Rust and available as cargo packages so we should install Rust
````bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source ~/.cargo/env  # make sure this gets added your .zshrc or .bashrc
````

```bash
# Ripgrep is used by many components spots for fast searching. Use `cargo` or brew to install.
cargo install ripgrep

# Zoxide is a fast directory switcher 
cargo install zoxide

# Fzf is a nice fuzzy finder
cargo install fzf

# fd is a faster replacement for the normal find command
cargo install fd-find

# bat is a cat alternative with better builtin syntax highlighting
cargo install bat
```

---
## Feature Overview

### Installing Language Support 

> Most language servers implementing the [Language Server Protocol (LSP)](https://microsoft.github.io/language-server-protocol/) will work with the support built in to Neovim and the plugin [lsp-config](https://github.com/neovim/nvim-lspconfig).

````vim
:LSPInstall pyright
````

---

### Debugging

> Most debuggers implementing the [Debug Adapter Protocol (DAP)](https://microsoft.github.io/debug-adapter-protocol/) are
supported via [nvim-dap](https://github.com/mfussenegger/nvim-dap).

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

> To debug node.js code, you can install a config for vimspector to your project.
```bash
npm -g install vimspector-config
```

> __Alternative:__ Vimspector is an alternative, however it was written for Vim and is not optimized for Neovim.
- [vimspector/](https://puremourning.github.io/vimspector/)

---

### Completion and Snippets

#### nvim-cmp
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)

- [lspkind-nvim](https://github.com/onsails/lspkind-nvim)
- [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline)
- [cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
- [cmp-path](https://github.com/hrsh7th/cmp-path)
- [cmp-nvim-lua](https://github.com/hrsh7th/cmp-nvim-lua)

#### LuaSnip
Snippets fully programmable using Lua and VS Code snippets for various languages. Completion via `nvim-cmp`.
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip)
- [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)
- [friendly-snippets](https://github.com/rafamadriz/friendly-snippets)

---

### Command Palette and Fuzzy Search
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

### Workbench

#### LSP Symbols
- [aerial.nvim](https://github.com/stevearc/aerial.nvim)

#### File Drawer
- [nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua)

---

### Syntax Parsing (Treesitter)
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
- [ThePrimeagen/harpoon](https://github.com/ThePrimeagen/harpoon)

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

---

## Special Thanks 

Users and repositories who taught or inspired me ...

- [mrjones2014/dotfiles](https://github.com/mrjones2014/dotfiles.git)
- [kabinspace/AstroVim](https://github.com/kabinspace/AstroVim.git)
- [jdhao/nvim-config](https://github.com/jdhao/nvim-config.git)
- [VapourNvim/VapourNvim](https://github.com/VapourNvim/VapourNvim.git)
- [SingularisArt/Death.Neovim](https://github.com/SingularisArt/Death.NeoVim.git)
- [shMorganson/dot-files](https://github.com/shMorganson/dot-files.git)

Valuable resources and communities ...
- The [r/unixporn](https://reddit.com/r/unixporn) subreddit
- The [Awesome-Neovim](https://github.com/rockerBOO/awesome-neovim#readme) List


