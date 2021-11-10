local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}

-- <F4> Поиск слова под курсором
map('n', '<F4>', [[<cmd>lua require('telescope.builtin').grep_string()<cr>]], default_opts)
-- <S-F4> Поиск слова в модальном окошке
map('n', '<S-F4>', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], default_opts)
map('n', '<C-f>', [[<cmd>lua require('telescope.builtin').find_files()<cr>]], default_opts)
-- <Ctrl+n> дерево файлов.
map('n', '<C-n>', ':NvimTreeRefresh<CR>:NvimTreeToggle<CR>', default_opts)
-- Переключение вкладок с помощью TAB или shift-tab
map('n', '<Tab>', '<C-w>w', default_opts)
map('n', '<S-Tab>', '<C-w>W', default_opts)
