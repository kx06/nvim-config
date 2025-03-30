return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			-- Installs debug adapters automatically using Mason
			{
				"jay-babu/mason-nvim-dap.nvim",
				-- Ensure mason-nvim-dap is loaded only after nvim-dap
				dependencies = "nvim-dap",
				-- Opts forwarded to mason-nvim-dap
				opts = {
					-- Makes mason-nvim-dap install all the adapters you listed in `ensure_installed`
					automatic_installation = true,
					-- Provide the list of debug adapters to install
					-- Example adapters: python, codelldb (C/C++/Rust), node2, java-debug-adapter, delve (Go)
					-- Add the ones you need! Check :Mason for available adapter names.
					ensure_installed = {
						"python",
						"codelldb",
						"java-debug-adapter",
						"delve", -- For Go
						-- Add other adapters you use, e.g., "node2" for Node.js
					},
					-- Provides handlers for setting up specific adapters.
					-- You can use this to pass configuration specific to an adapter.
					handlers = {
						-- Example handler for python, you can add more if needed
						-- python = function(config)
						--   -- Example: Set up virtual environment path automatically (requires python-lsp-server)
						--   config.python = function()
						--     local venv = os.getenv('VIRTUAL_ENV')
						--     if venv then
						--       return venv .. '/bin/python'
						--     else
						--       return '/usr/bin/python' -- Or your default python path
						--     end
						--   end
						--   require('mason-nvim-dap').default_setup(config) -- Apply the default setup
						-- end,
						-- Default handler function if no specific handler is found for an adapter
						-- function(config)
						--   require('mason-nvim-dap').default_setup(config)
						-- end
					},
				},
			},

			-- UI for DAP
			{
				"rcarriga/nvim-dap-ui",
				-- Ensure dap-ui is loaded only after nvim-dap
				dependencies = {
					"mfussenegger/nvim-dap",
					"nvim-neotest/nvim-nio",
				},
				config = function()
					local dapui = require("dapui")
					dapui.setup({
						-- You can customize the layout and icons here
						layouts = {
							{
								elements = {
									-- Elements to show (see :help dapui-elements)
									{ id = "scopes", size = 0.25 },
									{ id = "breakpoints", size = 0.25 },
									{ id = "stacks", size = 0.25 },
									{ id = "watches", size = 0.25 },
								},
								size = 40, -- % of total width
								position = "left", -- 'left', 'right', 'top', 'bottom'
							},
							{
								elements = {
									{ id = "repl", size = 0.5 },
									{ id = "console", size = 0.5 },
								},
								size = 0.25, -- % of total height
								position = "bottom",
							},
						},
						floating = {
							max_height = nil, -- Use default
							max_width = nil, -- Use default
							border = "rounded", -- Border style
							mappings = {
								-- Mappings when the dap-ui floating window is focused
								close = { "q", "<Esc>" },
							},
						},
						-- Controls the visibility of dap-ui elements
						render = {
							max_type_length = nil, -- Can be integer or nil.
						},
					})

					local dap = require("dap")
					-- Automatically open/close dap-ui when debugging starts/stops
					dap.listeners.after.event_initialized["dapui_config"] = function()
						dapui.open()
					end
					dap.listeners.before.event_terminated["dapui_config"] = function()
						dapui.close()
					end
					dap.listeners.before.event_exited["dapui_config"] = function()
						dapui.close()
					end
				end,
			},
		},
		-- Optional: You can configure nvim-dap itself here if needed,
		-- but mason-nvim-dap often handles adapter registration.
		config = function()
			-- Define highlight groups for DAP icons
			vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#f7768e", bg = "NONE" }) -- Red for breakpoints
			vim.api.nvim_set_hl(0, "DapStopped", { fg = "#7dcfff", bg = "NONE" }) -- Blue for current position
			vim.api.nvim_set_hl(0, "DapLogPoint", { fg = "#bb9af7", bg = "NONE" }) -- Purple for log points
			vim.api.nvim_set_hl(0, "DapBreakpointCondition", { fg = "#e0af68", bg = "NONE" }) -- Yellow/orange for conditions
			vim.api.nvim_set_hl(0, "DapStoppedLine", { bg = "#253340" }) -- Subtle background for the current line

			-- Configure signs for breakpoints with cleaner icons and colors
			vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
			vim.fn.sign_define(
				"DapStopped",
				{ text = "▶", texthl = "DapStopped", linehl = "DapStoppedLine", numhl = "" }
			)
			vim.fn.sign_define("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })
			vim.fn.sign_define(
				"DapBreakpointCondition",
				{ text = "◉", texthl = "DapBreakpointCondition", linehl = "", numhl = "" }
			)

			-- Add language-specific adapter configurations here IF mason-nvim-dap doesn't handle them
			-- or if you need very specific launch configurations.
			-- Example for Python (usually handled by mason-nvim-dap now)
			-- require('dap-python').setup('python') -- Requires nvim-dap-python plugin if used

			-- Example for Java (jdtls can sometimes provide this, but java-debug-adapter is common)
			-- require('config.dap.java').setup() -- You would create this file
		end,
	},

	-- Optional: Add specific language DAP configurations if needed (e.g., for Python virtual envs)
	-- {
	--   "mfussenegger/nvim-dap-python",
	--   ft = "python", -- Load only for python files
	--   dependencies = "mfussenegger/nvim-dap",
	--   config = function(_, opts)
	--      -- Points to your python path (can be dynamic to respect virtualenvs)
	--     require('dap-python').setup(vim.fn.executable('python3') and 'python3' or 'python')
	--   end,
	-- },
}
