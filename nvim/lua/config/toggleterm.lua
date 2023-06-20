local Terminal  = require('toggleterm.terminal').Terminal
local pyterm = Terminal:new({
    cmd = 'python3',
    direction = 'float'
})

function python_toggle()
    pyterm:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>py", "<Cmd>lua python_toggle()<CR>", {noremap = true, silent = true})
