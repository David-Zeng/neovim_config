-- import oil plugin safely
local setup, oil = pcall(require, "oil")
if not setup then
	return
end

-- configure/enable oil
require("oil").setup({
	default_file_explorer = true,
})
