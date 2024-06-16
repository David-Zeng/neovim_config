require("davidz.plugins-setup")
require("davidz.core.options")
require("davidz.core.keymaps")
require("davidz.core.colorschema")
require("davidz.plugins.comment")
require("davidz.plugins.nvim-tree")
require("davidz.plugins.lualine")
require("davidz.plugins.telescope")
require("davidz.plugins.nvim-cmp")
require("davidz.plugins.lsp.mason")
require("davidz.plugins.lsp.lspsaga")
require("davidz.plugins.lsp.lspconfig")
require("davidz.plugins.lsp.null-ls")
require("davidz.plugins.autopairs")
require("davidz.plugins.treesitter")
require("davidz.plugins.gitsigns")
require("davidz.plugins.jupyter-vim")
require("davidz.plugins.cody")
require("davidz.plugins.hop")
require("davidz.plugins.gen")
-- require("davidz.plugins.auto_session")
require("davidz.plugins.possession")
require("davidz.plugins.markdown-preview")
require("davidz.plugins.dadbod")
require("davidz.plugins.alpha")
require("davidz.plugins.luasnip")
require("davidz.plugins.oil")

-- python provider
vim.g.python3_host_prog = "/Users/davidzeng/miniforge3/bin/python3"

-- cody highlight group
vim.api.nvim_set_hl(0, "CmpItemKindCody", { fg = "Red" })

-- auto terminal
