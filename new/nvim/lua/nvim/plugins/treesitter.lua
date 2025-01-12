-- TODO: treesitter
-- implement later

return {
	{
		"nvim-treesitter/nvim-treesitter",
        event = { "BufReadPost", "BufNewFile" },
		build = ":TSUpdate",
		event = "VeryLazy",
		config = function()
			require("nvim-treesitter.configs").setup({})
		end,
	},
}
