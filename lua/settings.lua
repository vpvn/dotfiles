local cmd = vim.cmd             -- execute Vim commands
local exec = vim.api.nvim_exec  -- execute Vimscript
local g = vim.g                 -- global variables
local opt = vim.opt             -- global/buffer/windows-scoped options

-----------------------------------------------------------
-- Главные
-----------------------------------------------------------
opt.colorcolumn = '80'              -- Разделитель на 80 символов
opt.cursorline = true               -- Подсветка строки с курсором
opt.number = false                  -- Выключаем нумерацию строк
opt.relativenumber = false          -- Выкл. относительную нумерацию строк
opt.so=999                          -- Курсор всегда в центре экрана
opt.undofile = true                 -- Возможность отката назад
opt.splitright = true               -- vertical split вправо
opt.splitbelow = true               -- horizontal split вниз

-- g.nvim_tree_disable_default_keybindings = 1
-----------------------------------------------------------
-- Цветовая схема
-----------------------------------------------------------
opt.termguicolors = true      --  24-bit RGB colors
cmd'colorscheme onedark'

-- Конфиг ale + eslint
g.ale_fixers = { javascript= { 'eslint' } }
g.ale_sign_error = '❌'
g.ale_sign_warning = '⚠️'
g.ale_fix_on_save = 0
-- Запуск линтера, только при сохранении
g.ale_lint_on_text_changed = 'never'
g.ale_lint_on_insert_leave = 0

-- vim-auto-save
g.auto_save = 1  -- enable AutoSave on Vim startup
g.auto_save_silent = 1  -- do not display the auto-save notification

-- gitgutter setup
g.gitgutter_sign_added = '∙'
g.gitgutter_sign_modified = '∙'
g.gitgutter_sign_removed = '∙'
g.gitgutter_sign_modified_removed = '∙'


-----------------------------------------------------------
-- Табы и отступы
-----------------------------------------------------------
cmd([[
filetype indent plugin on
syntax enable
]])
opt.expandtab = true      -- use spaces instead of tabs
opt.shiftwidth = 4        -- shift 4 spaces when tab
opt.tabstop = 4           -- 1 tab == 4 spaces
opt.smartindent = true    -- autoindent new lines
-- don't auto commenting new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]
-- remove line lenght marker for selected filetypes
cmd [[autocmd FileType text,markdown,html,xhtml,javascript setlocal cc=0]]
-- 2 spaces for selected filetypes
cmd [[
autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml,htmljinja setlocal shiftwidth=2 tabstop=2
]]
-- С этой строкой отлично форматирует html файл, который содержит jinja2
cmd[[ autocmd BufNewFile,BufRead *.html set filetype=htmldjango ]]
-----------------------------------------------------------
-- Полезные фишки
-----------------------------------------------------------
-- Запоминает где nvim последний раз редактировал файл
cmd [[
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
]]
-- Подсвечивает на доли секунды скопированную часть текста
exec([[
augroup YankHighlight
autocmd!
autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup end
]], false)

-----------------------------------------------------------
-- Установки для плагинов
-----------------------------------------------------------
-- LSP settings
--local lsp_installer = require("nvim-lsp-installer")
--lsp_installer.on_server_ready(function(server)
--    local opts = {}
--    if server.name == "sumneko_lua" then
--        -- only apply these settings for the "sumneko_lua" server
--        opts.settings = {
--           Lua = {
--                diagnostics = {
--                    -- Get the language server to recognize the 'vim', 'use' global
--                    globals = {'vim', 'use'},
--                },
--                workspace = {
--                    -- Make the server aware of Neovim runtime files
--                    library = vim.api.nvim_get_runtime_file("", true),
--                },
--                -- Do not send telemetry data containing a randomized but unique identifier
--                telemetry = {
--                    enable = false,
--                },
--            },
--        }
--    end
--    server:setup(opts)
--end)


-- nvim-cmp supports additional completion capabilities
--local capabilities = vim.lsp.protocol.make_client_capabilities()
--capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
--vim.o.completeopt = 'menuone,noselect'
-- luasnip setup
--local luasnip = require 'luasnip'
-- nvim-cmp setup
--local cmp = require 'cmp'
--cmp.setup {
--    snippet = {
--        expand = function(args)
--            luasnip.lsp_expand(args.body)
--        end,
--    },
--    mapping = {
--        ['<CR>'] = cmp.mapping.confirm({ select = true }),
--    },
--    sources = {
--        { name = 'nvim_lsp' },
--        { name = 'luasnip' },
--        { name = 'path' },
--        { name = 'buffer', opts = {
--            get_bufnrs = function()
--                return vim.api.nvim_list_bufs()
--            end
--        },
--    },
--},
--}

local tree_cb = require'nvim-tree.config'.nvim_tree_callback
local nvtree = require'nvim-tree'
nvtree.setup {
        view = {
            mappings = {
                custom_only = true,
                list = {
                    { key = {"<CR>", "o", "<2-LeftMouse>"}, cb = tree_cb("edit") },
                }
           }
        }
}    
