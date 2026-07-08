return {
	-- Fugitive: The premier git wrapper for commands inside vim
	{
		"tpope/vim-fugitive",
		cmd = { "G", "Git" },
		keys = {
			{ "<leader>gs", "<cmd>Git<cr>", desc = "Git Status Panel" },
		},
	},

	-- Inline git blame lines
	{
		"f-person/git-blame.nvim",
		event = "BufReadPost",
		opts = {
			enabled = true,
			message_template = "<author> • <date> • <summary>",
			date_format = "%Y-%m-%d",
		},
	},

	-- Line side change markers
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPost",
		opts = {},
	},
}
