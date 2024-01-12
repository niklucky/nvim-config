-- gopher extra snippets and tools like err gen, tags generation etc
-- https://github.com/olexsmir/gopher.nvim
return {
	"olexsmir/gopher.nvim",
	requires = { -- dependencies
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	ft = "go",
	config = function(_, opts)
		require("gopher").setup(opts)
	end,
	build = function()
		vim.cmd([[silent! GoInstallDeps]])
	end,
}
