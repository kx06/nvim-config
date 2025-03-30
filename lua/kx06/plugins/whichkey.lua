return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {
		win = {
			border = "rounded",
			padding = { 1, 2, 1, 2 },
		},
		layout = {
			spacing = 6,
		},
	},
}
