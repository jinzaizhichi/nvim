-- python3 -m pip install debugpy

local options = require("core.options")

local M = {}

M.names = {
    adapters = "python",
    configurations = "python",
}

M.adapters = {
    type = "executable",
    command = options.python_interpreter_path,
    args = { "-m", "debugpy.adapter" },
}

M.configurations = {
    {
        type = "python",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        pythonPath = "python3",
    },
    {
        type = "python",
        request = "launch",
        name = "Launch Django",
        program = vim.fn.getcwd() .. "/manage.py",
        pythonPath = "python3",
        justMyCode = false,
        args = {
            "runserver",
            "127.0.0.1:8000",
            "--noreload",
        },
    },
}

return M
