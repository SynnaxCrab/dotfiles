return {
  {
    "eoh-bse/minintro.nvim",
    config = true,
    lazy = false
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = true
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = 'ibl',
    config = true,
  },
}
