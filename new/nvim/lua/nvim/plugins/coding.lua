return {
    {
        "williamboman/mason.nvim",
        cmd = { "Mason", "MasonInstallAll" },
        opts = {
            ensure_installed = {
                "html-lsp",
                "css-lsp",
                "prettierd",
                "lua-language-server",
                "stylua",
                "pyright",
                "ruff",
                "black",
                "clangd",
                "clang-format",
            },
        },
        config = function(_, opts)
            require("mason").setup()
            vim.api.nvim_create_user_command("MasonInstallAll", function()
                vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
            end, {})
        end,
    },

    -- Autopairs
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {
            check_ts = true,
            disable_filetype = { "TelescopePrompt", "spectre_panel" },
            enable_check_bracket_line = true,
            enable_afterquote = true,
            enable_moveright = true,
            enable_bracket_in_quote = true,
        },
    },

    -- Formatting
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        keys = {
            {
                "<leader>fm",
                function()
                    require("conform").format({ async = true, lsp_fallback = true })
                end,
                desc = "Format buffer",
            },
        },
        opts = {
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "ruff_format", "black", stop_after_first = true },
                cpp = { "clang-format" },
                c = { "clang-format" },
                ["javascript"] = { "prettierd" },
                ["typescript"] = { "prettierd" },
                ["css"] = { "prettierd" },
                ["html"] = { "prettierd" },
                ["json"] = { "prettierd" },
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true,
            },
        },
    },

    -- LSP Configuration
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "nvim-telescope/telescope.nvim",
        },
        config = function()
            -- Common border style
            local border = "single"

            -- Consolidated UI configuration
            local ui_opts = {
                border = border,
                focusable = false,
                style = "minimal",
                source = "always",
                header = "",
                prefix = "",
            }

            -- Configure diagnostics and handlers
            vim.diagnostic.config({
                virtual_text = true,
                signs = true,
                update_in_insert = true,
                underline = true,
                severity_sort = true,
                float = ui_opts,
            })

            -- Set up handlers with common border
            local handlers = {
                ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
                ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
            }

            -- Setup servers with common config
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local servers = { "html", "cssls", "pyright", "clangd", "lua_ls" }
            for _, server in ipairs(servers) do
                require("lspconfig")[server].setup({
                    capabilities = capabilities,
                    handlers = handlers,
                })
            end

            -- Keymaps
            vim.keymap.set("n", "gh", vim.lsp.buf.hover, { desc = "Show Hover Information" })
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
            vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Show References" })
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
        end,
    },

    -- Autocompletion
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
            "onsails/lspkind.nvim",
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            local lspkind = require("lspkind")

            -- Load friendly-snippets
            require("luasnip.loaders.from_vscode").lazy_load()

            -- Important: Set up autopairs BEFORE cmp setup
            local autopairs = require("nvim-autopairs")
            autopairs.setup()

            -- Set up cmp-autopairs
            local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

            -- Common window configuration
            local window_config = {
                border = "single",
                winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
            }

            -- Set up cmp
            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                completion = {
                    completeopt = "menu,menuone,noinsert",
                },
                preselect = cmp.PreselectMode.Item,
                mapping = cmp.mapping.preset.insert({
                    ["<C-k>"] = cmp.mapping.select_prev_item(),
                    ["<C-j>"] = cmp.mapping.select_next_item(),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-c>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "buffer" },
                    { name = "path" },
                }),
                formatting = {
                    format = lspkind.cmp_format({
                        mode = "symbol_text",
                        maxwidth = 50,
                        ellipsis_char = "...",
                        before = function(entry, vim_item)
                            vim_item.menu = ({
                                nvim_lsp = "[LSP]",
                                luasnip = "[Snippet]",
                                buffer = "[Buffer]",
                                path = "[Path]",
                            })[entry.source.name]
                            return vim_item
                        end,
                    }),
                },
                window = {
                    completion = window_config,
                    documentation = window_config,
                },
            })
        end,
    },

    -- UI Enhancements
    {
        "stevearc/dressing.nvim",
        event = "VeryLazy",
        opts = {
            input = {
                enabled = true,
                default_prompt = "➤ ",
                win_options = {
                    winblend = 0,
                    winhighlight = "Normal:Normal,NormalNC:Normal",
                },
            },
            select = {
                enabled = true,
                backend = { "telescope", "builtin" },
                builtin = {
                    win_options = {
                        winblend = 0,
                        winhighlight = "Normal:Normal,NormalNC:Normal",
                    },
                },
            },
        },
    },

    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
                hover = {
                    enabled = true,
                },
                signature = {
                    enabled = true,
                },
            },
            presets = {
                bottom_search = true,
                command_palette = true,
                long_message_to_split = true,
                inc_rename = true,
            },
        },
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
    },
}
