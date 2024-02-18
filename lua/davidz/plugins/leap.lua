-- import leap plugin safely
local setup, leap = pcall(require, "leap")
if not setup then
	return
end

-- configure/enable gitsigns
leap.setup().create_default_mappings()
