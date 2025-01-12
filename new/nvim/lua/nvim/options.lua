--------------------------------------------------
-- nvim/options.lua ---------------------------
--------------------------------------------------

-- Display
vim.opt.number = true         -- Display line numbers
vim.opt.relativenumber = true -- Display relative line numbers
vim.opt.termguicolors = true  -- Enable true-color support
vim.opt.cursorline = true     -- Highlight the current line
vim.opt.signcolumn = "yes"    -- Always show the sign column
vim.opt.showmode = false      -- Do not display mode in the command line
vim.opt.wrap = true           -- Enable line wrapping
vim.opt.pumheight = 10        -- Set the pop-up menu height
vim.opt.laststatus = 3        -- Always show status line
vim.opt.scrolloff = 7         -- Minimum lines to keep above/below the cursor during scrolling
vim.opt.sidescrolloff = 3     -- Minimum columns to keep left/right of the cursor during scrolling

-- Indentation
vim.opt.expandtab = true   -- Use spaces instead of tabs
vim.opt.tabstop = 4        -- Number of spaces that a <Tab> in the file counts for
vim.opt.shiftwidth = 4     -- Number of spaces to use for each step of (auto)indent
vim.opt.smartindent = true -- Enable smart auto-indenting
vim.opt.autoindent = true  -- Enable auto-indenting

-- File Handling
vim.opt.swapfile = false    -- Disable swap file creation
vim.opt.backup = false      -- Disable backup file creation
vim.opt.writebackup = false -- Disable backup before overwriting a file

-- Interface and Appearance
vim.opt.clipboard = "unnamedplus" -- Copy to system clipboard
vim.opt.mouse = "a" -- Enable mouse mode
vim.opt.wildmenu = true -- Enable enhanced command-line completion
vim.opt.showbreak = "↪ " -- Display a symbol in the line wrap
vim.opt.cmdheight = 1 -- More space in the Neovim command line for displaying messages
vim.opt.conceallevel = 0 -- Make concealable characters like `` visible in markdown files
vim.opt.completeopt = { "menuone", "noselect" } -- Set completion options, mostly for cmp
vim.opt.fileencoding = "utf-8" -- Set the encoding written to a file
vim.opt.hidden = true -- Enable background buffers

-- Search and Highlighting
vim.opt.incsearch = true       -- Enable incremental search
vim.opt.hlsearch = true        -- Highlight search matches
vim.opt.ignorecase = true      -- Ignore case when searching
vim.opt.smartcase = true       -- Override 'ignorecase' if search contains uppercase
vim.opt.inccommand = "nosplit" -- Show live substitution as you type

-- Split Navigation
vim.opt.splitright = true -- Vertical splits open to the right
vim.opt.splitbelow = true -- Horizontal splits open below


-- -- UFO folding (later)
-- vim.o.foldcolumn = "1" -- '0' is not bad
-- vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
-- vim.o.foldlevelstart = 99
-- vim.o.foldenable = true
-- vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
