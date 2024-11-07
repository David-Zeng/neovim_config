-- Get the environment name from the command line argument
local env_name = arg[1] or "poe" -- Default to "cda" if no argument is provided

-- Split window vertically
vim.cmd("vsplit")

-- Open terminal in the right window
vim.cmd("wincmd l")
vim.cmd("terminal")

-- Function to send commands to the terminal
local function send_to_terminal(command)
	local chan_id = vim.b.terminal_job_id
	vim.fn.chansend(chan_id, command .. "\n")
	vim.fn.chansend(chan_id, "\r") -- simulate press enter
end

-- Send commands to the terminal
send_to_terminal("conda activate " .. env_name)
send_to_terminal("jupyter console")

-- Move cursor back to the left window
vim.cmd("wincmd h")

-- Print a message to confirm the environment
print("Python development environment set up with conda environment: " .. env_name)
