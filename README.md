# Personal Development Environment

__This is a Neovim configuration__ (not a "distro" or framework) that 
creates an integrated development environment __personalized for me__. 
Parts of  it may work well for you, too.

This is a continuation of config that I've used for over 7 years (without restarting from scratch).
I started using Neovim in 2022 and now the config is pure Lua.
It could be than it is but I forget whats there if I don't set it up myself. I like building 
my own tools in general and find the practical benefits to be worth the extra effort.

---

Table of Contents
=================

* [Personal Development Environment](#personal-development-environment)
   * [Capabilities](#Capabilities)
        * [Language Support](#language-support)
            * [Language Servers (LSP)](#lsp)
            * [Debuggers (DAP)](#dap)
            * [Formatters](#formatters)
            * [Linters](#linters)
---



### Language Support

Currently, this config has the best support for __Python__. (Debugging, Linting, etc. is all configured.)

I also write a lot of YAML, Ansible, Markdown, AsciiDoc, Shell, and Lua.

Full list of packages as of *__Nov. 10, 2023__*:

#### LSP
````
✓ ansible-language-server ansiblels
✓ bash-language-server bashls
✓ dockerfile-language-server dockerls
✓ gopls
✓ helm-ls helm_ls
✓ json-lsp jsonls
✓ lua-language-server lua_ls
✓ nginx-language-server
✓ pyright
✓ remark-language-server remark_ls
✓ rust-analyzer rust_analyzer
✓ taplo
✓ terraform-ls terraformls
✓ typescript-language-server tsserver
✓ vim-language-server vimls
✓ yaml-language-server yamlls
````

#### DAP
````
✓ bash-debug-adapter
✓ codelldb
✓ debugpy
✓ delve
✓ firefox-debug-adapter
✓ go-debug-adapter
✓ js-debug-adapter
✓ node-debug2-adapter
  
````
#### Linters
````
✓ ansible-lint
✓ cfn-lint
✓ codespell
✓ commitlint
✓ cspell
✓ gitleaks
✓ gitlint
✓ jsonlint
✓ markdownlint
✓ shellcheck
✓ yamllint
````
#### Formatters
````
 ✓ black
 ✓ docformatter
 ✓ fixjson
 ✓ markdown-toc
 ✓ markdownlint
 ✓ stylua
 ````

 ---





