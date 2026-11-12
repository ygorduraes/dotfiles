return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  {
    "joshuadanpeterson/typewriter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("typewriter").setup()
    end,
    opts = {},
  },
}
