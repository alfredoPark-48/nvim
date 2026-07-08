return {
  -- Harpoon: File pinning and jumping
  {
    "theprimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")

      -- Change this to your Spacebar setup for guaranteed execution
      vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Harpoon Pin File" })
      vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu, { desc = "Harpoon Menu Panel" })

      -- Quick file jumping keys (1 through 4) using Shift + Number Keys
      vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end, { desc = "Harpoon File 1" })
      vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end, { desc = "Harpoon File 2" })
      vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end, { desc = "Harpoon File 3" })
      vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end, { desc = "Harpoon File 4" })
    end,
  },

  -- Undotree: Visual undo history visualizer
  {
    "mbbill/undotree",
    config = function()
      vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree" })
    end,
  },

  -- Vim-Tmux-Navigator: Seamless navigation between tmux panes and neovim splits
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<C-h>", "<cmd>TmuxNavigateLeft<cr>",  desc = "Navigate Left" },
      { "<C-j>", "<cmd>TmuxNavigateDown<cr>",  desc = "Navigate Down" },
      { "<C-k>", "<cmd>TmuxNavigateUp<cr>",    desc = "Navigate Up" },
      { "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Navigate Right" },
    },
  },
}
