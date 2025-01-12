--------------------------------------------------
-- vscode_neovim/autocmds.lua -----------------
--------------------------------------------------

local api = vim.api

--------------------------------------------------
-- Disable auto comment new line -------------
--------------------------------------------------
api.nvim_create_autocmd("BufEnter", {
	group = vim.api.nvim_create_augroup("disable_auto_comment", { clear = true }),
	command = [[set formatoptions-=cro]],
})

--------------------------------------------------
-- Highlight on yank --------------------------
--------------------------------------------------
vim.api.nvim_set_hl(0, "YankHighlight", { bg = "#F7768E", blend = 50 })

api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank({
			higroup = "YankHighlight",
			timeout = 150,
		})
	end,
})
