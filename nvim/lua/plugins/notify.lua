return{
    "rcarriga/nvim-notify", --提示插件
    keys = {
        {
            "<leader>nn",
            function()
                require("notify").dismiss({ silent = true, pending = true })
            end,
            desc = "Dismiss all Notifications",
        },
    },
    opts = {
        timeout = 3000,
        max_height = function()
            return math.floor(vim.o.lines * 0.75)
        end,
        max_width = function()
            return math.floor(vim.o.columns * 0.75)
        end,
    },
    -- stages = "fade",
    config = function()
        require('notify').setup({
            background_colour = "NotifyBackground",
            fps = 30,
            icons = {
                DEBUG = "",
                ERROR = "",
                INFO = "",
                TRACE = "✎",
                WARN = ""
            },
            level = 2,
            minimum_width = 50,
            render = "default",
            stages = "fade",
            timeout = 5000,
            top_down = true
        })
    end,
}
