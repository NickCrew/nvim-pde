

download_url = "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz"
download_path = ${HOME}/Downloads/nvim-macos.tar.gz
install_path = ${HOME}/opt
bin_path = ${HOME}/Applications

base_dir ?= $(shell pwd)
project ?= $(shell basename $(pwd))


.PHONY: help
help: ## Show this help
		@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.PHONY: update
update: ## Update Neovim nightly
	@echo "\n🌐 Downloading Neovim nightly..."
	@rm $(download_path) || true
	@curl -fsSL $(download_url) -o $(download_path)
	@xattr -c $(download_path)
	@echo "\n📦 Installing Neovim nightly..."
	@tar xvzf $(download_path) -C $(install_path)
	@rm -rvf $(download_path)
	@echo "\n🔗 Creating symlink ..."
	@cd $(bin_path) && ln -sfv ../../opt/nvim-macos/bin/nvim nvim-nightly;
	@echo "\n✅ Installed Neovim nightly!"



.DEFAULT_GOAL := help
