
base_dir ?= $(shell pwd)
project ?= $(shell basename $(pwd))

.PHONY: init 
init:  ## Bootstrap a development environment
	@echo "🧰 Setting up the development toolchain and environment..."
	# ...
	@echo "✅ Done!"


.PHONY: install 
install:  ## Install the project's dependencies
	@echo "📦 Installing dependencies..."
	# ...
	@echo "✅ Done!"


.PHONY: test
test:  ## Run the project's unit test suite
	@echo "🧪 Running tests... "
	# ...
	@echo "✅ Done!"
	

.PHONY: check
check:  ## Run quality checks and linting
	@echo "⏳Running checks... "
	# ...
	@echo "✅ Done!"


.PHONY: build
build:  ## Build the project
	@echo "⏳Building $(project)...."
	# ...
	@echo "✅ Done!"
	

 

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'


.DEFAULT_GOAL := help 
