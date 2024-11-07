-- import gen plugin safely
local setup, gen = pcall(require, "gen")
if not setup then
	return
end

-- configure/enable gitsigns
gen.setup({
	-- model = "phi3:instruct", -- The default model to use.
	model = "starling-lm:7b-beta-q4_K_M", -- The default model to use.
	-- model = "qwen2:1.5b-instruct-q6_K",
	host = "localhost", -- The host running the Ollama service.
	port = "11434", -- The port on which the Ollama service is listening.
	quit_map = "q", -- set keymap for close the response window
	retry_map = "<c-r>", -- set keymap to re-send the current prompt
	init = function(options)
		pcall(io.popen, "ollama serve > /dev/null 2>&1 &")
	end,
	-- Function to initialize Ollama
	command = function(options)
		local body = { model = options.model, stream = true }
		return "curl --silent --no-buffer -X POST http://"
			.. options.host
			.. ":"
			.. options.port
			.. "/api/chat -d $body"
	end,
	-- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
	-- This can also be a command string.
	-- The executed command must return a JSON object with { response, context }
	-- (context property is optional).
	-- list_models = '<omitted lua function>', -- Retrieves a list of model names
	display_mode = "float", -- The display mode. Can be "float" or "split".
	show_prompt = false, -- Shows the prompt submitted to Ollama.
	show_model = false, -- Displays which model you are using at the beginning of your chat session.
	no_auto_close = false, -- Never closes the window automatically.
	debug = false, -- Prints errors and the command which is run.
})

-- customized prompts
gen.prompts["Enhance_Wording_in_office"] = {
	prompt = "Modify the following text to use better wording in office enviornment, just output the final text without additional quotes around it:\n$text",
	replace = false,
}

-- return {
--     Generate = { prompt = "$input", replace = true },
--     Chat = { prompt = "$input" },
--     Summarize = { prompt = "Summarize the following text:\n$text" },
--     Ask = { prompt = "Regarding the following text, $input:\n$text" },
--     Change = {
--         prompt = "Change the following text, $input, just output the final text without additional quotes around it:\n$text",
--         replace = true,
--     },
--     Enhance_Grammar_Spelling = {
--         prompt = "Modify the following text to improve grammar and spelling, just output the final text without additional quotes around it:\n$text",
--         replace = true,
--     },
--     Enhance_Wording = {
--         prompt = "Modify the following text to use better wording, just output the final text without additional quotes around it:\n$text",
--         replace = true,
--     },
--     Make_Concise = {
--         prompt = "Modify the following text to make it as simple and concise as possible, just output the final text without additional quotes around it:\n$text",
--         replace = true,
--     },
--     Make_List = {
--         prompt = "Render the following text as a markdown list:\n$text",
--         replace = true,
--     },
--     Make_Table = {
--         prompt = "Render the following text as a markdown table:\n$text",
--         replace = true,
--     },
--     Review_Code = {
--         prompt = "Review the following code and make concise suggestions:\n```$filetype\n$text\n```",
--     },
--     Enhance_Code = {
--         prompt = "Enhance the following code, only output the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
--         replace = true,
--         extract = "```$filetype\n(.-)```",
--     },
--     Change_Code = {
--         prompt = "Regarding the following code, $input, only output the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
--         replace = true,
--         extract = "```$filetype\n(.-)```",
--     },
-- }
