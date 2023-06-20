-- define common options
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}


-----------------
-- Normal mode --
-----------------
-- Hint: see `:h vim.map.set()`
-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- Resize with arrows
-- delta: 2 lines
vim.keymap.set('n', '_', ':resize -2<CR>', opts)
vim.keymap.set('n', '+', ':resize +2<CR>', opts)
vim.keymap.set('n', '<', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '>', ':vertical resize +2<CR>', opts)

-- exit
vim.keymap.set('n', '<c-q>', ':q<CR>', opts)
-- save
vim.keymap.set('n', '<c-s>', ':w<CR>', opts)
-- 切换窗口
vim.keymap.set('n', '<c-x>', '<c-w>x', opts)
-- buffers
vim.keymap.set('n', 'H', ':bp<cr>', opts)
vim.keymap.set('n', 'L', ':bn<cr>', opts)
vim.keymap.set('n', 'X', ':bd<cr>', opts)

-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

--格式化
vim.keymap.set('n', '<leader>=', 'mwggvG=`w', opts)
-----------------
-- 插件 --
-----------------

-- BufferLine
vim.keymap.set('n', '<leader>bp', ':BufferLineTogglePin<CR>', opts)
vim.keymap.set('n', '<leader>bdl', ':BufferLineCloseRight<CR>', opts)
vim.keymap.set('n', '<leader>bdh', ':BufferLineCloseLeft<CR>', opts)
vim.keymap.set('n', '<leader><leader>', ':BufferLinePick<CR>', opts)
vim.keymap.set('n', '<leader>bD', ':BufferLinePickClose<CR>', opts)

vim.keymap.set('n', '<leader>1', ':BufferLineGoToBuffer 1<CR>', opts)
vim.keymap.set('n', '<leader>2', ':BufferLineGoToBuffer 2<CR>', opts)
vim.keymap.set('n', '<leader>3', ':BufferLineGoToBuffer 3<CR>', opts)
vim.keymap.set('n', '<leader>4', ':BufferLineGoToBuffer 4<CR>', opts)
vim.keymap.set('n', '<leader>5', ':BufferLineGoToBuffer 5<CR>', opts)
vim.keymap.set('n', '<leader>6', ':BufferLineGoToBuffer 6<CR>', opts)
vim.keymap.set('n', '<leader>7', ':BufferLineGoToBuffer 7<CR>', opts)
vim.keymap.set('n', '<leader>8', ':BufferLineGoToBuffer 8<CR>', opts)
vim.keymap.set('n', '<leader>9', ':BufferLineGoToBuffer 9<CR>', opts)
vim.keymap.set('n', '<leader>$', ':BufferLineGoToBuffer -1<CR>', opts)


-- toggleterm
-- vim.keymap.set('n', '<silent><c-t>', 'exe v:count1 . "toggleterm"<CR>', opts)
-- vim.keymap.set('i', '<silent><c-t>', '<esc><Cmd>exe v:count1 . "toggleterm"<CR>', opts)

-- nvim-telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>fa', builtin.autocommands, {})
vim.keymap.set('n', '<leader>fk', builtin.keymaps, {})
vim.keymap.set('n', '<leader>fc', builtin.commands, {})
vim.keymap.set('n', '<leader>fm', builtin.marks, {})
vim.keymap.set('n', '<leader>uc', builtin.colorscheme, {})

