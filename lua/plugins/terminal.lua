return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({
				size = function(term)
					if term.direction == "horizontal" then
						return 15
					elseif term.direction == "vertical" then
						return vim.o.columns * 0.4
					end
				end,
				open_mapping = [[<C-\>]], -- global toggle shortcut (works in all modes)
				hide_numbers = true, -- hide line numbers in terminal window
				shade_filetypes = {},
				shade_terminals = true,
				shading_factor = 2,
				start_in_insert = true,
				insert_mappings = true,
				terminal_mappings = true,
				persist_size = true,
				persist_mode = true,
				direction = "horizontal", -- default to bottom/horizontal layout
				close_on_exit = true,
				shell = vim.o.shell,
				float_opts = {
					border = "curved", -- smooth rounded borders for the float option
					winblend = 3,
				},
			})

			-- Keymaps in Normal mode to toggle layouts
			vim.keymap.set(
				"n",
				"<leader>t",
				"<cmd>ToggleTerm direction=horizontal<cr>",
				{ desc = "Toggle Bottom Terminal" }
			)
			vim.keymap.set(
				"n",
				"<leader>tb",
				"<cmd>ToggleTerm direction=horizontal<cr>",
				{ desc = "Toggle Bottom Terminal" }
			)
			vim.keymap.set(
				"n",
				"<leader>tf",
				"<cmd>ToggleTerm direction=float<cr>",
				{ desc = "Toggle Floating Terminal" }
			)

			-- Navigation and escape helpers within the terminal buffer
			function _G.set_terminal_keymaps()
				local opts = { buffer = 0 }
				-- Use jk to enter normal mode inside the terminal buffer
				vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)

				-- Smooth window switching from terminal mode to adjacent splits
				vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], opts)
				vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], opts)
				vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], opts)
				vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], opts)
			end

			-- Register these keymaps only inside toggleterm buffers
			vim.cmd("autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()")
		end,
	},
}
