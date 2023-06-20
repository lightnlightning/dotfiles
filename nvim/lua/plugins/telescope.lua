return {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    -- or                              , branch = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('telescope').setup({
            defaults = {
                layout_config = {
                    vertical = { width = 0.5 }
                    -- other layout configuration here
                },
                -- other defaults configuration here
            },
            -- other configuration values here
        })
    end,
}
