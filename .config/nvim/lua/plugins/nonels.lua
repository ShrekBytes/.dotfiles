return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		-- Configure null-ls with specified sources for formatting and diagnostics
		null_ls.setup({
			sources = {
				-- python
				null_ls.builtins.diagnostics.flake8,
				null_ls.builtins.formatting.autopep8,

				--c, c++
				null_ls.builtins.diagnostics.cpplint,
				null_ls.builtins.formatting.clang_format, -- also for java, csharp

				-- java

				-- lua
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.diagnostics.luacheck,

				-- javascript
				null_ls.builtins.formatting.prettier, -- also html and css
				null_ls.builtins.diagnostics.standardjs,

				-- markdown and txt
				null_ls.builtins.diagnostics.textlint,
				null_ls.builtins.formatting.textlint,

				-- shell
				null_ls.builtins.formatting.shfmt,
				null_ls.builtins.diagnostics.shellcheck,

				-- html and css
				null_ls.builtins.diagnostics.stylelint,
				null_ls.builtins.diagnostics.markuplint,

				-- others
				-- null_ls.builtins.completion.codespell,
			},
		})

		-- Key mapping for formatting
		vim.keymap.set("n", "<leader>fc", vim.lsp.buf.format, {})
	end,
}
