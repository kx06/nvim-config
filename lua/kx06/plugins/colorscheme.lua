return {
	-- AstroTheme
	{
		"AstroNvim/astrotheme",
		lazy = false, -- Load during startup
		priority = 1000, -- Load this before other plugins
		config = function()
			-- Configure AstroTheme
			require("astrotheme").setup({
				-- Using dark style instead of day
				style = "dark",

				-- Customize palette overrides
				palette_overrides = {
					-- You can override specific color values if needed
					-- E.g.: dark = { blue = "#61afef" }
				},

				-- Component overrides allow you to customize specific components
				component_overrides = {
					-- Examples of component overrides:
					diagnostics = { errors = { fg = "#ff5555" } },

					-- Note: remove these if you want to use the defaults
					search = { bg = "#3a5978", fg = "#ffffff" },
					comments = { italic = true },
					headings = {
						h1 = { bold = true, fg = "#61afef" },
						h2 = { bold = true, fg = "#61afef" },
					},
				},

				-- Other options
				terminal_colors = true, -- Use terminal colors
				inactive = { -- Dull colors for inactive splits
					enable = true,
					background = true,
				},

				plugins = {
					aerial = true,
					beacon = true,
					bufferline = true,
					dashboard = true,
					gitsigns = true,
					hop = true,
					illuminate = true,
					indent_blankline = true,
					lightspeed = true,
					lsp_trouble = true,
					mini = true,
					native_lsp = true,
					neogit = true,
					neotest = true,
					neotree = true,
					notify = true,
					nvimtree = true,
					packer = true,
					symbol_outline = true,
					telescope = true,
					treesitter = true,
					which_key = true,
				},
			})

			vim.cmd([[colorscheme astrotheme]])
		end,
	},
}
