# A Neovim PDE

This is my ever-evolving development environment built on Neovim. It is not a framework 
or template, but can be used for inspiration in your own config. 


Table of Contents
=================

* [Neovim PDE](#neovim-ide)
   * [Plugins](#plugins)
   * [Further Information](#further-information)
   * [Special Thanks](#special-thanks)

---

## Plugins

_This is a list of plugins included in the default distribution and a short description of their purpose._

### Debugging

- [nvim-dap](https://github.com/mfussenegger/nvim-dap) - Debug Adapter Protocol for Neovim
- [nvim-dap-virtual-text](https://github.com/mfussenegger/nvim-dap-virtual-text) - Virtual text display for nvim-dap
- [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) - Graphical debug UI 

---

### Completion
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - Main completion engine
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
- [lspkind-nvim](https://github.com/onsails/lspkind-nvim) - Get VS Code symbols in completion menus

---

### Snippets 
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip) - Snippet engine programmable using Lua

---
### Command Palette and Fuzzy Search
_Telescope acts as command palette and highly extensible interface to Neovim._

- [telescope.nvim/](https://github.com/nvim-telescope/telescope.nvim/)

Dependencies:
	- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
	- [popup.nvim](https://github.com/nvim-lua/popup.nvim)
	- [sqlite.lua](https://github.com/tami5/sqlite.lua)

#### Telescope Enhancements
- [telescope-symbols.nvim](https://github.com/nvim-telescope/telescope-symbols.nvim)
- [telescope-github.nvim](https://github.com/nvim-telescope/telescope-github.nvim)
- [telescope-ui-select.nvim](https://github.com/nvim-telescope/telescope-ui-select.nvim)
- [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim)

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

_*In order to correctly display all of the various glyphs, you will want to install a pached font._  

## Further Information

- The [r/unixporn](https://reddit.com/r/unixporn) subreddit
- The [Awesome-Neovim](https://github.com/rockerBOO/awesome-neovim#readme) List

## Special Thanks 

Users and repositories who taught or inspired me ...


- [ThePrimeagen/.dotfiles](https://github.com/ThePrimeagen/.dotfiles)
- [kabinspace/AstroVim](https://github.com/kabinspace/AstroVim.git)
- [jdhao/nvim-config](https://github.com/jdhao/nvim-config.git)



