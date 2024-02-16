--          ╭─────────────────────────────────────────────────────────╮
--          │                        mini.nvim                        │
--          │                      mini.comment                       │
--          │                     mini.trailspace                     │
--          │                     mini.cursorword                     │
--          │                    mini.indentscope                     │
--          │                                                         │
--          │                    indent-blankline                     │
--          │                       comment-box                       │
--          │                      nvim-surround                      │
--          ╰─────────────────────────────────────────────────────────╯

return {
    {
        "echasnovSKI/mini.nvim",
        event = "VeryLazy",
        version = "*",
        config = function()
            -- ┌─────────────────────────────────────────────────────────┐
            --   mini.comment to comment and uncomment
            -- └─────────────────────────────────────────────────────────┘
            require("mini.comment").setup()

            -- ┌─────────────────────────────────────────────────────────┐
            --   mini.trailspace highlights any trailing spaces
            -- └─────────────────────────────────────────────────────────┘
            require("mini.trailspace").setup()

            -- ┌─────────────────────────────────────────────────────────┐
            --   mini.cursorword highlights all matching words
            -- └─────────────────────────────────────────────────────────┘
            require("mini.cursorword").setup()

            -- ┌─────────────────────────────────────────────────────────┐
            --   mini.indentscope shows current indent scope
            -- └─────────────────────────────────────────────────────────┘
            require("mini.indentscope").setup({
                draw = {
                    delay = 0,
                },
                -- Module mappings. Use `''` (empty string) to disable one.
                mappings = {
                    object_scope = "ii",
                    object_scope_with_border = "ai",
                    goto_top = "[i",
                    goto_bottom = "]i",
                },
                -- Options which control scope computation
                options = {
                    border = "both",
                    indent_at_cursor = true,
                    try_as_border = true,
                },
                symbol = "▏",
            })

            -- ┌─────────────────────────────────────────────────────────┐
            --   add new mini.nvim plugins here
            -- └─────────────────────────────────────────────────────────┘
        end,
    },

    {
        -- ┌─────────────────────────────────────────────────────────┐
        --   indent-blankline to show indent lines
        -- └─────────────────────────────────────────────────────────┘
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPre", "BufNewFile" },
        main = "ibl",
        opts = {},
        config = function()
            require("ibl").setup({
                indent = { char = "▏" },
                whitespace = {
                    remove_blankline_trail = false,
                },
                scope = { enabled = false },
            })
        end,
    },

    {
        -- ┌─────────────────────────────────────────────────────────┐
        --   comment-box makes these cool boxes
        -- └─────────────────────────────────────────────────────────┘
        "LudoPinelli/comment-box.nvim",
        event = "VeryLazy",
    },

    {
        -- ┌─────────────────────────────────────────────────────────┐
        --   nvim-surround to surround any braces or anything
        -- └─────────────────────────────────────────────────────────┘
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end,
    },

    -- ┌─────────────────────────────────────────────────────────┐
    --   add new plugins here
    -- └─────────────────────────────────────────────────────────┘
}
