return {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })
    end,
    config = function()
        require'nvim-treesitter.configs'.setup {
            ensure_installed = { "vim","bash","c","cpp","javascript","json","lua","python","rust","solidity","html","css" },
            highlight = { enable = true },
            indent = { enable = true },
        }
    end,
}
