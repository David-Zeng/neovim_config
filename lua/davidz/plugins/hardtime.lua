-- import hardtime coding assistant plugin safely
local setup, hardtime = pcall(require, "hardtime")
if not setup then
	return
end

-- configure/enable gitsigns
hardtime.setup()
