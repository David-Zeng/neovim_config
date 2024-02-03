-- import jupyter-vim plugin safely
local setup, jupytervim = pcall(require, "jupyter-vim")
if not setup then
	return
end

-- configure/enable gitsigns
jupytervim.setup()
