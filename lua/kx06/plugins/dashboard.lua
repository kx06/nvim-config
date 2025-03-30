return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
	config = function()
		local db = require("dashboard")

		db.setup({
			theme = "doom",
			config = {
				header = {
					"",
					"",
					"",
					"",
					"",
					"",
					"  ██╗  ██╗██████╗ ██╗███████╗██╗  ██╗██╗  ██╗██╗  ██╗ ██╗ ██████╗ ",
					"  ██║ ██╔╝██╔══██╗██║██╔════╝██║  ██║██║  ██║██║  ██║███║██╔════╝ ",
					"  █████╔╝ ██████╔╝██║███████╗███████║███████║███████║╚██║███████╗ ",
					"  ██╔═██╗ ██╔══██╗██║╚════██║██╔══██║██╔══██║██╔══██║ ██║██╔═══██╗",
					"  ██║  ██╗██║  ██║██║███████║██║  ██║██║  ██║██║  ██║ ██║╚██████╔╝",
					"  ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═╝ ╚═════╝ ",
					"",
				},
				center = {
					{ icon = "  ", desc = "New file", key = "n", action = "enew" },
					{ icon = "  ", desc = "Find File", key = "f", action = "Telescope find_files" },
					{ icon = "  ", desc = "Find Text", key = "g", action = "Telescope live_grep" },
					{ icon = "  ", desc = "Recent Files", key = "r", action = "Telescope oldfiles" },
					{ icon = "📚 ", desc = "Open Buffers", key = "b", action = "Telescope buffers" },
					{ icon = "⚙️  ", desc = "Config", key = "c", action = "e $MYVIMRC" },
					{ icon = "💤 ", desc = "Lazy Manage", key = "l", action = "Lazy" },
					{ icon = "🚪 ", desc = "Quit NVIM", key = "q", action = "qa" },
				},
			},
		})
	end,
}
