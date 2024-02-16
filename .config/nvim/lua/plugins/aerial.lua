return {
    "stevearc/aerial.nvim",
    event = "VeryLazy",
    opts = {},
    -- Optional dependencies
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
        config = true,
        -- You probably also want to set a keymap to toggle aerial
        vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>"),
    },
}
