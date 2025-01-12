--------------------------------------------------
-- vscode_neovim/options.lua ------------------
--------------------------------------------------

-- System Clipboard
vim.opt.clipboard = "unnamedplus" -- Copy to system clipboard

-- Indentation
vim.opt.smartindent = true -- Enable smart auto-indenting
vim.opt.autoindent = true -- Enable auto-indenting

-- Search and Highlighting
vim.opt.incsearch = true -- Enable incremental search
vim.opt.hlsearch = true -- Highlight search matches
vim.opt.ignorecase = true -- Ignore case when searching
vim.opt.smartcase = true -- Override 'ignorecase' if search contains uppercase

-- Split Navigation
vim.opt.splitright = true -- Vertical splits open to the right
vim.opt.splitbelow = true -- Horizontal splits open below

-- Interface and Appearance
vim.opt.wildmenu = true -- Enable enhanced command-line completion
vim.opt.inccommand = "nosplit" -- Show live substitution as you type
vim.opt.mouse = "a" -- Enable mouse mode

-- File Handling
vim.opt.swapfile = false -- Disable swap file creation
vim.opt.backup = false -- Disable backup files

-- Recommended additions:
vim.opt.wrapscan = true -- Searches wrap around the end of the file
vim.opt.whichwrap:append("<,>,[,]") -- Allow arrow keys to wrap across lines
vim.opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
vim.opt.timeout = true
vim.opt.timeoutlen = 1000 -- Time to wait for a mapped sequence to complete (in milliseconds)
