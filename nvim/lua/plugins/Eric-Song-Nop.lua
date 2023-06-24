return {
    'Eric-Song-Nop/aerial.nvim',

    opts = {
        keymaps = {
            ["?"] = "actions.show_help",
            ["g?"] = "actions.show_help",
            ["<CR>"] = "actions.jump",
            ["o"] = "actions.jump",
            ["<2-LeftMouse>"] = "actions.jump",
            ["<C-v>"] = "actions.jump_vsplit",
            ["<C-s>"] = "actions.jump_split",
            ["p"] = "actions.scroll",
            ["<C-j>"] = "actions.down_and_scroll",
            ["<C-k>"] = "actions.up_and_scroll",
            ["["] = "actions.prev",
            ["]"] = "actions.next",
            ["[["] = "actions.prev_up",
            ["]]"] = "actions.next_up",
            ["q"] = "actions.close",
            ["x"] = "actions.tree_toggle",
            ["za"] = "actions.tree_toggle",
            ["X"] = "actions.tree_toggle_recursive",
            ["zA"] = "actions.tree_toggle_recursive",
            ["l"] = "actions.tree_open",
            ["zo"] = "actions.tree_open",
            ["L"] = "actions.tree_open_recursive",
            ["zO"] = "actions.tree_open_recursive",
            ["h"] = "actions.tree_close",
            ["zc"] = "actions.tree_close",
            ["H"] = "actions.tree_close_recursive",
            ["zC"] = "actions.tree_close_recursive",
            ["zr"] = "actions.tree_increase_fold_level",
            ["zR"] = "actions.tree_open_all",
            ["zm"] = "actions.tree_decrease_fold_level",
            ["zM"] = "actions.tree_close_all",
            ["zx"] = "actions.tree_sync_folds",
            ["zX"] = "actions.tree_sync_folds",
        },
        layout = {
            -- These control the width of the aerial window.
            -- They can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
            -- min_width and max_width can be a list of mixed types.
            -- max_width = {40, 0.2} means "the lesser of 40 columns or 20% of total"
            max_width = { 40, 0.2 },
            width = nil,
            min_width = 30,

            -- key-value pairs of window-local options for aerial window (e.g. winhl)
            win_opts = {},

            -- Determines the default direction to open the aerial window. The 'prefer'
            -- options will open the window in the other direction *if* there is a
            -- different buffer in the way of the preferred direction
            -- Enum: prefer_right, prefer_left, right, left, float
            default_direction = "prefer_right",

            -- Determines where the aerial window will be opened
            --   edge   - open aerial at the far right/left of the editor
            --   window - open aerial to the right/left of the current window
            placement = "window",

            -- When the symbols change, resize the aerial window (within min/max constraints) to fit
            resize_to_content = true,

            -- Preserve window size equality with (:help CTRL-W_=)
            preserve_equality = false,
        },

        -- Options for opening aerial in a floating win
        float = {
            -- Controls border appearance. Passed to nvim_open_win
            border = "rounded",

            -- Determines location of floating window
            --   cursor - Opens float on top of the cursor
            --   editor - Opens float centered in the editor
            --   win    - Opens float centered in the window
            relative = "cursor",

            -- These control the height of the floating window.
            -- They can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
            -- min_height and max_height can be a list of mixed types.
            -- min_height = {8, 0.1} means "the greater of 8 rows or 10% of total"
            max_height = 0.9,
            height = nil,
            min_height = { 8, 0.1 },

            override = function(conf, source_winid)
                -- This is the config that will be passed to nvim_open_win.
                -- Change values here to customize the layout
                return conf
            end,
        },

        -- Options for the floating nav windows
        nav = {
            border = "rounded",
            max_height = 0.9,
            min_height = { 10, 0.1 },
            max_width = 0.5,
            min_width = { 0.2, 20 },
            win_opts = {
                cursorline = true,
                winblend = 10,
            },
            -- Jump to symbol in source window when the cursor moves
            autojump = false,
            -- Show a preview of the code in the right column, when there are no child symbols
            preview = false,
            -- Keymaps in the nav window
            keymaps = {
                ["<CR>"] = "actions.jump",
                ["o"] = "actions.jump",
                ["<2-LeftMouse>"] = "actions.jump",
                ["s"] = "actions.jump_vsplit",
                ["i"] = "actions.jump_split",
                ["h"] = "actions.left",
                ["l"] = "actions.right",
                ["q"] = "actions.close",
            },
        },
    },
    -- Optional dependencies
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
    },
    comfig =function ()
        require('aerial').setup({
            -- optionally use on_attach to set keymaps when aerial has attached to a buffer
            -- on_attach = function(bufnr)
            --     -- Jump forwards/backwards with '{' and '}'
            --     -- vim.keymap.set('n', '[', '<cmd>AerialPrev<CR>', {buffer = bufnr}),
            --     -- vim.keymap.set('n', ']', '<cmd>AerialNext<CR>', {buffer = bufnr}),
            --
            -- end,

        })
    end,

    vim.keymap.set('n', '<leader>o', '<cmd>AerialToggle<CR>'),
    -- vim.keymap.set('n', '<c-t>', '<cmd>AerialNavToggle<CR>'),
    -- keys = {
    --     { "<F3>", "<cmd>Neotree toggle<cr>", desc = "打开/关闭树" },
    --     -- { "<space>", "v", desc = "替换v键盘", remap = true },
    --     { "<leader>e", "<cmd>NeoTreeReveal<cr>", desc = "打开/关闭树" },
    -- },
}
