local options = require("core.options")

local function auto_save()
    vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
        pattern = { "*" },
        command = "silent! write",
        nested = true,
    })
end

local function switch_input()
    if vim.bo.fileformat == "unix" then
        vim.api.nvim_create_autocmd({ "InsertLeave" }, {
            pattern = { "*" },
            callback = function()
                local input_status = tonumber(vim.fn.system("fcitx5-remote"))
                if input_status == 2 then
                    vim.fn.system("fcitx5-remote -c")
                end
            end,
        })
    else
    end
end


if options.auto_save_buffer then
    auto_save()
end

if options.auto_switch_input then
    switch_input()
end
