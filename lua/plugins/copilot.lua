return {
	"github/copilot.vim",
	config = function()
		vim.g.copilot_assume_mapped = true
		vim.keymap.set("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
			script = true,
			silent = true,
			expr = true,
			replace_keycodes = false,
		})
		vim.g.copilot_no_tab_map = true
	end,
}
