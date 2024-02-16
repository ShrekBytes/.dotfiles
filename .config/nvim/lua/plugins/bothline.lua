return {
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup({
                options = {
                    section_separators = "",
                    component_separators = "",
                    disabled_filetypes = {
                        "help",
                        "compiler",
                        "dashboard",
                        "neo-tree",
                        "toggleterm",
                        "TelescopePrompt",
                    },
                },
                sections = {
                    lualine_a = {
                        {
                            "mode",
                            fmt = function()
                                return " 󰣇 "
                            end,
                        },
                    },
                    lualine_x = { "encoding", "filetype" },
                },
            })
        end,
    },

    {
        "willothy/nvim-cokeline",
        event = "VeryLazy",
        dependencies = {
            "nvim-lua/plenary.nvim",       -- Required for v0.4.0+
            "nvim-tree/nvim-web-devicons", -- If you want devicons
        },
        config = function()
            local get_hex = require("cokeline.hlgroups").get_hl_attr

            require("cokeline").setup({
                show_if_buffers_are_at_least = 2,
                buffers = { delete_on_right_click = false },
                default_hl = {
                    fg = function(buffer)
                        return buffer.is_focused and get_hex("ColorColumn", "bg") or get_hex("Normal", "fg")
                    end,
                    bg = function(buffer)
                        return buffer.is_focused and get_hex("Normal", "fg") or get_hex("ColorColumn", "bg")
                    end,
                },
                components = {
                    {
                        text = function(buffer)
                            return " " .. buffer.devicon.icon
                        end,
                        fg = function(buffer)
                            return buffer.devicon.color
                        end,
                    },
                    {
                        text = function(buffer)
                            return buffer.unique_prefix
                        end,
                        fg = get_hex("Comment", "fg"),
                        italic = true,
                    },
                    {
                        text = function(buffer)
                            return buffer.filename .. " "
                        end,
                        underline = function(buffer)
                            return buffer.is_hovered and not buffer.is_focused
                        end,
                    },
                    {
                        text = "",
                        on_click = function(_, _, _, _, buffer)
                            buffer:delete()
                        end,
                    },
                    {
                        text = " ",
                    },
                },
                sidebar = {
                    filetype = { 'neo-tree' },
                    components = {
                        {
                            text = "    Neo Tree - file explorer",
                            bg = "#111519",
                            fg = "#9ece6a",
                            bold = true,
                        },
                    }
                },
            })
        end,
    },
}
