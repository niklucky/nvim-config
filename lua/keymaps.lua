local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------

-- use jk to exit insert mode
keymap.set('i', 'jk', '<ESC>')

-- clear search highlights
keymap.set('n', '<leader>nh', ':nohl<CR>')

-- select all
vim.keymap.set('n', '<C-a>', 'ggVG')

-- delete single character without copying into register
keymap.set('n', 'x', '"_x')
keymap.set('n', '<leader>p', '"_dP')
keymap.set('n', '<C-a>', 'gg0VG')

-- window management
keymap.set('n', '<leader>wv', '<C-w>v') -- split window vertically
keymap.set('n', '<leader>wh', '<C-w>s') -- split window horizontally
-- keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set('n', '<leader>wx', ':close<CR>') -- close current split window

keymap.set('n', '<leader>to', ':tabnew<CR>') -- open new tab
keymap.set('n', '<leader>tx', ':tabclose<CR>') -- close current tab
keymap.set('n', '<leader>tn', ':tabn<CR>') --  go to next tab
keymap.set('n', '<leader>tp', ':tabp<CR>') --  go to previous tab

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set('n', '<leader>sm', ':MaximizerToggle<CR>') -- toggle split window maximization


