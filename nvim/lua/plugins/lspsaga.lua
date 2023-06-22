return{
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    config = function()
        require("lspsaga").setup({
            preview = {
                lines_above = 0,
                lines_below = 10,
            },
            scroll_preview = {
                scroll_down = "<C-f>",
                scroll_up = "<C-b>",
            },
            request_timeout = 3500,

            -- See Customizing Lspsaga's Appearance
            ui = {
                keys = {
                    quit = { "q", "<ESC>" },
                },
            },

            -- For default options for each command, see below
            finder = {
                max_height = 0.5,
                min_width = 30,
                force_max_height = false,
                keys = {
                    -- <C-t> jump back
                    expand_or_jump = "<CR>",
                    vsplit = "s",
                    split = "i",
                    quit = { "q", "<ESC>" },
                    close_in_preview = "<ESC>",
                },
            },
            -- code_action = { ... },
            rename = { quit = "<ESC>", exec = "<CR>" },
            -- etc.
            outline = {
                keys = {
                    quit = { "q", "<ESC>" },
                },
            },
        })    end,
    dependencies = {
        {"nvim-tree/nvim-web-devicons"},
        --Please make sure you install markdown and markdown_inline parser
        {"nvim-treesitter/nvim-treesitter"}
    }
}
