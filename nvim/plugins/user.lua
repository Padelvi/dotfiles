return {
  -- Add plugins, the lazy syntax
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
    "codota/tabnine-nvim",
    build = "./dl_binaries.sh",
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
}
