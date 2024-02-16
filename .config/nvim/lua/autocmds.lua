local api = vim.api

--          ╭─────────────────────────────────────────────────────────╮
--          │               don't auto comment new line               │
--          ╰─────────────────────────────────────────────────────────╯
api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

--          ╭─────────────────────────────────────────────────────────╮
--          │                    Highlight on yank                    │
--          ╰─────────────────────────────────────────────────────────╯
api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})

--          ╭─────────────────────────────────────────────────────────╮
--          │     Disable certain settings for specific filetypes     │
--          ╰─────────────────────────────────────────────────────────╯
vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"aerial",
		"alpha",
		-- "help",
		"lazy",
		"mason",
		"neo-tree",
	},
	callback = function()
		vim.b.minicomment_disable = true
		vim.b.minitrailspace_disable = true
		vim.b.minisurround_disable = true
		vim.b.miniindentscope_disable = true
	end,
})

--          ╭─────────────────────────────────────────────────────────╮
--          │              close some filetypes with <q>              │
--          ╰─────────────────────────────────────────────────────────╯
api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("close_with_q", { clear = true }),
	pattern = {
		"PlenaryTestPopup",
		"help",
		"lspinfo",
		"man",
		"qf",
		"spectre_panel",
		"startuptime",
		"tsplayground",
		"neotest-output",
		"checkhealth",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})

--                  ▲                                         ▲
--                  █ Effect: URL underline. @implement later █
--                  ▼                                         ▼

--          ╭─────────────────────────────────────────────────────────╮
--          │         Customize right click contextual menu.          │
--          ╰─────────────────────────────────────────────────────────╯
api.nvim_create_autocmd("VimEnter", {
	desc = "Disable right contextual menu warning message",
	callback = function()
		-- Disable right click message
		vim.api.nvim_command([[aunmenu PopUp.How-to\ disable\ mouse]])
		-- vim.api.nvim_command [[aunmenu PopUp.-1-]] -- You can remode a separator like this.
		api.nvim_command([[menu PopUp.Save\ \File <cmd>:w<CR>]])
		vim.cmd.anoremenu({ "PopUp.-Sep1- :" })
		vim.cmd.anoremenu({ "PopUp.-Sep2- :" })
		api.nvim_command([[menu PopUp.Exit <cmd>:q!<CR>]])
	end,
})

--          ╭─────────────────────────────────────────────────────────╮
--          │                Change working directory                 │
--          ╰─────────────────────────────────────────────────────────╯
api.nvim_create_user_command("Cwd", function()
	vim.cmd(":cd %:p:h")
	vim.cmd(":pwd")
end, { desc = "cd current file's directory" })
