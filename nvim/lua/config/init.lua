-- local M = {}
--
-- function M.info()
--     vim.print('hello!')
-- end
-- return M

-- local pkg = require('initf')        
-- pkg.info()
-- return {}
require('config.options')
require('config.keymaps')
require('config.nvim-cmp')
-- require('config.nvim-lspconfig')
require('config.lsp')
require('config.autocmd')

local pkg = require('config.test')
pkg.info()

