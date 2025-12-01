return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		local on_attach = function(client, bufnr)
			if client.server_capabilities.documentFormattingProvider then
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = vim.api.nvim_create_augroup("Format", { clear = true }),
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format()
					end,
				})
			end
		end

		mason.setup()

		mason_lspconfig.setup({
			ensure_installed = {
				"cssls",
				"tailwindcss",
				"html",
				"jsonls",
				"eslint",
				"pyright",
			},
		})

		-- manually configure each LSP after mason-lspconfig installs them
		local servers = {
			"cssls",
			"tailwindcss",
			"html",
			"jsonls",
			"eslint",
			"pyright",
		}

		for _, server in ipairs(servers) do
			vim.lsp.config(server, {
				on_attach = on_attach,
				capabilities = capabilities,
			})
		end
		for _, server in ipairs(servers) do
			vim.lsp.enable(server)
		end
	end,
}
