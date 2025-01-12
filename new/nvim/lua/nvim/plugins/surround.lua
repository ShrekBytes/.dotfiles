--------------------------------------------------
-- common/plugins/surround.lua ----------------
--------------------------------------------------

return {
	"kylechui/nvim-surround",
	version = "*",
	event = "BufReadPost",
	config = function()
		require("nvim-surround").setup({
			-- Configuration here, or leave empty to use defaults
		})
	end,
}
