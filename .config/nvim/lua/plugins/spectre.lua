return {
    'nvim-pack/nvim-spectre',
    event = "VeryLazy",
    config = function()
        require('spectre').setup({
            color_devicons = true,
            live_update = false, -- auto execute search again when you write to any file in vim
        })
    end
}
