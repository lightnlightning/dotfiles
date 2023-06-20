return {
    "goolord/alpha-nvim",
    dependencies = "nvim-neo-tree/neo-tree.nvim",
    event = "VimEnter",
    opts = function()
        local dashboard = require("alpha.themes.dashboard")
        local logo = [[
         ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z
         ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z    
         ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z       
         ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z         
         ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║
         ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝
    ]]

        dashboard.section.header.val = vim.split(logo, "\n")
        dashboard.section.buttons.val = {
            dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
            dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
            dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
            dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
            dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
            dashboard.button("s", " " .. " Restore Session", ":SessionManager load_last_session<cr>"),
            -- dashboard.button("s", " " .. " Restore Session", ":SessionManager load_last_session<cr>:NeoTreeReveal<cr>"),
            dashboard.button("l", "󰒲 " .. " lazy", ":lazy<cr>"),
            dashboard.button("q", " " .. " quit", ":qa<cr>"),
        }
        for _, button in ipairs(dashboard.section.buttons.val) do
            button.opts.hl = "alphabuttons"
            button.opts.hl_shortcut = "alphashortcut"
        end
        dashboard.section.header.opts.hl = "alphaheader"
        dashboard.section.buttons.opts.hl = "alphabuttons"
        dashboard.section.footer.opts.hl = "alphafooter"
        dashboard.opts.layout[1].val = 8
        return dashboard
    end,
    config = function(_, dashboard)
        -- close lazy and re-open when the dashboard is ready
        if vim.o.filetype == "lazy" then
            vim.cmd.close()
            vim.api.nvim_create_autocmd("user", {
                pattern = "alphaready",
                callback = function()
                    require("lazy").show()
                end,
            })
        end

        require("alpha").setup(dashboard.opts)

        vim.api.nvim_create_autocmd("user", {
            pattern = "lazyvimstarted",
            callback = function()
                local stats = require("lazy").stats()
                local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                dashboard.section.footer.val = "⚡ neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
                pcall(vim.cmd.alpharedraw)
            end,
        })
    end,
}
