# Neovim IDE 

*A dev tool suite built on Neovim for VS Code Apostates*

---

## Contents <a name="outline"/>

1. [Summary](#summary)
2. [Warning](#warning)
3. [Prerequisites](#prereqs)
	1. [Neovim](#nvim)
	2. [Fonts](#fonts)
	3. [Tools](#tools)
4. [Language Support](#langservers)
5. [Plugin Directory](#pluglist)
6. [Special Thanks](#thanks)


---

## What's Inside <a name="summary"/>

- __Git Integration__
	- Changes in gutter and status bar
	- Toggle in-line blame messages and commit messages
	- Github integration including pull requests
	- Stage, preview, diff, etc. selected hunks of code

- __Tree-style Undo (Cmd+z) History__

- __Define and Run Tasks__ using VS Code's `tasks.json` (supports all variables)

- __Debug your code__ in a familiar layout like is found in VS Code
	- Use VS Code's `launch.json` files to configure your debugger
	- Compatible with many debug adapters found in VS Code extensions (including Firefox and Chrome)
	- In-line virtual text and hover to inspect
	- Debug in a graphical user interface with configurable layouts and panes for
		- Variables
		- Watch
		- Debug Console
		- Call Stack

- __Unit Test Runner__
- __Integrated Terminal__
- __REPLs for most languages__
- __Hacker Scratch Pad__
- __RESTful API and HTTP Client__

- __Extensive filetype support__ and easy-to-define __custom filetypes__
- __Easily add support for any language__ (Python, Rust, Javascript, Typescript, etc.)
	- Intellicode (Syntax parsing)
	- Auto Formatting and Linting (including docstrings)
	- VS Code Language server functionality 
		- Go To definition
		- Callstack
		- Find All References
		- Recommended Code Actions/Fixes
		- Document Symbols and Outline
		- Preview Definition
		- Completion Entries
		- And more...

- __Snippet engine__ that is fully programmable using Lua 
	- Compatible with your existing VS Code snippets using `snippets.json` files
	- Includes most snippets provided by VS Code and common extensions
	- Use Tabnine AI completion source

- __Fast project navigation and search__ 
	- File Tree
	- Super-fast Code Search
	- Code Outline
	- Advanced Find and REplace
	- Bookmarks

- __Programmable macros and multi-register clipboard handling__

- __Beautiful user interface__ featuring
	- VS Code File Icons and Completion-Kind Symbols
	- Smooth Scrolling
	- Fancy TODOs, Warnings, Notes, etc. 
	- Color (hex value) highlighting 
	- Awesome included color schemes

- __Easily discoverable commands and documentation__
	- All default and custom keybindings are automatically added to the command palette
	- Customizable quick cheatsheet
	- Integrated personal wiki 
	- Integrated with Dash.app or devdocs.io documentation sources

- __Easy user-level customizations__

---

## BEWARE <a href="warning"/>

> __!! BE YE WARNED NOW LEST YE SUFFER MOST HORRIBLY !!__

You will only find pain and despair if you attempt to blindly copy some nutjob's huge Vim configuration. Nevertheless,
it is helpful to have a rough guide as to which plugin's do what and their compatibility or customization options.  

Only a lunatic would go through this effort when you can have the cheap version in VS Code ready in 5 minutes. If you
are one of those lunatics... read on...

My hope is this will eventually get to the point that it can act as a framework to bootstrap you into a productive
environment and guide your through more advanced Neovim concepts.


---

## Preparing Your Workstation <a href="prereqs"/>

Bootstrap scripts are provided for a good deal of the dependencies and rerequisites but we will still go over them here.  

These instructions are for macOS but you can work out the details if you're on Linux. 

### Neovim <a href="nvim"/>

It is recommended that you install Neovim from `HEAD` to get the latest and greatest.
```bash
brew install --HEAD Neovim
```
Don't forget to upgrade often with:

```bash
brew upgrade --fetch-HEAD neovim
```

### Fonts <a href="fonts"/>
You need a patched font in order to see the full range of icons and symbols. A Nerd Font is a good bet.  

The [devicons](https://github.com/kyazdani42/nvim-web-devicons) are available as a Neovim extension but we'll need to
install the Nerd Font(s) manually or using our package manager.

```bash
brew tap homebrew/cask-fonts
brew install --cask font-fira-code-nerd-font
```

### External Tools <a href="tools"/>

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

## Language Support <a href="langservers"/>

Install language servers like so
````vim
:LSPInstall pyright
````

---

## Neovim Plugin Overview <a href="pluglist"/>

This section will go over the comprehensive list of plugins used in this kit

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

> To debug node.js code, you can install a config for vimspector to your project.
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

## Special Thanks <a href="thanks"/>

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


