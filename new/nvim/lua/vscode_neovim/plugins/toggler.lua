--------------------------------------------------
-- common/plugins/toggler.lua -----------------
--------------------------------------------------

return {
	"nguyenvukhang/nvim-toggler",
	config = function()
		require("nvim-toggler").setup({
			inverses = {
				["vim"] = "emacs",
				["true"] = "false",
				["True"] = "False",
				["TRUE"] = "FALSE",
				["0"] = "1",
				["off"] = "on",
				["Off"] = "On",
				["OFF"] = "ON",
				["no"] = "yes",
				["No"] = "Yes",
				["NO"] = "YES",
				["enabled"] = "disabled",
				["Enabled"] = "Disabled",
				["ENABLED"] = "DISABLED",
				["active"] = "inactive",
				["Active"] = "Inactive",
				["ACTIVE"] = "INACTIVE",
				["up"] = "down",
				["Up"] = "Down",
				["UP"] = "DOWN",
				["top"] = "bottom",
				["Top"] = "Bottom",
				["TOP"] = "BOTTOM",
				["horizontal"] = "vertical",
				["Horizontal"] = "Vertical",
				["HORIZONTAL"] = "VERTICAL",
				["left"] = "right",
				["Left"] = "Right",
				["LEFT"] = "RIGHT",
				["min"] = "max",
				["Min"] = "Max",
				["MIN"] = "MAX",
				["start"] = "end",
				["Start"] = "End",
				["START"] = "END",
				["Walid"] = "Nigga",
				["walid"] = "nigga",
				["WALID"] = "NIGGA",
			},
			remove_default_inverses = true,
			autoselect_longest_match = false,
		})
	end,
}
