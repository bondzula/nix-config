local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- For esier usage
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
	debug = false,
	sources = {
		-- General formatting
		formatting.trim_newlines,
		formatting.trim_whitespace,

		-- Javascript (js, jsx, vue)
		formatting.prettier,

		diagnostics.eslint,
    code_actions.eslint,

    diagnostics.vale,

		-- PHP
		-- TODO: php_cs_fixer
    diagnostics.phpstan,

    -- YAML
    diagnostics.yamllint,

    -- Ansible
    diagnostics.ansiblelint,

    -- Bash formatter
    formatting.shfmt
	},
  on_attach = require("plugins.lsp.handlers").on_attach,
})
