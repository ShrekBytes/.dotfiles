return {
    -- Telescope UI Select (Dropdown UI)
    {
        "nvim-telescope/telescope-ui-select.nvim",
    },
    -- Telescope.nvim (Main Telescope plugin)
    {
        "nvim-telescope/telescope.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            -- Setup Telescope with the ui-select extension and dropdown theme
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })

            -- Key mappings for Telescope actions
            local builtin = require("telescope.builtin")

            -- Open a file finder
            vim.keymap.set("n", "<leader>ff", builtin.find_files, { silent = true, desc = "Open File Finder" })
            -- Perform a live grep search
            vim.keymap.set("n", "<leader>fw", builtin.live_grep, { silent = true, desc = "Live Grep Search" })

            -- Load the ui-select extension
            require("telescope").load_extension("ui-select")
        end,
    },
}
