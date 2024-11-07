-- import gen plugin safely
local setup, avante = pcall(require, "avante")
if not setup then
	return
end

avante.setup({})
