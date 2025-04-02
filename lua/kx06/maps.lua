vim.g.mapleader = " "

local function map(mode, lhs, rhs, opts)
	opts = opts or {}
	opts.silent = true
	vim.keymap.set(mode, lhs, rhs, opts)
end

-- Save
map("n", "<leader>w", "<CMD>update<CR>")

-- Quit
map("n", "<leader>q", "<CMD>q<CR>")

-- Exit insert mode
map("i", "jk", "<ESC>")
map("i", "kj", "<ESC>")

-- NeoTree
map("n", "<leader>e", "<CMD>Neotree toggle<CR>")
map("n", "<leader>r", "<CMD>Neotree focus<CR>")

-- New Windows
map("n", "<leader>o", "<CMD>vsplit<CR>")
map("n", "<leader>p", "<CMD>split<CR>")

-- Window Navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-j>", "<C-w>j")

-- Resize Windows
map("n", "<C-Left>", "<C-w><")
map("n", "<C-Right>", "<C-w>>")
map("n", "<C-Up>", "<C-w>+")
map("n", "<C-Down>", "<C-w>-")

-- Telescope
map("n", "<leader>ff", "<CMD>Telescope find_files<CR>", { desc = "Fuzzy find files in cwd" })
map("n", "<leader>fg", "<CMD>Telescope live_grep<CR>", { desc = "Find string in cwd" })
map("n", "<leader>fb", "<CMD>Telescope buffers<CR>", { desc = "Fuzzy find opened files" })
map("n", "<leader>fs", "<CMD>Telescope git_status<CR>", { desc = "Show git file diffs" })
map("n", "<leader>fc", "<CMD>Telescope git_commits<CR>", { desc = "Browse git commits" })

-- DAP Keymaps
map("n", "<leader>db", function()
	require("dap").toggle_breakpoint()
end, { desc = "DAP: Toggle Breakpoint" })
map("n", "<leader>dB", function()
	require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "DAP: Set Conditional Breakpoint" })
map("n", "<leader>dl", function()
	require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end, { desc = "DAP: Set Logpoint" })
map("n", "<leader>dr", function()
	require("dap").repl.open()
end, { desc = "DAP: Open REPL" })
map("n", "<leader>dc", function()
	require("dap").continue()
end, { desc = "DAP: Continue" })
map("n", "<leader>dj", function()
	require("dap").down()
end, { desc = "DAP: Go Down Stack" }) -- Use 'j' like vim motion
map("n", "<leader>dk", function()
	require("dap").up()
end, { desc = "DAP: Go Up Stack" }) -- Use 'k' like vim motion
map("n", "<leader>do", function()
	require("dap").step_over()
end, { desc = "DAP: Step Over" })
map("n", "<leader>di", function()
	require("dap").step_into()
end, { desc = "DAP: Step Into" })
map("n", "<leader>du", function()
	require("dap").step_out()
end, { desc = "DAP: Step Out" })
map("n", "<leader>dq", function()
	require("dap").terminate()
	require("dapui").close()
end, { desc = "DAP: Terminate/Quit" })
map("n", "<leader>ds", function()
	require("dap").run_to_cursor()
end, { desc = "DAP: Run To Cursor" })
map("n", "<leader>dt", function()
	require("dapui").toggle()
end, { desc = "DAP: Toggle UI" }) -- Toggle UI

-- Optional: Maps for DAP UI specific windows if you want them
-- map("n", "<leader>de", function() require("dapui").eval() end, opts) -- Evaluate expression under cursor
