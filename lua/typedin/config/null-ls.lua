require("null-ls").setup({
	debug = false,
	sources = {
		require("null-ls").builtins.formatting.stylua,
	},
})
