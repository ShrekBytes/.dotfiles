--------------------------------------------------
-- nvim/plugins/snipe.lua ---------------------
--------------------------------------------------
return {
	"leath-dub/snipe.nvim",
	config = function()
		local snipe = require("snipe")
		snipe.setup({
			hints = {
				-- If you remove `j` and `k` from below, you can navigate in the plugin
				dictionary = "asfghl;wertyuiop",
			},
			navigate = {
				-- cancel the snipe and close the window.
				cancel_snipe = "q",
				-- Close the buffer under the cursor
				close_buffer = "d",
			},
			-- Can be any of "default" (sort buffers by their number) or "last" (sort buffers by last accessed)
			sort = "default",
		})
	end,
	keys = {
		{
			"gb",
			function()
				require("snipe").open_buffer_menu()
			end,
			desc = "Open Snipe buffer menu",
		},
	},
}
