local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local extras = require("luasnip.extras")
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt
local c = ls.choice_node
local f = ls.function_node
local d = ls.dynamic_node
local sn = ls.snippet_node

vim.keymap.set({ "i", "s" }, "<A-n>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end)

vim.keymap.set({ "i", "s" }, "<Tab>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	else
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<A-j>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })

ls.add_snippets("sql", {
	s("hello", {
		t('print("hello '),
		i(1),
		t(' world")'),
	}),

	s("if", {
		t("if "),
		i(1, "true"),
		t(" then "),
		i(1),
		i(2),
		t(" end"),
	}),
})

ls.add_snippets("all", {
	s("func", { -- Trigger is "func"
		t("def "),
		i(1, "function_name"),
		t("("),
		i(2, "args"),
		t("):"),
		i(3), -- Placeholder for the function body
	}),
})
