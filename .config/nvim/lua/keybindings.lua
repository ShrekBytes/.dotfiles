-- Leader configuration
vim.g.mapleader = " "      -- Change leader to a space
vim.g.maplocalleader = " " -- Change localleader to a space

-- Create a local variable for key mappings
local map = vim.keymap.set

-- Map ;; to <Esc> in insert mode
map("i", ";;", "<Esc>", { noremap = true })

-- Map ; to : in normal mode
map("n", ";", ":", { noremap = true })

-- Toggle relative line numbers
map(
    "n",
    "<leader>nr",
    ":set relativenumber!<CR>",
    { noremap = true, silent = true, desc = "Toggle Relative Line Numbers" }
)

-- Clear search highlighting
map("n", "<leader><space>", ":nohlsearch<CR>", { noremap = true, silent = true, desc = "Clear Search Highlighting" })

-- Move between split windows
map("n", "<C-h>", "<C-w>h", { noremap = true, desc = "Move to Left Split" })
map("n", "<C-j>", "<C-w>j", { noremap = true, desc = "Move to Bottom Split" })
map("n", "<C-k>", "<C-w>k", { noremap = true, desc = "Move to Top Split" })
map("n", "<C-l>", "<C-w>l", { noremap = true, desc = "Move to Right Split" })

-- Alternative mappings for moving between split windows
map("n", "<Left>", "<C-w>h", { noremap = true, desc = "Move to Left Split" })
map("n", "<Down>", "<C-w>j", { noremap = true, desc = "Move to Bottom Split" })
map("n", "<Up>", "<C-w>k", { noremap = true, desc = "Move to Top Split" })
map("n", "<Right>", "<C-w>l", { noremap = true, desc = "Move to Right Split" })

-- Insert a new line below the current line
map("n", "<leader>o", "o<Esc>", { noremap = true, desc = "Insert Line Below" })

-- Insert a new line above the current line
map("n", "<leader>O", "O<Esc>", { noremap = true, desc = "Insert Line Above" })

-- Copy to system clipboard
map("n", "<leader>y", '"+y', { noremap = true, desc = "Copy to Clipboard (Normal)" })
map("v", "<leader>y", '"+y', { noremap = true, desc = "Copy to Clipboard (Visual)" })

-- Paste from system clipboard
map("n", "<leader>p", '"+p', { noremap = true, desc = "Paste from Clipboard (Normal)" })
map("v", "<leader>p", '"+p', { noremap = true, desc = "Paste from Clipboard (Visual)" })

