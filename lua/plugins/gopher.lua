return {
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("gopher").setup({
        commands = {
          go = "go",
          gomodifytags = "gomodifytags",
          gotests = "gotests",
          impl = "impl",
        },
      })

      -- Keymaps for structural code actions
      vim.keymap.set("n", "<leader>gsj", "<cmd>GoTagAdd json<cr>", { desc = "Add JSON struct tags" })
      vim.keymap.set("n", "<leader>gsy", "<cmd>GoTagAdd yaml<cr>", { desc = "Add YAML struct tags" })
    end,
  },
}
