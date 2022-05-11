local options = require("core.options")
local path = require("utils.api.path")

local packer_install_tbl = {
	--[[
	=====================================
		------------ basic -----------
	=====================================
	--]]
	["wbthomason/packer.nvim"] = {}, -- package manager
	["lewis6991/impatient.nvim"] = {}, -- speed up startup
	["nathom/filetype.nvim"] = {}, -- speed up startup
	--[[
	=====================================
	  ------------ Depend ------------
	=====================================
	--]]
	["kyazdani42/nvim-web-devicons"] = { -- neovim icons support
		after = { "impatient.nvim" },
	},
	["nvim-lua/plenary.nvim"] = { -- some module dependencies
		after = { "impatient.nvim" },
	},
	["rcarriga/nvim-notify"] = { -- fancy notification message
		event = { "BufRead", "BufNewFile" },
	},
	["lewis6991/gitsigns.nvim"] = { -- git commit sign
		event = { "BufRead", "BufNewFile" },
	},
	--[[
	=====================================
	 ------------- Theme ---------------
	=====================================
	--]]
	["catppuccin/nvim"] = { -- dark purple theme
		as = "catppuccin",
		cond = options.colorscheme == "catppuccin",
	},
	["Mofiqul/vscode.nvim"] = {
		cond = options.colorscheme == "vim"
	},
	--[[
	=====================================
	 ---------- Core function ----------
	=====================================
	--]]
	["nvim-lualine/lualine.nvim"] = { -- status bar plugin
		after = { "nvim-web-devicons", "gitsigns.nvim" },
	},
	["famiu/bufdelete.nvim"] = { -- preserve buffer layout when buffers are deleted
		cmd = { "Bdelete" },
	},
	["kyazdani42/nvim-tree.lua"] = { -- file tree view
		cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
	},
	["mbbill/undotree"] = { -- undo tree
		ptp = "viml",
		event = { "BufRead", "BufNewFile" },
	},
	["akinsho/bufferline.nvim"] = { -- buffer label
		event = { "BufEnter" },
	},
	["folke/which-key.nvim"] = { -- keybinder
		event = { "BufRead", "BufNewFile" },
	},
	--[[
	=====================================
	 ----- language server protocol ----
	=====================================
	--]]
	["neovim/nvim-lspconfig"] = { -- Basic LSP configuration support
		event = { "BufEnter" },
	},
	["hrsh7th/cmp-nvim-lsp"] = { -- Enhance neovim completion
		after = { "nvim-lspconfig" },
	},
	-- In order to keep the order of lazy loading, so this plugin is placed here
	-- but it is not part of the LSP plugin scope
	["stevearc/aerial.nvim"] = { -- outline notation preview
		after = { "cmp-nvim-lsp" },
	},
	["folke/lua-dev.nvim"] = { -- sumneko_lua enhancement plugin for neovim-lua development
		after = { "aerial.nvim" },
	},
	["jose-elias-alvarez/null-ls.nvim"] = { -- Provides third-party diagnostics, debugging, formatting, etc. for the built-in LSP
		after = { "lua-dev.nvim" },
	},
	["williamboman/nvim-lsp-installer"] = { -- automatically install LSP service
		after = { "null-ls.nvim" },
	},
	["j-hui/fidget.nvim"] = { -- prompt LSP initialization status
		after = { "nvim-lsp-installer" },
	},
	["kosayoda/nvim-lightbulb"] = { -- prompt a lightbulb when code behavior is available
		after = { "fidget.nvim" },
	},
	--[[
	=====================================
	 --------- Code Completion ---------
	=====================================
	--]]
	["rafamadriz/friendly-snippets"] = { -- provide rich snippet support
		after = { "cmp-nvim-lsp" },
		event = { "InsertEnter", "CmdlineEnter" },
	},
	["hrsh7th/vim-vsnip"] = { -- provide snippet support for nvim-cmp
		ptp = "viml",
		after = { "friendly-snippets" },
	},
	["hrsh7th/nvim-cmp"] = { -- autocomplete plugin for neovim
		after = { "friendly-snippets", "vim-vsnip" },
	},
	["hrsh7th/cmp-vsnip"] = { -- vsnip support for cmp
		after = { "nvim-cmp" },
	},
	["hrsh7th/cmp-buffer"] = { -- provide buffer completion
		after = { "nvim-cmp" },
	},
	["hrsh7th/cmp-path"] = { -- provide path completion
		after = { "nvim-cmp" },
	},
	["hrsh7th/cmp-cmdline"] = { -- provide command line completion
		after = { "nvim-cmp" },
	},
	["tzachar/cmp-tabnine"] = { -- AI smart completion (it may affect performance)
		disable = true,
		run = "./install.sh",
		after = { "nvim-cmp" },
	},
	["kristijanhusak/vim-dadbod-completion"] = { -- complete completion for dadbod  (it may affect performance)
		ptp = "viml",
		after = { "nvim-cmp" },
	},
	["github/copilot.vim"] = { -- AI smart completion
		disable = true,
		ptp = "viml",
		event = { "BufRead", "BufNewFile" },
	},
	--[[
	=====================================
	 ----- debug adapter protocol ------
	=====================================
	--]]
	["mfussenegger/nvim-dap"] = { -- provide code debugging
		module = "dap",
	},
	["theHamsta/nvim-dap-virtual-text"] = { -- provide dummy text for debugging
		after = { "nvim-dap" },
	},
	["rcarriga/nvim-dap-ui"] = { -- provide UI interface for debugging
		after = { "nvim-dap" },
	},
	--[[
	=====================================
	 ------- Database connection -------
	=====================================
	--]]
	["tpope/vim-dadbod"] = { -- core tool for linking databases
		ptp = "viml",
		fn = { "db#resolve" },
	},
	["kristijanhusak/vim-dadbod-ui"] = { -- quick link database
		ptp = "viml",
		cmd = "DBUIToggle",
	},
	--[[
	=====================================
	 ----------- Code Editor -----------
	=====================================
	--]]
	["windwp/nvim-autopairs"] = { -- autocomplete parentheses
		event = { "InsertEnter" },
	},
	["norcalli/nvim-colorizer.lua"] = { -- view code color
		event = { "BufReadPre" },
	},
	["RRethy/vim-illuminate"] = { -- highlight the same word under the cursor
		ptp = "viml",
		event = { "BufRead", "BufNewFile" },
	},
	["lukas-reineke/indent-blankline.nvim"] = { -- highlight indent
		event = { "BufRead", "BufNewFile" },
	},
	["p00f/nvim-ts-rainbow"] = { -- rainbow brackets
		event = { "BufRead", "BufNewFile" },
	},
	["JoosepAlviste/nvim-ts-context-commentstring"] = { -- Provides context-based commenting behavior for Comment
		event = { "BufRead", "BufNewFile" },
	},
	["lewis6991/spellsitter.nvim"] = { -- highlight spelling errors
		event = { "BufRead", "BufNewFile" },
	},
	["windwp/nvim-ts-autotag"] = { -- autocomplete tags
		event = { "BufRead", "BufNewFile" },
	},
	["nvim-treesitter/nvim-treesitter"] = { -- syntax tree plugin
		after = { "nvim-ts-rainbow", "nvim-ts-context-commentstring", "nvim-ts-autotag" },
		run = ":TSUpdate",
	},
	["numToStr/Comment.nvim"] = { -- provide code comment function
		after = { "nvim-ts-context-commentstring" },
	},
	["tpope/vim-repeat"] = { -- repeat the modified surround operation of surround
		ptp = "viml",
		fn = "repeat#set",
	},
	["ur4ltz/surround.nvim"] = { -- modify surround
		event = { "BufRead", "BufNewFile" },
	},
	["folke/todo-comments.nvim"] = { -- highlight and find all TODO comments
		event = { "BufRead", "BufNewFile" },
	},
	["AndrewRadev/switch.vim"] = { -- quickly switch the opposite of the word
		ptp = "viml",
		cmd = { "Switch" },
		fn = { "switch#Switch" },
	},
	["Vimjas/vim-python-pep8-indent"] = { -- Python indentation rules
		ptp = "viml",
		ft = "py",
		event = { "InsertEnter" },
	},
	["mattn/emmet-vim"] = { -- emmet abbreviation support
		ptp = "viml",
		ft = { "html", "javascript", "typescript", "vue", "xml", "jsx" },
	},
	--[[
	=====================================
	 ----------- Fuzzy lookup ----------
	=====================================
	--]]
	["nvim-telescope/telescope.nvim"] = { -- fuzzy lookup tool
		module = "telescope",
	},
	["tami5/sqlite.lua"] = { -- persistent storage history yank records
		after = { "impatient.nvim" },
	},
	["AckslD/nvim-neoclip.lua"] = { -- can be used to quickly view historical yank records
		after = { "sqlite.lua" },
	},
	["nvim-pack/nvim-spectre"] = { -- Text replacement and retrieval tool for all items
		module = "spectre",
	},
	--[[
	=====================================
	 ------ Documentation editing ------
	=====================================
	--]]
	["phaazon/hop.nvim"] = { -- quick jump to any location
		module = "hop",
		cmd = { "HopWord", "HopLine", "HopChar1", "HopChar1CurrentLine" },
	},
	["kevinhwang91/nvim-hlslens"] = { -- Enhanced / query experience
		module = "hlslens",
		event = { "CmdlineEnter" },
	},
	["davidgranstrom/nvim-markdown-preview"] = { -- markdown preview tool
		ptp = "viml",
		ft = { "markdown" },
		cmd = { "MarkdownPreview" },
	},
	["askfiy/nvim-picgo"] = { -- image uploader
		module = "nvim-picgo",
	},
	["mg979/vim-visual-multi"] = { -- multi-cursor mode
		ptp = "viml",
		event = { "CursorMoved" },
	},
	["jbyuki/venn.nvim"] = { -- an excellent drawing tool
		module = "venn",
	},
	["kristijanhusak/vim-carbon-now-sh"] = { -- carbon-based code screenshot tool (requires internet connection)
		ptp = "viml",
		cmd = { "CarbonNowSh" },
	},
	--[[
	=====================================
	 ---------- Other function ---------
	=====================================
	--]]
	["olimorris/persisted.nvim"] = { -- session manager
		after = { "impatient.nvim" },
	},
	["yianwillis/vimcdoc"] = { -- vim Chinese documentation
		ptp = "viml",
	},
	["dstein64/vim-startuptime"] = { -- query startup time
		ptp = "viml",
		cmd = { "StartupTime" },
	},
	["vladdoster/remember.nvim"] = { -- restore file cursor position
		event = { "BufRead", "BufNewFile" },
	},
	["dstein64/nvim-scrollview"] = { -- draggable scrollbar
		event = { "BufRead", "BufNewFile" },
	},
	["akinsho/toggleterm.nvim"] = { -- Beautify neovim default terminal
		module = "toggleterm",
	},
	["uga-rosa/translate.nvim"] = { -- an excellent translation plugin
		cmd = { "Translate" },
	},
	["jghauser/mkdir.nvim"] = {
		event = "CmdlineEnter",
	},
}

