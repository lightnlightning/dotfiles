vim.cmd [[

augroup _format autocmd!
autocmd!
autocmd BufWritePre * normal! magg=G`azz
augroup end

"代码折叠映射
nnoremap <tab> za 
vnoremap <tab> zf

" 自动保存折叠
augroup _saveview autocmd!
autocmd!
autocmd BufWinLeave FileType c,lua,javascript,css,solidtiy,python,html :mkview<cr>
autocmd bufwinenter FileType c,lua,javascript,css,solidtiy,python,html :silent loadview<cr> 
augroup end

"从启动画面进来自动打开树
augroup _open_nvim_tree
autocmd! * <buffer>
autocmd sessionloadpost * NeoTreeReveal
augroup end

]]
-- Don't auto commenting new lines
-- 不要回车自动加注释
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "",
    command = "set fo-=c fo-=r fo-=o",
})

-- 记录当前输入法
Current_input_method = vim.fn.system("im-select")

-- 切换到英文输入法
function Switch_to_English_input_method()
    Current_input_method = vim.fn.system("im-select")
    if Current_input_method ~= "com.apple.keylayout.ABC\n" then
        vim.fn.system("im-select com.apple.keylayout.ABC")
    end
end

-- 设置输入法
function Set_input_method()
    if Current_input_method ~= "com.apple.keylayout.ABC\n" then
        vim.fn.system("im-select " .. string.gsub(Current_input_method, "\n", ""))
    end
end

-- 进入normal模式时切换为英文输入法
vim.cmd([[
augroup input_method
autocmd!
autocmd InsertEnter * :lua Set_input_method()
autocmd InsertLeave * :lua Switch_to_English_input_method()
augroup END
]])
