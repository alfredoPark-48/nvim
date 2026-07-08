return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- Provides the file/folder icons
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("neo-tree").setup({
				close_if_last_window = true, -- Automatically close if it's the only window open
				filesystem = {
					filtered_items = {
						visible = false, -- Hide dotfiles and git files by default
						hide_dotfiles = false, -- Set to false if you WANT to see files like .gitignore
						hide_gitignored = true,
					},
					follow_current_file = {
						enabled = true, -- Automatically focus and find the file you are actively editing
					},
				},
				window = {
					position = "left", -- Sidebar on the left, matching VS Code
					width = 30,
				},
			})

			-- Keymap to toggle the sidebar view
			vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle File Explorer Sidepanel" })
		end,
	},
}