Packer_bootstrap = (function()
	local packer_install_path = path.join(vim.fn.stdpath("data"), "site/pack/packer/start/packer.nvim")
	---@diagnostic disable-next-line: missing-parameter
	if vim.fn.empty(vim.fn.glob(packer_install_path)) > 0 then
		local rtp_addition = vim.fn.stdpath("data") .. "/site/pack/*/start/*"
		vim.notify("Please wait ...\nInstalling packer package manager ...", "info", { title = "Packer" })
		if not string.find(vim.o.runtimepath, rtp_addition) then
			vim.o.runtimepath = rtp_addition .. "," .. vim.o.runtimepath
		end
		return vim.fn.system({
			"git",
			"clone",
			"--depth",
			"1",
			"https://github.com/wbthomason/packer.nvim",
			packer_install_path,
		})
	end
end)()

local packer = require("packer")

packer.init({
	git = {
		-- For Chinese users, if the download is slow, you can switch to the github mirror source
		-- replace : https://hub.fastgit.xyz/%s
		default_url_format = "https://github.com/%s",
	},
})

packer.startup({
	function(use)
		for plug_name, plug_config in pairs(packer_install_tbl) do
			local plug_options = vim.tbl_extend("force", { plug_name }, plug_config)
			local plug_filename = plug_options.as or string.match(plug_name, "/([%w-_]+).?")
			local load_disk_path = path.join("configure", "plugins", "nv_" .. plug_filename:lower())
			local file_disk_path = path.join(vim.fn.stdpath("config"), "lua", load_disk_path .. ".lua")
			if not plug_options.disable and path.is_exists(file_disk_path) then
				if plug_config.ptp == "viml" then
					require(load_disk_path).entrance()
				else
					require(load_disk_path).before()
					plug_options.config = [[
						require("]] .. load_disk_path .. [[").load()
						require("]] .. load_disk_path .. [[").after()
					]]
				end
			end
			use(plug_options)
		end
		if Packer_bootstrap then
			packer.sync()
		end
	end,
	config = { display = { open_fn = require("packer.util").float } },
})

local packer_user_config = vim.api.nvim_create_augroup("packer_user_config", { clear = true })

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = { "plugins.lua" },
	command = "source <afile> | PackerCompile",
	group = packer_user_config,
})

return packer
