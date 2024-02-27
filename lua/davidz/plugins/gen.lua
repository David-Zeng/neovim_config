-- import gen plugin safely
local setup, gen = pcall(require, "gen")
if not setup then
	return
end

-- configure/enable gitsigns
gen.setup()
