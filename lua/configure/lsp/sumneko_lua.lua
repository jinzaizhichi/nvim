-- https://github.com/sumneko/lua-language-server
-- https://github.com/folke/lua-dev.nvim

local util = require("lspconfig.util")
local runtime_path = vim.split(package.path, ";")

table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local lua_dev = require("lua-dev")

lua_dev.setup({
    library = {
        vimruntime = true, -- runtime path
        types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
        -- plugins = true, -- installed opt or start plugins in packpath
        -- you can also specify the list of plugins to make available as a workspace library
        plugins = { "plenary.nvim" },
    },
    lspconfig = {
        -- cmd = { "lua-language-server", "--locale=zh-CN" },
        cmd = { "lua-language-server" },
        root_dir = function(fname)
            ---@diagnostic disable-next-line: deprecated
            return util.root_pattern(unpack(M.root_files))(fname) or util.find_git_ancestor(fname)
        end,
        filetypes = { "lua" },
        single_file_support = true,
        log_level = 2,
        settings = {
            Lua = {
                runtime = {
                    version = "LuaJIT",
                    path = runtime_path,
                },
                diagnostics = {
                    globals = { "vim" },
                },
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                },
                telemetry = {
                    enable = false,
                },
            },
        },
    },
})

local M = {
    root_files = {
        ".luarc.json",
        ".luacheckrc",
        ".stylua.toml",
        "selene.toml",
    },
}

M.private_attach_callbackfn = function(client, bufnr)
    -- disable sumneko format
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
end

M.lsp_config = lua_dev

return M
