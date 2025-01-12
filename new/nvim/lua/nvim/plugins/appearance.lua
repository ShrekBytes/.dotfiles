--------------------------------------------------
-- nvim/plugins/appearance.lua ----------------
--------------------------------------------------

return {
	--------------------------------------------------
	-- tokyonight.nvim ----------------------------
	--------------------------------------------------
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				style = "night",
				transparent = true,
				styles = {
					comments = { italic = true },
					keywords = { italic = true },
					functions = { bold = true },
					variables = {},
					sidebars = "dark",
					floats = "dark",
				},
				dim_inactive = true,
				lualine_bold = true,
			})
			vim.cmd([[colorscheme tokyonight-night]])
		end,
	},

	--------------------------------------------------
	-- Mini.Indentscope ---------------------------
	--------------------------------------------------
	{
		"echasnovski/mini.indentscope",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("mini.indentscope").setup({
				draw = {
					delay = 0,
				},
				-- Module mappings. Use `''` (empty string) to disable one.
				mappings = {
					object_scope = "ii",
					object_scope_with_border = "ai",
					goto_top = "[i",
					goto_bottom = "]i",
				},
				-- Options which control scope computation
				options = {
					border = "top",
					indent_at_cursor = true,
					try_as_border = true,
				},
				symbol = "▎",
			})
		end,
	},

	--------------------------------------------------
	-- Indent Blankline ----------------------------
	--------------------------------------------------
	{
		"lukas-reineke/indent-blankline.nvim",
        event = "BufReadPre",
		main = "ibl",
		opts = {
			indent = {
				char = "▎",
				tab_char = "▎",
			},
			scope = { enabled = false }, -- disable scope since we use mini.indentscope
			exclude = {
				filetypes = {
					"help",
					"dashboard",
					"lazy",
					"mason",
					"notify",
				},
			},
		},
	},

	--------------------------------------------------
	-- Mini.Cursorword ----------------------------
	--------------------------------------------------
	{
		"echasnovski/mini.cursorword",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("mini.cursorword").setup()
		end,
	},
}
