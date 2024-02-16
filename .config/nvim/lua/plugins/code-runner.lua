return {
    "CRAG666/code_runner.nvim",
    event = "VeryLazy",
    config = function()
        require("code_runner").setup({
                startinsert = true,
        })
    end,
}
