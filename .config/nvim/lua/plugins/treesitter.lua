--  TREE SITTER ---------------------------------------------------------

return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed = { "c", "cpp", "vim", "lua", "python", "java", "go" },
            highlight = { enable = true, additional_vim_regex_highlighting = false },
            indent = { enable = false },
            autotag = { enable = true, enable_close_on_slash = false },
        })
    end,
}
