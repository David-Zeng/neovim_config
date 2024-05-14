local setup, markdown_preview = pcall(require, "markdown-preview")
if not setup then
	return
end

-- configure/enable gitsigns
markdown_preview.setup()
