return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        transparent_background = true, -- Enables transparent background
      })
      vim.cmd.colorscheme "catppuccin-mocha"
    end
  }
}
