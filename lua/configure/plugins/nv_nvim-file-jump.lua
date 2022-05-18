-- https://github.com/askfiy/nvim-file-jump

local mapping = require("core.mapping")

local M = {}

function M.before()
    M.register_global_key()
end

function M.load()
    local ok, m = pcall(require, "nvim-file-jump")
    if not ok then
        return
    end

    M.nvim_file_jump = m
    M.nvim_file_jump.setup()
end

function M.after() end

function M.register_global_key()
    mapping.register({
        {
            mode = { "n" },
            lhs = "<s-tab>",
            rhs = ":Bback<cr>",
            description = "Back to previous file",
            options = { silent = true },
        },
        {
            mode = { "n" },
            lhs = "<tab>",
            rhs = ":Bforward<cr>",
            description = "Forward to next file",
            options = { silent = true },
        },
    })
end

return M
