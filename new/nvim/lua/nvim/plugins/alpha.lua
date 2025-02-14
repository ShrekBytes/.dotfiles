--------------------------------------------------
-- nvim/plugins/alpha.lua ---------------------
--------------------------------------------------

return {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VimEnter",
    config = function()
        local dashboard = require("alpha.themes.dashboard")
        local cdir = vim.fn.getcwd()
        local if_nil = vim.F.if_nil
        local dash_foot = "" -- so that I can use it as local variable

        vim.api.nvim_create_autocmd("User", {
            pattern = "LazyVimStarted",
            callback = function()
                local stats = require("lazy").stats()
                local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                -- dash_foot = "[ ⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms ]"
                dash_foot = "[ ⚡ Neovim started in " .. ms .. "ms ]"
                pcall(vim.cmd.AlphaRedraw)
            end,
        })

        local nvim_web_devicons = {
            enabled = true,
            highlight = true,
        }

        local function get_extension(fn)
            local match = fn:match("^.+(%..+)$")
            local ext = ""
            if match ~= nil then
                ext = match:sub(2)
            end
            return ext
        end

        local function icon(fn)
            local nwd = require("nvim-web-devicons")
            local ext = get_extension(fn)
            return nwd.get_icon(fn, ext, { default = true })
        end

        local function file_button(fn, sc, short_fn, autocd)
            short_fn = short_fn or fn
            local ico_txt
            local fb_hl = {}

            if nvim_web_devicons.enabled then
                local ico, hl = icon(fn)
                local hl_option_type = type(nvim_web_devicons.highlight)
                if hl_option_type == "boolean" then
                    if hl and nvim_web_devicons.highlight then
                        table.insert(fb_hl, { hl, 0, #ico })
                    end
                end
                if hl_option_type == "string" then
                    table.insert(fb_hl, { nvim_web_devicons.highlight, 0, #ico })
                end
                ico_txt = ico .. "  "
            else
                ico_txt = ""
            end
            local cd_cmd = (autocd and " | cd %:p:h" or "")
            local file_button_el =
                dashboard.button(sc, ico_txt .. short_fn, "<cmd>e " .. vim.fn.fnameescape(fn) .. cd_cmd .. " <CR>")
            local fn_start = short_fn:match(".*[/\\]")
            if fn_start ~= nil then
                table.insert(fb_hl, { "Comment", #ico_txt - 2, #fn_start + #ico_txt })
            end
            file_button_el.opts.hl = fb_hl
            return file_button_el
        end

        local default_mru_ignore = { "gitcommit" }

        local mru_opts = {
            ignore = function(path, ext)
                return (string.find(path, "COMMIT_EDITMSG")) or (vim.tbl_contains(default_mru_ignore, ext))
            end,
            autocd = false,
        }

        local function mru(start, cwd, items_number, opts)
            opts = opts or mru_opts
            items_number = if_nil(items_number, 10)

            local oldfiles = {}
            for _, v in pairs(vim.v.oldfiles) do
                if #oldfiles == items_number then
                    break
                end
                local cwd_cond
                if not cwd then
                    cwd_cond = true
                else
                    cwd_cond = vim.startswith(v, cwd)
                end
                local ignore = (opts.ignore and opts.ignore(v, get_extension(v))) or false
                if (vim.fn.filereadable(v) == 1) and cwd_cond and not ignore then
                    oldfiles[#oldfiles + 1] = v
                end
            end

            local tbl = {}
            for i, fn in ipairs(oldfiles) do
                local short_fn
                if cwd then
                    short_fn = vim.fn.fnamemodify(fn, ":.")
                else
                    short_fn = vim.fn.fnamemodify(fn, ":~")
                end

                local shortcut = tostring(i + start - 1)

                local file_button_el = file_button(fn, shortcut, short_fn, opts.autocd)
                tbl[i] = file_button_el
            end
            return {
                type = "group",
                val = tbl,
                opts = {},
            }
        end

        local header = {
            type = "text",
            val = {
                [[                                                                       ]],
                [[                                                                     ]],
                [[       ████ ██████           █████      ██                     ]],
                [[      ███████████             █████                             ]],
                [[      █████████ ███████████████████ ███   ███████████   ]],
                [[     █████████  ███    █████████████ █████ ██████████████   ]],
                [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
                [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
                [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
                [[                                                                       ]],
            },
            opts = {
                position = "center",
                hl = "AlphaHeader",
                -- wrap = "overflow",
            },
        }

        local section_mru = {
            type = "group",
            val = {
                {
                    type = "text",
                    val = "Recent files",
                    opts = {
                        hl = "SpecialComment",
                        shrink_margin = false,
                        position = "center",
                    },
                },
                { type = "padding", val = 1 },
                {
                    type = "group",
                    val = function()
                        return { mru(0, cdir) }
                    end,
                    opts = { shrink_margin = false },
                },
            },
        }

        local buttons = {
            type = "group",
            val = {
                { type = "text",    val = cdir, opts = { hl = "SpecialComment", position = "center" } },
                { type = "padding", val = 0 },
                dashboard.button("e", "  New file", "<cmd>ene<CR>"),
                dashboard.button("SPC f f", "󰈞  Find file"),
                dashboard.button("SPC f w", "󰊄  Live grep"),
                dashboard.button("SPC tab", "  File explorer"),
                -- dashboard.button("e", "  Configuration", "<cmd>:Neotree left dir=~/.config/nvim/<CR>"),
                dashboard.button("u", "  Update plugins", "<cmd>Lazy sync<CR>"),
                dashboard.button("q", "󰅚  Quit", "<cmd>qa<CR>"),
            },
            position = "center",
        }
        local footer = {
            type = "text",

            val = function()
                return dash_foot
            end,
            opts = {
                position = "center",
                hl = "AlphaFooter",
            },
        }

        local config = {
            layout = {
                header,
                { type = "padding", val = 1 },
                section_mru,
                { type = "padding", val = 2 },
                buttons,
                { type = "padding", val = 2 },
                footer,
            },
        }
        require("alpha").setup(config)
    end,
}
