return {
    "nvim-neo-tree/neo-tree.nvim",
    event = "VeryLazy",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    keys = {
        { "<leader>e",     ":Neotree toggle float<CR>", silent = true, desc = "Float File Explorer" },
        { "<leader><tab>", ":Neotree toggle left<CR>",  silent = true, desc = "Left File Explorer" },
    },
    config = function()
        require("neo-tree").setup({
            popup_border_style = "single",
            sort_case_insensitive = true,
            default_component_configs = {
                icon = {
                    folder_open = "",
                },
            },
            window = {
                position = "float",
                width = 35,
            },
            filesystem = {
                filtered_items = {
                    hide_dotfiles = false,
                    hide_gitignored = false,
                },
            },
        })
    end,
}
