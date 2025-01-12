--------------------------------------------------
-- Space as Leader Key ------------------------
--------------------------------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--------------------------------------------------
-- Load Configurations ------------------------
--------------------------------------------------
-- Load VSCode Neovim configurations
if vim.g.vscode then
	require("vscode_neovim.options")
	require("vscode_neovim.keymaps")
	require("vscode_neovim.autocmds")

-- Load Neovim configurations
else
	require("nvim.options")
	require("nvim.keymaps")
	require("nvim.autocmds")

	-- Load extra configurations for Neovide
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
	end
end

--------------------------------------------------
-- Setup Lazy.nvim ----------------------------
--------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

--------------------------------------------------
-- Load Lazy.nvim -----------------------------
--------------------------------------------------
require("lazy").setup({
	spec = {
		{ import = vim.g.vscode and "vscode_neovim.plugins" or "nvim.plugins" }, -- Import plugins based on the environment
	},

	ui = not vim.g.vscode and { border = "rounded" } or nil, -- UI Configuration (only for non-VSCode)
	-- load colorschemes when starting an installation during startup
	install = {
		colorscheme = { "tokyonight", "habamax" },
		checker = { enabled = false }, -- Automatically check for plugin updates
	},
	change_detection = { enabled = false }, -- Do not automatically check for config file changes

	-- Performance Optimizations
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
