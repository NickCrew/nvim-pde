# Neovim IDE 

_A PDE (Personal Development Environment) built on Neovim and customized with Lua._  


The documentation for this project is still in progress.  

---

Table of Contents
=================

* [Neovim IDE](#neovim-ide)
   * [Features](#features)
      * [VS Code Compatibility](#vs-code-compatibility)
      * [Keybindings](#keybindings)
      * [Auto-Completion](#auto-completion)
      * [Source Control Management](#source-control-management)
      * [Language Support](#language-support)
      * [Convenience Features](#convenience-features)
      * [Easily discoverable commands and documentation](#easily-discoverable-commands-and-documentation)
   * [Plugin List](#plugin-list)
      * [Debugging Engine](#debugging-engine)
         * [Debugging Enhancements](#debugging-enhancements)
      * [Completion Engine](#completion-engine)
         * [Completion Enhancements](#completion-enhancements)
         * [Completion Sources](#completion-sources)
      * [Snippets Engine](#snippets-engine)
      * [Command Palette and Fuzzy Search](#command-palette-and-fuzzy-search)
         * [Telescope Enhancements](#telescope-enhancements)
   * [Cheatsheets and Custom help](#cheatsheets-and-custom-help)
   * [Further Information](#further-information)
   * [Special Thanks](#special-thanks)


---
## Functionality

_The major features and capabilities of the PDE's default distribution._

---
### VS Code Compatibility

These features are directly compatible with components of VS Code.  

- __Graphical Debugger__
	- Implements VS Code's [Debug Adapter Protocol (DAP)](https://microsoft.github.io/debug-adapter-protocol/).  
	- Evaluate under cursor (or hover) and virtual text display
	- Compatible with `launch.json`
	- Easily install new debug adapters
- __Task Automation__ compatible with `tasks.json`
- __Snippets__ 
	- Compatible with `snippets.json`
	- Includes snippets from several VS Code snippet extensions by defaults
- __Icons__ (from VS Code)
	- File Icons 
	- Language-specific LSP signs in menus and tab bar
- __Command Palette__ - most functionality is available through an extensible command pallete

> _In order to correctly display all of the various glyphs, you will want to install a pached font._
>	`brew tap homebrew/cask-fonts`
>	`brew install --cask font-fira-code-nerd-font`

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
## Plugin List

_This is a list of plugins included in the default distribution and a short description of their purpose._

### Debugging Engine

- [nvim-dap](https://github.com/mfussenegger/nvim-dap) - Debug Adapter Protocol for Neovim

#### Debugging Enhancements
- [nvim-dap-virtual-text](https://github.com/mfussenegger/nvim-dap-virtual-text) - Virtual text display for nvim-dap
- [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) - Graphical debug UI 
- [DAPInstall.nvim](https://github.com/Pocco81/DAPInstall.nvim) - Helper to install debug adapters and configurations


### Completion Engine
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - Main completion engine

#### Completion Enhancements
- [lspkind-nvim](https://github.com/onsails/lspkind-nvim) - Get VS Code symbols in completion menus

#### Completion Sources
_These plugins provide additional sources to the completion engine_  

- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) - The active language server completion source
- [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline) - Command mode
- [cmp-buffer](https://github.com/hrsh7th/cmp-buffer) - Current buffer
- [cmp-path](https://github.com/hrsh7th/cmp-path) - Path completion source
- [cmp-nvim-lua](https://github.com/hrsh7th/cmp-nvim-lua) - Lua Completion Source
- [cmp-copilot](https://github.com/hrsh7th/cmp-copilot) -  Github Copilot source for completion engine
- [cmp-nvim-lua](https://github.com/hrsh7th/cmp-nvim-lua) - Lua source
- [cmp-nvim-lsp-document-symbol](https://github.com/hrsh7th/cmp-nvim-lsp-document-symbol) -  Document Symbol source
- [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip) -  Luasnip Snippet completion source
- [cmp-treesitter](https://github.com/ray-x/cmp-treesitter) -  Treesiter as completion source
- [cmp-spell](https://github.com/f3fora/cmp-spell) - Spellcheck source for completion Engine
- [cmp-rg](https://github.com/lukas-reineke/cmp-rg) -  Ripgrep source for completion engine
- [cmp-git](https://github.com/petertriho/cmp-git) - Git source for completionn engine

### Snippets Engine
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip) - Snippet engine programmable using Lua

### Command Palette and Fuzzy Search
_Telescope acts as command palette and highly extensible interface to Neovim._

- [telescope.nvim/](https://github.com/nvim-telescope/telescope.nvim/)

Dependencies:
	- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
	- [popup.nvim](https://github.com/nvim-lua/popup.nvim)
	- [sqlite.lua](https://github.com/tami5/sqlite.lua)

#### Telescope Enhancements
- [telescope-symbols.nvim](https://github.com/nvim-telescope/telescope-symbols.nvim)
- [telescope-zoxide](https://github.com/jvgrootveld/telescope-zoxide)
- [telescope-github.nvim](https://github.com/nvim-telescope/telescope-github.nvim)
- [telescope-frecency.nvim](https://github.com/nvim-telescope/telescope-frecency.nvim)
- [telescope-vimspector.nvim](https://github.com/nvim-telescope/telescope-vimspector.nvim)
- [telescope-ui-select.nvim](https://github.com/nvim-telescope/telescope-ui-select.nvim)
- [telescope-vimspector.nvim](https://github.com/nvim-telescope/telescope-vimspector.nvim)
- [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim)


---
## Cheatsheets and Custom help
_Store some of your notes here in the custom help docs: `doc/halp`. To update help keywords for searching:_

```vim
:helptags ~/.config/nvim/docs/
```

Add entries to the cheatsheet by editing `cheatsheet.txt`. The `:Cheatsheet` command will allow searching the cheatsheet
using telescope. `:Cheatsheet!` will open in a popup window.


---
## Further Information

- The [r/unixporn](https://reddit.com/r/unixporn) subreddit
- The [Awesome-Neovim](https://github.com/rockerBOO/awesome-neovim#readme) List


---
## Special Thanks 

Users and repositories who taught or inspired me ...


- [ThePrimeagen/.dotfiles](https://github.com/ThePrimeagen/.dotfiles)
- [kabinspace/AstroVim](https://github.com/kabinspace/AstroVim.git)
- [jdhao/nvim-config](https://github.com/jdhao/nvim-config.git)



