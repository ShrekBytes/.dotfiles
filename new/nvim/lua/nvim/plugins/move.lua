--------------------------------------------------
-- common/plugins/move.lua --------------------
--------------------------------------------------

return {
	"echasnovski/mini.move",
	version = "*",
    opts = {
        options = {
            reindent_linewise = false, -- Automatically reindent selection during linewise vertical move
    }},
    keys = {
        { '<A-h>', mode = "v", function() require("mini.move").left() end },
        { '<A-j>', mode = "v", function() require("mini.move").down() end },
        { '<A-k>', mode = "v", function() require("mini.move").up() end },
        { '<A-l>', mode = "v", function() require("mini.move").right() end },

        { '<A-h>', mode = "n", function() require("mini.move").line_left() end },
        { '<A-j>', mode = "n", function() require("mini.move").line_down() end },
        { '<A-k>', mode = "n", function() require("mini.move").line_up() end },
        { '<A-l>', mode = "n", function() require("mini.move").line_right() end },
    }
}
