require("keybindings")
require("options")
require("autocmds")

if vim.g.neovide then
	vim.o.guifont = "JetBrainsMono Nerd Font Mono:h10" -- text below applies for VimScript

	-- vim.g.neovide_padding_top = 2
	-- vim.g.neovide_padding_bottom = 2
	-- vim.g.neovide_padding_right = 2
	vim.g.neovide_padding_left = 5

	vim.g.neovide_transparency = 0.75

	vim.g.neovide_floating_blur_amount_x = 2.0
	vim.g.neovide_floating_blur_amount_y = 2.0

	vim.g.neovide_cursor_vfx_mode = "pixiedust"

	-- vim.g.neovide_cursor_vfx_particle_lifetime = 1.5
	vim.g.neovide_cursor_vfx_particle_density = 25
	-- Put anything you want to happen only in Neovide here
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ import = "plugins" }, {
	ui = {
		border = "rounded",
	},
	performance = {
		rtp = {
			disabled_plugins = {
				"netrwPlugin",
				"gzip",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
	debug = false,
})
