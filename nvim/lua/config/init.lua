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
-- require('config.lsp')
-- require('config.lspsaga')
require('config.autocmd')
require('config.lspsaga_keymap_lsp')

local pkg = require('config.test')
pkg.info()

