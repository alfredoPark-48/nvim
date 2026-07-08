return {
	-- Modern, highly-customizable colorscheme
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			variant = "default", -- use "light" for light variant, or "auto"
			transparent = true, -- Highly recommended! Blends perfectly with your terminal background
			saturation = 1, -- Full color punchiness
			italic_comments = true,
			hide_fillchars = true, -- Gives you an incredibly clean looking ui layout
			borderless_pickers = true, -- Removes ugly borders on Telescope pickers
			terminal_colors = true,
			cache = true, -- Speeds up your Neovim boot time significantly

			-- Custom extension tracking configurations
			extensions = {
				telescope = true,
				cmp = true,
				gitsigns = true,
				notify = true,
			},
		},
		config = function(_, opts)
			-- Setup cyberdream with the options object table we built right above
			require("cyberdream").setup(opts)

			-- Load the color architecture engine
			vim.o.background = "dark"
			vim.cmd("colorscheme cyberdream")
		end,
	},
	-- Sleek statusline at the bottom of the screen
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				theme = "cyberdream",
				component_separators = "|",
				section_separators = "",
			},
		},
	},
}
