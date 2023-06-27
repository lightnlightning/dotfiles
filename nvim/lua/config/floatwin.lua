local M = {}

function M.trans()
    local f_buf = vim.api.nvim_create_buf(false, true)
    local mes = {}
    local word = vim.fn.expand("<cword>")
    local m = vim.fn.system("trans -no-ansi -d " .. word)
    for word in string.gmatch(m, "[^\n]+") do table.insert(mes, word) end -- 分割行并写入表
    vim.api.nvim_buf_set_lines(f_buf, 0, -1, true, mes)
    vim.api.nvim_open_win(f_buf, true,
        { relative = 'cursor', width = 80, height = 15, col = 0, row = 1, anchor = 'NW', style = 'minimal' })
end

-- local opts = {
--     noremap = true, -- non-recursive
--     silent = true,  -- do not show message
-- }

-- function M.mappings()
--     vim.keymap.set('n', '<C-f>', ":M.trans()<CR>", opts)
-- end

return M
