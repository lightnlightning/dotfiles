return {
    "folke/persistence.nvim", -- 保存会话功能
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    opts = {
        -- add any custom options here
    }
}
