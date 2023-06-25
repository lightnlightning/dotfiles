return {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    config = function()
        require("lspsaga").setup({
            symbol_in_winbar = {
                enable = false,
                separator = " ",
                ignore_patterns = {},
                hide_keyword = true,
                show_file = true,
                folder_level = 2,
                respect_root = false,
                color_mode = true,
            },
            beacon = {
                enable = false,
                frequency = 7,
            },
            lightbulb = {
                enable = false, -- 关掉灯泡💡
                enable_in_insert = true,
                sign = true,
                sign_priority = 40,
                virtual_text = true,
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
        })
    end,
    dependencies = {
        { "nvim-tree/nvim-web-devicons" },
        --Please make sure you install markdown and markdown_inline parser
        { "nvim-treesitter/nvim-treesitter" }
    }
}
