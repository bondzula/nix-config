local status_ok, catppuccin = pcall(require, "catppuccin")

if not status_ok then
	return
end

vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha

catppuccin.setup({
  flavour = "mocha",
  background = {
    light = "latte",
    dark = "mocha",
  },
	transparent_background = false,
	term_colors = false,
	dim_inactive = {
		enabled = true,
		shade = "dark",
		percentage = 0.15,
	},
	compile = {
		enabled = false,
		path = vim.fn.stdpath "cache" .. "/catppuccin",
	},
	styles = {
		comments = { "italic" },
		conditionals = {},
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	integrations = {
		treesitter = true,
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
		},
		lsp_trouble = true,
		cmp = true,
		gitsigns = true,
		telescope = true,
		markdown = true,
		notify = true,
		symbols_outline = true,
    harpoon = true,
    overseer = true,
    which_key = true,

    -- Special
    navic = {
      enabled = true,
      -- custom_bg = "NONE",
    }
	},
	color_overrides = {},
	highlight_overrides = {},
})

vim.cmd([[colorscheme catppuccin]])
