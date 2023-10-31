return {
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
      -- You can also add keybindings or additional configuration here
    end,
  },
  {
    "kmonad/kmonad-vim",
    event = "BufRead",
  },
  {
    "elkowar/yuck.vim",
    event = "BufRead",
  },
  {
    "edluffy/hologram.nvim",
    event = "VeryLazy",
    config = function()
      require("hologram").setup {
        auto_display = true,
      }
    end,
  },
  {
    "knubie/vim-kitty-navigator",
    event = "VeryLazy",
    config = function() os.execute "cp ~/.local/share/nvim/lazy/vim-kitty-navigator/*.py ~/.config/kitty/" end,
  },
  {
    "sudar/vim-arduino-syntax",
    event = "BufRead",
  },
  {
    "stevearc/vim-arduino",
    event = "BufRead",
  },
  {
    "jpalardy/vim-slime",
    event = "VeryLazy",
  },
  {
    "nanotee/zoxide.vim",
    event = "VeryLazy",
  },
  {
    "smoka7/multicursors.nvim",
    event = "VeryLazy",
    dependencies = {
      "smoka7/hydra.nvim",
    },
    opts = {},
    cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
    keys = {
      {
        mode = { "v", "n" },
        "<Leader>m",
        "<cmd>MCstart<cr>",
        desc = "Create a selection for selected text or word under the cursor",
      },
    },
  },
  {
    "altermo/ultimate-autopair.nvim",
    event = { "InsertEnter", "CmdlineEnter" },
    branch = "v0.6",
  },
  {
    "nguyenvukhang/nvim-toggler",
    event = "BufRead",
    config = function()
      require("nvim-toggler").setup {
        inverses = {
          ["vim"] = "emacs",
        },
        remove_default_inverses = true,
      }
    end,
  },
  -- I have not started using neotest yet
  -- {
  --   "nvim-neotest/neotest",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "antoinemadec/FixCursorHold.nvim",
  --   },
  --   event = "BufRead",
  --   config = function()
  --     require("neotest").setup {
  --       adapters = {
  --         require "neotest-python" {
  --           runner = "pytest",
  --         },
  --         require "neotest-rust",
  --       },
  --     }
  --   end,
  -- },
}
