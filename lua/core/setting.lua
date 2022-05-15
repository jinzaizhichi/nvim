-- There are some settings, which are automatically configured in neovim
-- you can view it with :h vim-differences

local settings = {
    g = {
        did_load_filetypes = 0,
        do_filetype_lua = 1,
    },
    opt = {
        syntax = "enable",
        background = "dark",
        encoding = "utf-8",
        fileencoding = "utf-8",
        signcolumn = "yes:1",
        filetype = "plugin",
        completeopt = "menuone,noselect",
        backup = false,
        swapfile = false,
        writebackup = false,
        title = true,
        showmode = false,
        showtabline = 4,
        pumheight = 10,
        updatetime = 100,
        timeoutlen = 500,
        showcmd = true,
        hidden = true,
        termguicolors = true,
        cursorline = true,
        number = true,
        ruler = false,
        relativenumber = true,
        numberwidth = 2,
        scrolloff = 21,
        mouse = "a",
        list = true,
        incsearch = true,
        hlsearch = true,
        wrapscan = true,
        showmatch = true,
        spell = true,
        spelllang = "en_us,cjk",
        matchtime = 2,
        wildmenu = true,
        ignorecase = true,
        smartcase = true,
        foldenable = true,
        foldmethod = "indent",
        foldcolumn = "0",
        foldlevel = 100,
        linebreak = true,
        clipboard = "unnamedplus",
        autoread = true,
        autoindent = true,
        cmdheight = 1,
        iskeyword = "@,48-57,_,192-255",
        laststatus = 3,
        sessionoptions = "buffers,curdir,folds,help,tabpages,winsize,globals",
        fillchars = "vert:┃,horiz:━,verthoriz:╋,horizup:┻,horizdown:┳,vertleft:┫,vertright:┣",
        smartindent = true,
    },
    disable_builtin_plugins = {
        -- "netrw",
        -- "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
        "2html_plugin",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        "matchit",
        "tar",
        "tarPlugin",
        "rrhelper",
        "spellfile_plugin",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
    },
}

-- vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")
-- vim.opt.listchars:append("tab:↹ ")
vim.opt.shortmess:append("sI")
vim.opt.whichwrap:append("<>[]hl")

vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" }

for prefix, tab in pairs(settings) do
    if prefix ~= "disable_builtin_plugins" then
        for key, value in pairs(tab) do
            vim[prefix][key] = value
        end
    else
        for _, plugin in pairs(tab) do
            vim.g["loaded_" .. plugin] = 1
        end
    end
end

return settings
