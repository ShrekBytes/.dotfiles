return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"pyright",
					"clangd",
					"jdtls",
					"lua_ls",
					"tsserver",
					"prosemd_lsp",
					"bashls",
					"html",
					"cssls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")

			lspconfig.pyright.setup({
				capabilities = capabilities,
			})
			lspconfig.clangd.setup({
				capabilities = capabilities,
			})
			lspconfig.jdtls.setup({
				capabilities = capabilities,
			})
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.tsserver.setup({
				capabilities = capabilities,
			})
			lspconfig.prosemd_lsp.setup({
				capabilities = capabilities,
			})
			lspconfig.bashls.setup({
				capabilities = capabilities,
			})
			lspconfig.html.setup({
				capabilities = capabilities,
			})
			lspconfig.cssls.setup({
				capabilities = capabilities,
			})

			-- Show hover information for the symbol under the cursor
			vim.keymap.set("n", "<leader>ci", vim.lsp.buf.hover, { desc = "Show Hover Information" })
			-- Go to the definition of the symbol under the cursor
			vim.keymap.set("n", "<leader>cD", vim.lsp.buf.definition, { desc = "Go to Definition" })
			-- Show references to the symbol under the cursor
			vim.keymap.set("n", "<leader>cR", vim.lsp.buf.references, { desc = "Show References" })
			-- Execute code actions for the symbol under the cursor
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
		end,
	},
}
