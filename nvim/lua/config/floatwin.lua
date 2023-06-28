local M = {}

local opts = {
    noremap = true, -- non-recursive
    silent = true,  -- do not show message
}

M.opts = {
    trans_opts = "",
    line_n = 1
}

function M.get_words()
    local words = ''
    if vim.fn.mode() == 'n' then
        words = vim.fn.expand("<cword>")
        M.opts.line_n = 1
    elseif vim.fn.mode() == 'v' or vim.fn.mode() == 'V' then
        vim.cmd([[
            execute 'normal! "9y'
        ]])
        words = vim.fn.getreg('9')
        words, M.opts.line_n = string.gsub(words, "\n", " ")
        words = string.gsub(words, '"', "'")
        words = string.gsub(words, '`', "'")
    else
        words = ''
    end
    return words
end

function M.trans()
    local words = '"' .. M.get_words() .. '"'
    local m = ""
    if M.opts.trans_opts == "onlive" then
        m = vim.fn.system("trans -no-ansi -b " .. words)
    elseif M.opts.trans_opts == "sp" then
        m = vim.fn.system("trans -no-ansi -sp -b " .. words)
    else
        m = vim.fn.system("sdcv -e " .. words)
    end
    return m
end

function M.floatwin(otps)
    local words_table = {}
    M.opts.trans_opts = otps
    local m = M.trans()
    local f_buf = vim.api.nvim_create_buf(false, true)
    for row in string.gmatch(m, "[^\n]+") do table.insert(words_table, row) end -- 分割行并写入表
    vim.api.nvim_buf_set_lines(f_buf, 0, -1, true, words_table)
    local win_id = vim.api.nvim_open_win(f_buf, true,
        {
            relative = 'cursor',
            width = 80,
            height = 15,
            col = 0,
            row = M.opts.line_n,
            border = 'single',
            anchor = 'NW',
            style = 'minimal'
        })
    vim.api.nvim_win_set_option(win_id, "wrap", true)
    -- vim.api.nvim_win_set_option(win_id, 'winhighlight',
    --     'Normal:FloatBorder,FloatBorder:FloatBorder,NormalFloat:NormalFloat')
    -- vim.api.nvim_win_set_option(win_id, 'FloatBorder', 'Normal:FloatBorder')
    -- vim.api.nvim_win_set_option(win_id, 'FloatBorder', 'NvimFloatingWindow')
    local win_hl = vim.api.nvim_win_get_option(0, 'winhighlight')
    vim.api.nvim_win_set_option(win_id, 'winhighlight', win_hl)
    vim.api.nvim_buf_set_keymap(f_buf, 'n', 'q', ":close<CR>", opts)
end

-- border = {
--   style = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
-- },
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