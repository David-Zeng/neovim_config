-- import cody coding assistant plugin safely
local setup, cody = pcall(require, "sg")
if not setup then
	return
end

-- configure/enable gitsigns
cody.setup()
