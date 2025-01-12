--------------------------------------------------
-- nvim/plugins/scrollbar.lua -----------------
--------------------------------------------------

return {
	"petertriho/nvim-scrollbar",
	event = "VeryLazy",
	opts = {
		excluded_filetypes = {
			"cmp_docs",
			"cmp_menu",
			"noice",
			"prompt",
			"TelescopePrompt",
			"alpha",
		},
	},
	config = true,
}
