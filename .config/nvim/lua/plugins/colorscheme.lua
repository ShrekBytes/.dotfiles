return {
    "ShrekBytes/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("tokyonight").setup({
            style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
            transparent = false, -- Enable this to disable setting the background color
            styles = {
                comments = { italic = true },
                keywords = { italic = true },
                -- Background styles. Can be "dark", "transparent" or "normal"
                sidebars = "dark", -- style for sidebars, see below
                floats = "dark", -- style for floating windows
            },
        })
        vim.cmd([[colorscheme tokyonight-night]])
    end,
}
