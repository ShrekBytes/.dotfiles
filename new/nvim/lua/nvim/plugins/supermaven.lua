--------------------------------------------------
-- nvim/plugins/supermaven.lua ----------------
--------------------------------------------------

return {
	"supermaven-inc/supermaven-nvim",
    event = "InsertEnter",
	config = function()
		require("supermaven-nvim").setup({})
	end,
}
