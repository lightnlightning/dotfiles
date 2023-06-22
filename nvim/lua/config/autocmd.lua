vim.cmd [[

augroup _format autocmd!
autocmd!
autocmd BufWritePre * normal! magg=G`a
augroup end

"代码折叠映射
nnoremap <tab> za 
vnoremap <tab> zf

" 自动保存折叠
augroup _saveview autocmd!
autocmd!
autocmd BufWinLeave FileType c,lua,javascript,css,solidtiy,python :mkview<cr>
autocmd bufwinenter FileType c,lua,javascript,css,solidtiy,python :silent loadview<cr> 
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
