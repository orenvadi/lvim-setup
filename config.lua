-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
if vim.g.neovide then
    vim.o.guifont = "JetBrainsMono Nerd Font:h19"
    vim.g.neovide_fullscreen = true
    vim.g.neovide_cursor_vfx_mode = "torpedo"
end

-- general
-- lvim.log.level = "warn"
lvim.log.level = ""
lvim.format_on_save.enabled = true
lvim.colorscheme = "tokyonight-storm"

lvim.builtin.which_key.mappings["k"] = {
    name = "+Colorscheme",
    d = { "<cmd>colorscheme tokyonight-day<cr>", "Day theme" },
    n = { "<cmd>colorscheme tokyonight-storm<cr>", "Night theme" },
}
-- lvim.colorscheme = "tokyonight-day"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false
-- vim.diagnostics.virtual_text = false

vim.diagnostic.config({ virtual_text = false })

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
lvim.keys.insert_mode["jk"] = "<ESC>"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Change theme settings
-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["t"] = { "<cmd>Telescope live_grep<CR>", "Telescope" }
-- lvim.builtin.which_key.mappings["t"] = {
--     name = "+Trouble",
--     r = { "<cmd>Trouble namelsp_references<cr>", "References" },
--     f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--     d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--     q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--     l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--     w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
-- }

-- VIM options
vim.opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4    -- insert 2 spaces for a tab



-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.terminal.open_mapping = "<F7>"
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
vim.opt.title = false -- to turn off glitch

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
    "bash",
    "c",
    "javascript",
    "json",
    "lua",
    "python",
    "typescript",
    "tsx",
    "css",
    "rust",
    "java",
    "yaml",
    "ocaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

-- generic LSP settings




-- -- make sure server will always be installed even if the server is in skipped_servers list
lvim.lsp.installer.setup.ensure_installed = {
    -- "sumneko_lua",
    "jsonls",
    "pyright",
    "rust_analyzer",
    "ocamllsp"
}


-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)
--

-- local opts = {}
-- require("lvim.lsp.manager").setup("ocamllsp", opts)



-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
    { command = "black",        filetypes = { "python" } },
    { command = "isort",        filetypes = { "python" } },
    { command = "clang-format", filetypes = { "c" } },
    { command = "prettierd",    filetypes = { "html", "css" } },
    { command = "ocamlformat",  filetypes = { "ocaml" } },
    { command = "gofumpt",      filetypes = { "go" } },
    {
        -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
        command = "prettier",
        ---@usage arguments to pass to the formatter
        -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
        extra_args = { "--print-with", "100" },
        ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
        filetypes = { "typescript", "typescriptreact", "javascript" },
    },
}

-- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
    { command = "flake8", filetypes = { "python" } },
    {
        -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
        command = "shellcheck",
        ---@usage arguments to pass to the formatter
        -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
        -- extra_args = { "--severity", "warning" },
    },
    {
        command = "codespell",
        ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
        filetypes = { "javascript", "python" },
    },
    {
        command = "golangci_lint",
        ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
        filetypes = { "go" },
    },
}

local lspconfig = require 'lspconfig'
local configs = require 'lspconfig.configs'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- if not configs.ls_emmet then
--     configs.ls_emmet = {
--         default_config = {
--             cmd = { 'ls_emmet', '--stdio' },
--             filetypes = {
--                 'html',
--                 'css',
--                 'scss',
--                 'javascriptreact',
--                 'typescriptreact',
--                 'haml',
--                 'xml',
--                 'xsl',
--                 'pug',
--                 'slim',
--                 'sass',
--                 'stylus',
--                 'less',
--                 'sss',
--                 'hbs',
--                 'handlebars',
--             },
--             root_dir = function(fname)
--                 return vim.loop.cwd()
--             end,
--             settings = {},
--         },
--     }
-- end

-- lspconfig.ls_emmet.setup { capabilities = capabilities }
-- Additional Plugins
lvim.plugins = {
    {
        "reasonml-editor/vim-reason-plus",
    },
    -- shading in inactive windows
    -- {
    --     'sunjon/shade.nvim',
    --     config = function()
    --         require("shade").setup({
    --             overlay_opacity = 50,
    --             opacity_step = 1,
    --             keys = {
    --                 brightness_up   = '<C-Up>',
    --                 brightness_down = '<C-Down>',
    --                 toggle          = '<Leader>s',
    --             }
    --         })
    --     end,
    -- },
    {
        'kaarmu/typst.vim',
        ft = { 'typst' },
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        style = "storm",
    },
    {
        "lunarvim/colorschemes",
    },
    {
        "rafi/awesome-vim-colorschemes",
    },
    -- {
    --     "AstroNvim/astrotheme",
    -- },
    {
        "rainglow/vim"
    },
    {
        "sonph/onehalf",
    },
    {
        "folke/trouble.nvim",
        cmd = "TroubleToggle",
    },
    -- {
    --     -- for auto save
    --     "Pocco81/auto-save.nvim",
    --     config = function()
    --         require("auto-save").setup({
    --             enabled = true,          -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)
    --             execution_message = {
    --                 message = function() -- message to print on save
    --                     return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
    --                 end,
    --                 dim = 11.8,                                    -- dim the color of `message`
    --                 cleaning_interval = 10250,                     -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
    --             },
    --             trigger_events = { "InsertLeave", "TextChanged" }, -- vim events that trigger auto-save. See :h events
    --             -- function that determines whether to save the current buffer or not
    --             -- return true: if buffer is ok to be saved
    --             -- return false: if it's not ok to be saved
    --             condition = function(buf)
    --                 local fn = vim.fn
    --                 local utils = require("auto-save.utils.data")

    --                 if
    --                     fn.getbufvar(buf, "&modifiable") == 1 and
    --                     utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
    --                     return true              -- met condition(s), can save
    --                 end
    --                 return false                 -- can't save
    --             end,
    --             write_all_buffers = false,       -- write all buffers when the current one meets `condition`
    --             debounce_delay = 11350,          -- saves the file at most every `debounce_delay` milliseconds
    --             callbacks = {                    -- functions to be executed at different intervals
    --                 enabling = nil,              -- ran when enabling auto-save
    --                 disabling = nil,             -- ran when disabling auto-save
    --                 before_asserting_save = nil, -- ran before checking `condition`
    --                 before_saving = nil,         -- ran before doing the actual save
    --                 after_saving = nil           -- ran after doing the actual save
    --             }
    --         })
    --     end,
    -- },
    {
        "windwp/nvim-ts-autotag",
        config = function()
            require("nvim-ts-autotag").setup()
        end,
    },
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup({ "css", "scss", "html", "javascript" }, {
                RGB = true,      -- #RGB hex codes
                RRGGBB = true,   -- #RRGGBB hex codes
                RRGGBBAA = true, -- #RRGGBBAA hex codes
                rgb_fn = true,   -- CSS rgb() and rgba() functions
                hsl_fn = true,   -- CSS hsl() and hsla() functions
                css = true,      -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                css_fn = true,   -- Enable all CSS *functions*: rgb_fn, hsl_fn
            })
        end,
    },
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { "*.json", "*.jsonc", "*.md" },
    -- enable wrap mode for json files only
    command = "setlocal wrap",
})
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
