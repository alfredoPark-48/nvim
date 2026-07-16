return {
	-- Automatically adds matching brackets, parens, and quotation marks
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},

	-- Smart commenting. Type 'gcc' to comment a line, or 'gc' over a visual selection
	{
		"numToStr/Comment.nvim",
		event = "BufReadPost",
		config = function()
			local ft = require("Comment.ft")
			local old_calculate = ft.calculate
			ft.calculate = function(ctx)
				local ok, parser = pcall(vim.treesitter.get_parser, vim.api.nvim_get_current_buf())
				if not ok or not parser then
					return ft.get(vim.bo.filetype, ctx.ctype)
				end
				return old_calculate(ctx)
			end
			require("Comment").setup({})
		end,
	},

	-- Native Tree-sitter Syntax Highlighting, Indentation & Folding Auto-Attach (Neovim v0.12+)
	{
		"native-treesitter-auto-attach",
		virtual = true,
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"java",
					"python",
					"go",
					"gomod",
					"gowork",
					"rust",
					"c",
					"cpp",
					"lua",
					"javascript",
					"typescript",
					"javascriptreact",
					"typescriptreact",
					"html",
					"css",
					"json",
					"yaml",
					"toml",
				},
				callback = function(args)
					local ok = pcall(vim.treesitter.start, args.buf)
					if ok then
						vim.bo[args.buf].indentexpr = "v:lua.vim.treesitter.indentexpr()"
						vim.wo.foldmethod = "expr"
						vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
						vim.wo.foldlevel = 99
					end
				end,
			})
		end,
	},
}
