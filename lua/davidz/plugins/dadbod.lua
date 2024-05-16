-- import dadbod plugin safely
local setup, dadbod_ui = pcall(require, "vim-dadbod-ui")
if not setup then
	return
end

-- configure/enable gitsigns
dadbod_ui.setup()
