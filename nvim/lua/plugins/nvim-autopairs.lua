return {
    'windwp/nvim-autopairs',  --自动补全括号
    event = "InsertEnter",
    opts = {}, -- this is equalent to setup({}) functi
    config = function()
        require("nvim-autopairs").setup {}
    end,
}
