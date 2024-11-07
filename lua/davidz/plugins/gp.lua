local status_ok, gp = pcall(require, "gp")
if not status_ok then
	return
end

gp.setup({
	openai_api_key = "",

	providers = {
		ollama = {
			disable = false,
			endpoint = "http://localhost:11434/v1/chat/completions",
			secret = "dummy_secret",
		},
		openai = {
			endpoint = "http://127.0.0.1:9000/v1/chat/completions",
			secret = os.getenv("OPENAI_API_KEY"),
		},
	},

	agents = {
		{
			provider = "openai",
			name = "ChatGPT4o-mini",
			chat = true,
			command = true,
			-- string with model name or table with model name and parameters
			model = { model = "gpt-4o-mini", temperature = 1.1, top_p = 1 },
			-- system prompt (use this to specify the persona/role of the AI)
			system_prompt = require("gp.defaults").chat_system_prompt,
			disable = false,
		},
		{
			provider = "openai",
			name = "ChatClaude-3.5-Sonnet",
			chat = true,
			command = true,
			-- string with model name or table with model name and parameters
			model = { model = "claude-3.5-sonnet", temperature = 0, 8, top_p = 1 },
			-- system prompt (use this to specify the persona/role of the AI)
			system_prompt = require("gp.defaults").chat_system_prompt,
			disable = false,
		},
		{
			provider = "ollama",
			name = "ChatOllamaStarling",
			chat = true,
			command = true,
			-- string with model name or table with model name and parameters
			model = {
				model = "starling-lm:7b-beta-q4_K_M",
				num_ctx = 8000,
			},
			-- system prompt (use this to specify the persona/role of the AI)
			system_prompt = "You are a general AI assistant.",
			disable = true,
		},
		{
			provider = "ollama",
			name = "ChatOllamaLlama3.1",
			chat = true,
			command = true,
			-- string with model name or table with model name and parameters
			model = {
				model = "llama3.1:latest",
				num_ctx = 32000,
			},
			-- system prompt (use this to specify the persona/role of the AI)
			system_prompt = "You are a general AI assistant.",
			disable = true,
		},
		{
			provider = "ollama",
			name = "ChatOllamaGemma2_2b",
			chat = true,
			command = true,
			-- string with model name or table with model name and parameters
			model = {
				model = "gemma2:2b-instruct-q6_K",
				num_ctx = 8000,
			},
			-- system prompt (use this to specify the persona/role of the AI)
			system_prompt = "You are a general AI assistant.",
			disable = true,
		},
		{
			provider = "ollama",
			name = "ChatOllamaLlama3",
			chat = true,
			command = true,
			-- string with model name or table with model name and parameters
			model = {
				model = "llama3",
				num_ctx = 8192,
			},
			-- system prompt (use this to specify the persona/role of the AI)
			system_prompt = "You are a general AI assistant.",
			disable = true,
		},
		{
			name = "ChatGPT4o",
			chat = true,
			command = true,
			-- string with model name or table with model name and parameters
			model = { model = "gpt-4o", temperature = 1.1, top_p = 1 },
			-- system prompt (use this to specify the persona/role of the AI)
			system_prompt = require("gp.defaults").chat_system_prompt,
			disable = true,
		},
		{
			provider = "openai",
			name = "ChatGPT4o-mini",
			chat = true,
			command = true,
			-- string with model name or table with model name and parameters
			model = { model = "gpt-4o-mini", temperature = 1.1, top_p = 1 },
			-- system prompt (use this to specify the persona/role of the AI)
			system_prompt = require("gp.defaults").chat_system_prompt,
			disable = false,
		},
	},
})
