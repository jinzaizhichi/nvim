-- https://github.com/hrsh7th/vscode-langservers-extracted

local util = require("lspconfig.util")

local M = {}

M.private_attach_callbackfn = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
end

M.lsp_config = {
    cmd = { "vscode-css-language-server", "--stdio" },
    filetypes = { "css", "scss", "less" },
    root_dir = util.root_pattern("package.json", ".git"),
    single_file_support = true,
    settings = {
        css = { validate = true },
        scss = { validate = true },
        less = { validate = true },
    },
}

return M
