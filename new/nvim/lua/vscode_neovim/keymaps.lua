--------------------------------------------------
-- vscode_neovim/keymaps.lua ------------------
--------------------------------------------------

local map = vim.keymap.set

-- Mapping ; to : (easier command mode)
map("n", ";", ":", { noremap = true, silent = false, desc = "Easy Command Mode" })

-- Leader Space to Escape
map("n", "<leader><space>", "<Esc>", { noremap = true, silent = true, desc = "Leader Space to Escape" })

-- jj for quick escape from insert mode
map("i", "jj", "<Esc>", { noremap = true, silent = true, desc = "Escape from insert mode" })

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

--------------------------------------------------
-- Handled by VSCode --------------------------
--------------------------------------------------

-- Undo/Redo
map("n", "u", "<cmd>call VSCodeNotify('undo')<CR>", { noremap = true, silent = true, desc = "Undo" })
map("n", "<C-r>", "<cmd>call VSCodeNotify('redo')<CR>", { noremap = true, silent = true, desc = "Redo" })

map(
	"n",
	"<leader>]",
	"<cmd>call VSCodeNotify('workbench.action.navigateForward')<CR>",
	{ noremap = true, silent = true, desc = "Navigate Forward" }
) -- Navigate Forward

map(
	"n",
	"<leader>[",
	"<cmd>call VSCodeNotify('workbench.action.navigateBack')<CR>",
	{ noremap = true, silent = true, desc = "Navigate Backward" }
) -- Navigate Backward

map(
	"n",
	"gh",
	"<cmd>call VSCodeNotify('editor.action.showHover')<CR>",
	{ noremap = true, silent = true, desc = "Show Hover Info" }
) -- Show Hover Info

map(
	"n",
	"gd",
	"<cmd>call VSCodeNotify('editor.action.revealDefinition')<CR>",
	{ noremap = true, silent = true, desc = "Reveal Definition" }
) -- Reveal Definition

map(
	"n",
	"gr",
	"<cmd>call VSCodeNotify('editor.action.goToReferences')<CR>",
	{ noremap = true, silent = true, desc = "Go to References" }
) -- Go to References

map(
	"n",
	"<leader>ca",
	"<cmd>call VSCodeNotify('editor.action.quickFix')<CR>",
	{ noremap = true, silent = true, desc = "Code Action" }
) -- Code Action

map(
	"n",
	"<leader>fm",
	"<cmd>call VSCodeNotify('editor.action.formatDocument')<CR>",
	{ noremap = true, silent = true, desc = "Format File" }
) -- Format File

map(
	"n",
	"<leader>v",
	"<cmd>call VSCodeNotify('workbench.action.splitEditor')<CR>",
	{ noremap = true, silent = true, desc = "Split on Side" }
) -- Split on Side

map(
	"n",
	"<leader>s",
	"<cmd>call VSCodeNotify('workbench.action.splitEditorDown')<CR>",
	{ noremap = true, silent = true, desc = "Split on Bottom" }
) -- Split on Bottom

map(
	"n",
	"]]",
	"<cmd>call VSCodeNotify('workbench.action.nextEditor')<CR>",
	{ noremap = true, silent = true, desc = "Switch to Next buffer" }
) -- Switch to Next buffer

map(
	"n",
	"[[",
	"<cmd>call VSCodeNotify('workbench.action.previousEditor')<CR>",
	{ noremap = true, silent = true, desc = "Switch to Previous buffer" }
) -- Switch to Previous buffer
