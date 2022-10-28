local M = {}

M.sumneko_lua = {
  filetype = { "lua" },
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim", "require", "ipairs", "pcall" },
			},
		},
	},
}

return M
