-- https://github.com/vladdoster/remember.nvim

local M = {}

function M.before() end

function M.load()
    local ok, m = pcall(require, "nvim-lastplace")
    if not ok then
        return
    end

    M.nvim_lastplace = m
    M.nvim_lastplace.setup({
        ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
        ignore_buftype = { "quickfix", "nofile", "help" },
        open_folds = true,
    })
end

function M.after() end

return M
