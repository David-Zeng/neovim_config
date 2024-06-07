-- import leap plugin safely
local setup, hop = pcall(require, "hop")
if not setup then
	return
end

-- configure/enable gitsigns
require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
