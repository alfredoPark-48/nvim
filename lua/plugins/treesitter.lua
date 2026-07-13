return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSUpdateSync", "TSUpdate" },
    config = function()
      local ts = require("nvim-treesitter")
      ts.setup()

      -- Check and install required parsers if they are missing
      local installed = ts.get_installed()
      local parsers = { "go", "gomod", "gowork", "lua", "markdown", "markdown_inline" }
      local to_install = {}
      for _, p in ipairs(parsers) do
        if not vim.list_contains(installed, p) then
          table.insert(to_install, p)
        end
      end

      if #to_install > 0 then
        pcall(ts.install, to_install)
      end
    end,
  },
}
