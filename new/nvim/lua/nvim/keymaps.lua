--------------------------------------------------
-- nvim/keymaps.lua ---------------------------
--------------------------------------------------

local map = vim.keymap.set

-- Mapping ; to : (easier command mode)
map("n", ";", ":", { noremap = true, silent = false, desc = "Easy Command Mode" })

-- Escape
map("i", "jk", "<Esc>", { noremap = true, silent = true, desc = "Escape from insert mode" })
map("t", "jk", "<C-\\><C-n>", { noremap = true, silent = true, desc = "Escape from terminal mode" })

-- Make 'c' and 'C' keys not copy to clipboard when changing a character
map({ "n", "x" }, "c", '"_c', { noremap = true, silent = true })
map({ "n", "x" }, "C", '"_C', { noremap = true, silent = true })

-- Make 'x' and 'X' keys not copy to clipboard when deleting a character
map({ "n", "x" }, "x", '"_x', { noremap = true, silent = true })
map({ "n", "x" }, "X", '"_X', { noremap = true, silent = true })

-- Make 'd' and 'D' keys not copy to clipboard when deleting a character
map({ "n", "x" }, "d", '"_d', { noremap = true, silent = true, desc = "Delete without copying" })
map({ "n", "x" }, "D", '"_D', { noremap = true, silent = true, desc = "Delete to end without copying" })

-- Delete and put in register
map({ "n", "x" }, "<leader>d", "d", { noremap = true, silent = true, desc = "Delete and put in register" })
map({ "n", "x" }, "<leader>D", "D", { noremap = true, silent = true, desc = "Delete to end and put in register" })

-- Clear search highlights
map("n", "<leader>n", "<cmd>nohlsearch<CR>", { noremap = true, silent = true, desc = "Clear Search Highlights" })

-- Insert a new line below and above the current line
map("n", "<leader>o", "o<Esc>", { noremap = true, desc = "Insert Line Below" })
map("n", "<leader>O", "O<Esc>", { noremap = true, desc = "Insert Line Above" })

-- Disable copying when pasting on visual mode
map("v", "p", "P", { noremap = true, silent = true, desc = "Paste before cursor (no overwrite)" })
map("v", "P", "p", { noremap = true, silent = true, desc = "Paste after cursor (no overwrite)" })

-- Indentation using Tab and Shift-Tab in visual mode
map("v", "<S-Tab>", "<gv", { noremap = true, silent = true, desc = "Indent Left (Visual)" })
map("v", "<Tab>", ">gv", { noremap = true, silent = true, desc = "Indent Right (Visual)" })

-- Go to end and center the cursor
map("n", "G", "Gzz", { noremap = true, silent = true, desc = "Go to end and center the cursor" })

-- Half page up/down and center the cursor
map("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true, desc = "Half page up and center the cursor" })
map("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true, desc = "Half page down and center the cursor" })

-- Select all text
map("i", "<C-a>", "ggVG", { noremap = true, silent = true, desc = "Select all text" })

-- Open vertical and horizontal split windows
map("n", "<leader>v", "<cmd>vsplit<cr>", { noremap = true, silent = true, desc = "open vertical split windows" })
map("n", "<leader>s", ":split<cr>", { noremap = true, silent = true, desc = "open horizontal split windows" })

-- Window resizing
map("n", "<C-Up>", "<C-w>5+", { noremap = true, silent = true, desc = "Resize window up" })
map("n", "<C-Down>", "<C-w>5-", { noremap = true, silent = true, desc = "Resize window down" })
map("n", "<C-Left>", "<C-w>5<", { noremap = true, silent = true, desc = "Resize window left" })
map("n", "<C-Right>", "<C-w>5>", { noremap = true, silent = true, desc = "Resize window right" })

-- mappings for moving between split windows
map("n", "<C-h>", "<C-w>h", { noremap = true, desc = "Move to Left Split" })
map("n", "<C-j>", "<C-w>j", { noremap = true, desc = "Move to Bottom Split" })
map("n", "<C-k>", "<C-w>k", { noremap = true, desc = "Move to Top Split" })
map("n", "<C-l>", "<C-w>l", { noremap = true, desc = "Move to Right Split" })

-- terminal shortcuts
map("n", "<leader>ts", "<cmd>split | terminal<cr>",
    { noremap = true, silent = true, desc = "Open terminal horizontally" })
map("n", "<leader>tv", "<cmd>vsplit | terminal<cr>", { noremap = true, silent = true, desc = "Open terminal vertically" })
map('n', '<leader>tt', ':split | resize 15 | terminal<CR>', { noremap = true, silent = true })

-- Switch to previous and next buffer
map("n", "[[", "<cmd>bprevious<CR>", { noremap = true, silent = true, desc = "Switch to previous buffer" })
map("n", "]]", "<cmd>bnext<CR>", { noremap = true, silent = true, desc = "Switch to next buffer" })
