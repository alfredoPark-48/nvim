return {
	-- 1. GitHub Copilot Engine (Fast inline ghost text completions as you type)
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = {
					enabled = true,
					auto_trigger = true,
					debounce = 75,
					keymap = {
						accept = "<M-l>", -- Option + l (macOS) / Alt + l (Linux) to accept completion
						accept_word = "<M-w>", -- Option + w (macOS) / Alt + w (Linux) to accept next word
						accept_line = "<M-A-l>", -- Option + Shift + l (macOS) / Alt + Shift + l (Linux) for full line
						next = "<M-]>",
						prev = "<M-[>",
						dismiss = "<C-]>",
					},
				},
				panel = { enabled = false },
			})
		end,
	},

	-- 2. OpenCode (Context-Aware AI Coding Agent)
	{
		"sudo-tee/opencode.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("opencode").setup({})

			-- Core UI Actions and Controls
			vim.keymap.set({ "n", "v" }, "<leader>oc", "<cmd>Opencode<cr>", { desc = "Toggle OpenCode Window" })
		end,
	},
}
