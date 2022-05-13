-- https://github.com/projekt0n/github-nvim-theme

local hi = require("utils.api.hi")

local M = {}

function M.before() end

function M.load()
    local ok, m = pcall(require, "github-theme")
    if not ok then
        return
    end

    M.github_theme = m
    M.github_theme.setup({
        theme_style = "dark",
        comment_style = "NONE",
        function_style = "NONE",
        keyword_style = "NONE",
        variable_style = "NONE",
        dark_sidebar = true,
    })
end

function M.after()
    local config = require("github-theme.config")
    -- custom theme highlighting
    require("configure.theme.github-theme.highlights-" .. config.schema.theme_style).execute()
end

return M
