return {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
        require('toggleterm').setup {
            -- open_mapping = [[<c-g>]],
            -- 打开新终端后自动进入插入模式
            start_in_insert = true,
            -- 在当前buffer的下方打开新终端
            direction = 'float',
            float_opts = {
                -- 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
                border = 'curved', -- 边框
                width = 200,
                -- height = 100,
                -- winblend = 1, -- 透明度
                -- zindex = 80,
            },
        }
    end,
}
