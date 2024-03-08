return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {}
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = false
    },
    keys = {
      { "<leader>tb", function() require("gitsigns").toggle_current_line_blame() end },
    }
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    keys = {
      {
        "-",
        function()
          require("neo-tree.command").execute({ toggle = true })
        end,
        desc = "Explorer NeoTree (root dir)",
      },
    },
    config = function()
      require("neo-tree").setup({
        window = {
          position = "float",
        }
      })
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true,
    keys = {
      { "<leader>a",  function() require("harpoon"):list():append() end, desc = "Mark file with harpoon" },
      {
        "<leader>ha",
        function()
          local harpoon = require("harpoon")
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "Show harpoon marks"
      },
      { "<leader>hp", function() require("harpoon"):list():prev() end,   desc = "Go to previous harpoon mark" },
      { "<leader>hn", function() require("harpoon"):list():next() end,   desc = "Go to next harpoon mark" },
    }
  }
}
