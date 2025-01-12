--------------------------------------------------
-- nvim/autocmds.lua --------------------------
--------------------------------------------------

local api = vim.api

-- --------------------------------------------------
-- -- Right click context menu -------------------
-- --------------------------------------------------
-- api.nvim_create_autocmd("VimEnter", {
--     desc = "Disable right contextual menu warning message",
--     callback = function()
--         -- Disable right click message
--         vim.api.nvim_command([[aunmenu PopUp.How-to\ disable\ mouse]])
--         -- vim.api.nvim_command [[aunmenu PopUp.-1-]] -- You can remode a separator like this.
--         api.nvim_command([[menu PopUp.Save\ \File <cmd>:w<CR>]])
--         vim.cmd.anoremenu({ "PopUp.-Sep1- :" })
--         vim.cmd.anoremenu({ "PopUp.-Sep2- :" })
--         api.nvim_command([[menu PopUp.Exit <cmd>:q!<CR>]])
--     end,
-- })

--------------------------------------------------
-- Change working directory -------------------
--------------------------------------------------
api.nvim_create_user_command("Cwd", function()
    vim.cmd(":cd %:p:h")
    vim.cmd(":pwd")
end, { desc = "cd current file's directory" })

--------------------------------------------------
-- Effect: URL underline ----------------------
--------------------------------------------------

-- implement later --


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

--------------------------------------------------
-- Disable some plugins onspecific filetypes --
--------------------------------------------------
vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("disable_mini_plugins", { clear = true }),
    pattern = {
        -- "aerial",
        "alpha",
        "noice",
        -- "help",
        "lazy",
        "mason",
        -- "neo-tree",
        "checkhealth",
    },
    callback = function()
        -- vim.b.minitrailspace_disable = true
        vim.b.miniindentscope_disable = true
    end,
})

-- --------------------------------------------------
-- -- close some filetypes with <q> --------------
-- --------------------------------------------------
-- api.nvim_create_autocmd("FileType", {
--     group = vim.api.nvim_create_augroup("close_with_q", { clear = true }),
--     pattern = {
--         "PlenaryTestPopup",
--         "help",
--         "lspinfo",
--         "man",
--         "qf",
--         "spectre_panel",
--         "startuptime",
--         "tsplayground",
--         "neotest-output",
--         "checkhealth",
--     },
--     callback = function(event)
--         vim.bo[event.buf].buflisted = false
--         vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
--     end,
-- })
