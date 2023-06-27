local M = {}

function M.trans_word()
    local f_buf = vim.api.nvim_create_buf(false, true)
    local mes = {}
    local word = M.get_word()
    local m = vim.fn.system("trans -no-ansi -b " .. word)
    for row in string.gmatch(m, "[^\n]+") do table.insert(mes, row) end -- 分割行并写入表
    vim.api.nvim_buf_set_lines(f_buf, 0, -1, true, mes)
    vim.api.nvim_open_win(f_buf, true,
        { relative = 'cursor', width = 80, height = 15, col = 0, row = 1, anchor = 'NW', style = 'minimal' })
end

function M.get_word()
    local word = ''
    word = vim.fn.expand("<cword>")
    return word
end

function M.trans_sentences()
    local f_buf = vim.api.nvim_create_buf(false, true)
    local mes = {}
    local sentences = '"' .. M.get_sentences() .. '"'
    print(sentences)
    local m = vim.fn.system("trans -no-ansi -b " .. sentences)
    for row in string.gmatch(m, "[^\n]+") do table.insert(mes, row) end -- 分割行并写入表
    vim.api.nvim_buf_set_lines(f_buf, 0, -1, true, mes)
    vim.api.nvim_open_win(f_buf, true,
        { relative = 'cursor', width = 80, height = 15, col = 0, row = 1, anchor = 'NW', style = 'minimal' })
end

function M.get_sentences()
    local sentences = ''
    -- execute
    vim.cmd([[
        " execute 'normal! \<c-r>"9'
        execute 'normal! "9ygv'
    ]])
    sentences = vim.fn.getreg('9')
    -- sentence = string.gsub(sentences, "/n", " ");
    return sentences
end

-- print(vim.api.nvim_eval('v:true')) -- true
-- local opts = {
--     noremap = true, -- non-recursive
--     silent = true,  -- do not show message
-- }

local opts = {
    noremap = true, -- non-recursive
    silent = true,  -- do not show message
}
function M.mappings()
    vim.keymap.set('n', '<c-f>', M.trans_word, opts)
    vim.keymap.set('v', '<c-f>', M.trans_sentences, opts)
end

return M
