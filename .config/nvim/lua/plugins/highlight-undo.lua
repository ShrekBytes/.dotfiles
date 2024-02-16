return {
    "tzachar/highlight-undo.nvim",
    event = "VeryLazy",
    opts = {},
    config = function()
        require("highlight-undo").setup({
            duration = 2000,
        })
    end,
}
