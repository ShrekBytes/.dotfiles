--------------------------------------------------
-- nvim/plugins/files.lua ---------------------
--------------------------------------------------

return {
	"echasnovski/mini.files",
	version = "*",
    keys = {
        {"<leader>e", mode = { "n", "v" }, function() require("mini.files").open() end, desc = "File Explorer"},
    }
}