-- Move selected line / block of text in visual mode
map("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true, desc = "Move selected text down" })
map("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true, desc = "Move selected text up" })

map("n", "<C-a>", "ggVG", { noremap = true, silent = true, desc = "Select all text" })

map("n", "<leader>q", ":q!<CR>", { noremap = true, silent = true, desc = "Force close Neovim without saving" })
map(
    "n",
    "<leader>bq",
    ":bd!<CR>",
    { noremap = true, silent = true, desc = "Force close current buffer without saving" }
)
map("n", "<leader>w", ":wq<CR>", { noremap = true, silent = true, desc = "Save current file and close Neovim" })
map("n", "<leader>bw", ":w | bd<CR>", { noremap = true, silent = true, desc = "Save and close current buffer" })

map("n", "|", ":vsplit<CR>", { noremap = true, silent = true, desc = "Open vertical split windows" })
map("n", "\\", ":split<CR>", { noremap = true, silent = true, desc = "Open horizontal split windows" })

-- Make 'c' key not copy to clipboard when changing a character.
map("n", "c", '"_c', { noremap = true, silent = true })
map("n", "C", '"_C', { noremap = true, silent = true })
map("x", "c", '"_c', { noremap = true, silent = true })
map("x", "C", '"_C', { noremap = true, silent = true })

-- Make 'x' and 'X' keys not copy to clipboard when deleting a character.
map("n", "x", '"_x', { noremap = true, silent = true })
map("n", "X", '"_X', { noremap = true, silent = true })
map("x", "x", '"_x', { noremap = true, silent = true })
map("x", "X", '"_X', { noremap = true, silent = true })

-- Override nvim default behavior so it doesn't auto-yank when pasting on visual mode.
map("x", "p", "P", { noremap = true, silent = true })
map("x", "P", "p", { noremap = true, silent = true })

-- Improved tabulation ------------------------------------------------------
map("x", "<S-Tab>", "<gv", { noremap = true, silent = true, desc = "Indent Left (Visual)" })
map("x", "<Tab>", ">gv", { noremap = true, silent = true, desc = "Indent Right (Visual)" })
map("x", "<", "<gv", { noremap = true, silent = true, desc = "Shift Left (Visual)" })
map("x", ">", ">gv", { noremap = true, silent = true, desc = "Shift Right (Visual)" })

-- improved gg --------------------------------------------------------------
map("n", "gg", function()
    if vim.v.count > 0 then
        vim.cmd("normal! " .. vim.v.count .. "gg")
    else
        vim.cmd("normal! gg0")
    end
end, { noremap = true, silent = true })

map("x", "gg", function()
    if vim.v.count > 0 then
        vim.cmd("normal! " .. vim.v.count .. "gg")
    else
        vim.cmd("normal! gg0")
    end
end, { noremap = true, silent = true })

-- G will now go to end and center the cursor
map("n", "G", function()
    vim.cmd("normal! Gzz")
end, { noremap = true, silent = true })

-- Quick movement aliases
map("n", "<S-Up>", "5k", { noremap = true, silent = true, desc = "Move 5 lines up" })
map("n", "<S-Down>", "5j", { noremap = true, silent = true, desc = "Move 5 lines down" })
map("n", "<S-Left>", "<cmd>bprevious<CR>", { noremap = true, silent = true, desc = "Switch to previous buffer" })
map("n", "<S-Right>", "<cmd>bnext<CR>", { noremap = true, silent = true, desc = "Switch to next buffer" })

-- -- ToggleTerm.nvim ----------------------------------------------------------
-- map("n", "<leader>tf", ":ToggleTerm direction=float<CR>", { noremap = true, silent = true, desc = "Toggle floating terminal" })
-- map("n", "<leader>tt", ":ToggleTerm size=80 direction=vertical<CR>", { noremap = true, silent = true, desc = "Toggle vertical terminal" })

-- Code Runner.nvim ----------------------------------------------------------
map("n", "<leader>rc", ":RunCode<CR>", { noremap = true, silent = true, desc = "Run code" })
map("n", "<leader>rf", ":RunFile<CR>", { noremap = true, silent = true, desc = "Run current file" })
map("n", "<leader>rp", ":RunProject<CR>", { noremap = true, silent = true, desc = "Run entire project" })
map("n", "<leader>rq", ":RunClose<CR>", { noremap = true, silent = true, desc = "Close Code Runner" })

-- spectre.nvim ----------------------------------------------------------
map("n", "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', { desc = "Toggle Spectre" })
map(
    "n",
    "<leader>sw",
    '<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
    { desc = "Search current word" }
)
map("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', { desc = "Search current word" })
map(
    "n",
    "<leader>sp",
    '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
    { desc = "Search on current file" }
)

-- telescope.nvim ---------defined in telescope config file----------------
-- <leader>ff       find file
-- <leader>fw       file words

-- Toggle spell checking for the current buffer
map("n", "<leader>sc", ":setlocal spell!<CR>", { noremap = true, silent = true, desc = "Toggle spell checking" })

-- ─[ sadasd ]─────────────────────────────────────────────────────────
-- Titles
map({ "n", "v" }, "<Leader>cb", "<Cmd>CBccbox<CR>", { noremap = true, silent = true })
-- Named parts
map({ "n", "v" }, "<Leader>ct", "<Cmd>CBllline6<CR>", { noremap = true, silent = true })
-- Simple line
map("n", "<Leader>cl", "<Cmd>CBline12<CR>", { noremap = true, silent = true })
-- map("i", "<M-l>", "<Cmd>CBline<CR>", { noremap = true, silent = true }) -- To use in Insert Mode
-- Marked comments
map({ "n", "v" }, "<Leader>cm", "<Cmd>CBllbox20<CR>", { noremap = true, silent = true })
-- Removing a box is simple enough with the command (CBd), but if you
-- use it a lot:
-- map({ "n", "v" }, "<Leader>cd", "<Cmd>CBd<CR>", { noremap = true, silent = true })
