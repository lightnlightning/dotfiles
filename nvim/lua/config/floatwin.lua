local M = {}

function M.get_words()
    local words = ''
    if vim.fn.mode() == 'n' then
        words = vim.fn.expand("<cword>")
    elseif vim.fn.mode() == 'v' or vim.fn.mode() == 'V' then
        vim.cmd([[
            execute 'normal! "9y'
        ]])
        words = vim.fn.getreg('9')
        words = string.gsub(words, "\n", " ")
    else
        words = ''
    end
    return words
end

function M.trans(islive)
    local words = '"' .. M.get_words() .. '"'
    local m = ""
    if islive == "onlive" then
        m = vim.fn.system("trans -no-ansi -b " .. words)
    elseif islive == "sp" then
        m = vim.fn.system("trans -no-ansi -sp -b " .. words)
    else
        m = vim.fn.system("sdcv -e " .. words)
    end
    return m
end

function M.floatwin(islive)
    local words_table = {}
    local m = M.trans(islive)
    local f_buf = vim.api.nvim_create_buf(false, true)
    for row in string.gmatch(m, "[^\n]+") do table.insert(words_table, row) end -- 分割行并写入表
    vim.api.nvim_buf_set_lines(f_buf, 0, -1, true, words_table)
    vim.api.nvim_open_win(f_buf, true,
        { relative = 'cursor', width = 80, height = 15, col = 0, row = 1, --[[ anchor = 'NW', style = 'minimal' ]] })
end

local opts = {
    noremap = true, -- non-recursive
    silent = true,  -- do not show message
}

-- vim.api.nvim_create_user_command("FloatwinOnlive", function() M.floatwin("onlive") end, {})
-- vim.api.nvim_create_user_command("Floatwin", function() M.floatwin(" ") end, {})

function M.mappings()
    -- vim.keymap.set({ 'n', 'v' }, 't', ':<c-u>Floatwin<CR>', opts)
    -- vim.keymap.set({ 'n', 'v' }, 'T', ':<c-u>FloatwinOnlive<CR>', opts)
    vim.keymap.set({ 'n', 'v' }, 'tt', function() M.floatwin(" ") end, opts)
    vim.keymap.set({ 'n', 'v' }, 'to', function() M.floatwin("onlive") end, opts)
    vim.keymap.set({ 'n', 'v' }, 'tp', function() M.floatwin("sp") end, opts)
end

return M
