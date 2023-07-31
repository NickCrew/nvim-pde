
local execute = vim.api.nvim_cmd
for _, abbrev in ipairs({
	{ "Bpt", "BreakpointToggle" },
	{ "Cgwt", "CreateWorktree" },
	{ "Dap", "Debug" },
	{ "Dc", "DapCmds" },
	{ "Ds", "DebugSelection" },
	{ "Ff", "Fern" },
	{ "Fmt", "Format" },
	{ "Gs", "Gitsigns" },
	{ "Lgwt", "ListWorktrees" },
	{ "Mt", "MundoToggle" },
	{ "N", "Neogen" },
	{ "Pc", "PackerCompile" },
	{ "Pi", "PackerInstall" },
	{ "Ps", "PackerSync" },
	{ "Pu", "PackerUpdate" },
	{ "Rlf", "ReloadLuafile" },
    { "UT", "UpdateTheme"},
	{ "T", "Telescope" },
	{ "Wk", "WhichKey" },
}) do
	execute({
		cmd = "cnoreabbrev",
		args = abbrev,
	}, {})
end
