--------------------------------------------------
-- nvim/plugins/lualine.lua -------------------
--------------------------------------------------
-------------------

return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        -- Color palette
        local colors = {
            -- Base colors
            bg = "#181820",
            red = "#f7768e",
            blue = "#7aa2f7",
            green = "#9ece6a",
            yellow = "#e0af68",

            -- Static element colors
            git = "#7dcfff",
            fname = "#f7768e",
            loc = "#565f89",
            warn = "#e0af68",
            error = "#db4b4b",
            info = "#0db9d7",
            hint = "#1abc9c",
        }

        -- Mode-specific colors
        local mode_colors = {
            n = colors.blue,
            i = colors.green,
            v = colors.red,
            V = colors.red,
            c = colors.yellow,
            no = colors.red,
            s = colors.orange,
            S = colors.orange,
            [""] = colors.red,
            ic = colors.yellow,
            R = colors.violet,
            Rv = colors.violet,
            cv = colors.red,
            ce = colors.red,
            r = colors.cyan,
            rm = colors.cyan,
            ["r?"] = colors.cyan,
            ["!"] = colors.red,
            t = colors.red,
        }

        -- Get LSP clients
        local function get_lsp_client()
            local buf_clients = vim.lsp.get_active_clients({ bufnr = 0 })
            if #buf_clients == 0 then
                return ""
            end

            local buf_client_names = {}
            for _, client in pairs(buf_clients) do
                table.insert(buf_client_names, client.name)
            end

            return " " .. table.concat(buf_client_names, ", ")
        end

        -- Filename with icon
        local function filename_with_icon()
            local filename = vim.fn.expand("%:t")
            local ft_icon, _ = require("nvim-web-devicons").get_icon(filename, nil, { default = true })
            return ft_icon .. " " .. (filename ~= "" and filename or "[No Name]")
        end

        require("lualine").setup({
            options = {
                theme = {
                    normal = {
                        a = { fg = colors.fg, bg = colors.bg },
                        b = { fg = colors.fg, bg = colors.bg },
                        c = { fg = colors.fg, bg = colors.bg },
                    },
                    insert = { a = { fg = colors.fg, bg = colors.bg } },
                    visual = { a = { fg = colors.fg, bg = colors.bg } },
                    replace = { a = { fg = colors.fg, bg = colors.bg } },
                    command = { a = { fg = colors.fg, bg = colors.bg } },
                },
                component_separators = "",
                section_separators = "",
                globalstatus = true,
            },
            sections = {
                -- Left sections
                lualine_a = {
                    {
                        function()
                            return "▊"
                        end,
                        color = function()
                            return { fg = mode_colors[vim.fn.mode()] }
                        end,
                        padding = { right = 1 },
                    },
                },
                lualine_b = {
                    {
                        "branch",
                        icon = "",
                        color = { fg = colors.git },
                    },
                },
                lualine_c = {
                    {
                        filename_with_icon,
                        color = { fg = colors.fname },
                    },
                    {
                        'diagnostics',
                        sources = { 'nvim_diagnostic' },
                        symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
                        diagnostics_color = {
                            error = { fg = '#1a1b26', bg = colors.error },
                            warn = { fg = '#1a1b26', bg = colors.warn },
                            info = { fg = '#1a1b26', bg = colors.info },
                            hint = { fg = '#1a1b26', bg = colors.hint },
                        },
                        fmt = function(str)
                            if str == "" then
                                return ""
                            end
                            return '󰄛 ' .. str .. ' '
                        end,
                    },
                    {
                        get_lsp_client,
                        color = { fg = colors.git },
                        fmt = function(str)
                            if str == "" then
                                return ""
                            end
                            return str
                        end,
                    },
                },
                -- Right sections
                lualine_x = {},
                lualine_y = {},
                lualine_z = {
                    {
                        "location",
                        fmt = function(str)
                            return str .. " %3p%%"
                        end,
                        color = { fg = colors.loc },
                    },
                    {
                        function()
                            return "▊"
                        end,
                        color = function()
                            return { fg = mode_colors[vim.fn.mode()] }
                        end,
                        padding = { left = 1 },
                    },
                },
            },
        })
    end,
}
