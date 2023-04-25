local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup("det_git")

autocmd(
	"BufEnter",
	{
		group = "det_git",
		pattern = ".gitconfig",
		command = "set filestype=gitconfig",
	}
)

autocmd(
	"BufEnter",
	{
		group = "det_git",
		pattern = ".gitignore*",
		command = "set filestype=gitconfig",
	}
)

autocmd(
	"BufEnter",
	{
		group = "det_git",
		pattern = "~/.config/git/*",
		command = "set filestype=gitconfig",
	}
)

autocmd(
	"BufEnter",
	{
		group = "det_git",
		pattern = ".gitlocal",
		command = "set filestype=gitconfig",
	}
)
