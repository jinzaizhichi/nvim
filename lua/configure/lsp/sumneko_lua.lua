-- https://github.com/sumneko/lua-language-server
-- https://github.com/folke/lua-dev.nvim

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
        filetypes = { "lua" },
        log_level = 2,
        root_dir = function()
            return vim.fn.getcwd()
        end,
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

return {
    hooks = {
        ---@diagnostic disable-next-line: unused-local
        attach = function(client, bufnr)
            -- disable sumneko format
            client.resolved_capabilities.document_formatting = false
            client.resolved_capabilities.document_range_formatting = false
        end,
    },
    options = lua_dev,
}
