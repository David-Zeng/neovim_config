vim.g.mapleader = " "
vim.g.maplocalleader = ","

local keymap = vim.keymap

---------------------
-- General Keymaps
---------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>") -- in insert mode, jk = ESC

-- clear search highlights
keymap.set("n", "<leader>nn", ":nohl<CR>")

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<localleader>o", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- telescope git commands (not on youtube nvim video)
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

-- jupyter-vim
keymap.set("n", "<Leader>R", "<Cmd>JupyterRunFile<CR>", { buffer = true, silent = true })
keymap.set("n", "<Leader>I", "<Cmd>PythonImportThisFile<CR>", { buffer = true, silent = true })
keymap.set("n", "<Leader>d", "<Cmd>JupyterCd %:p:h<CR>", { buffer = true, silent = true })
keymap.set("n", "<Leader>X", "<Cmd>JupyterSendCell<CR>", { buffer = true, silent = true })
keymap.set("n", "<Leader>P", "<Cmd>JupyterSendRange<CR>", { buffer = true, silent = true })
keymap.set("n", "<Leader>p", "<Plug>JupyterRunTextObj", { buffer = true, silent = true })
keymap.set("v", "<Leader>p", "<Plug>JupyterRunVisual", { buffer = true, silent = true })
keymap.set("n", "<Leader>b", "<Cmd>PythonSetBreak<CR>", { buffer = true, silent = true })

-- tagbar
keymap.set("n", "<F8>", ":TagbarToggle<CR>") -- toggle split window maximization

-- jupyter-vim
keymap.set("n", "<localleader>R", ":JupyterRunFile<CR>", { noremap = true, silent = true })
keymap.set("n", "<localleader>I", ":PythonImportThisFile<CR>", { noremap = true, silent = true })
keymap.set("n", "<localleader>d", ":JupyterCd %:p:h<CR>", { noremap = true, silent = true })
keymap.set("n", "<localleader>X", ":JupyterSendCell<CR>", { noremap = true, silent = true })
keymap.set("n", "<localleader>E", ":JupyterSendRange<CR>", { noremap = true, silent = true })
keymap.set("n", "<localleader>e", "<Plug>JupyterRunTextObj", { noremap = true, silent = true })
keymap.set("v", "<localleader>e", "<Plug>JupyterRunVisual", { noremap = true, silent = true })
keymap.set("n", "<localleader>b", ":PythonSetBreak<CR>", { noremap = true, silent = true })

-- lspsaga
local opts = { noremap = true, silent = true }
keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
keymap.set("n", "[d", ":Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
keymap.set("n", "]d", ":Lspsaga diagnostic_jump_next<CR>", opts) -- jump to previous diagnostic in buffer

-- hop
local hop = require("hop")
local directions = require("hop.hint").HintDirection
keymap.set("", "f", function()
	hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, { remap = true })
keymap.set("", "f2", function()
	hop.hint_char2({ direction = directions.AFTER_CURSOR, current_line_only = false })
end, { remap = true })
keymap.set("", "F", function()
	hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, { remap = true })
keymap.set("", "F2", function()
	hop.hint_char2({ direction = directions.BEFORE_CURSOR, current_line_only = false })
end, { remap = true })
keymap.set("", "t", function()
	hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
end, { remap = true })
keymap.set("", "T", function()
	hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
end, { remap = true })

-- gen with ollama
keymap.set({ "n", "v" }, "<leader>]", ":Gen<CR>")
