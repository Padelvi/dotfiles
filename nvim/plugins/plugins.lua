return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = { "lua", "python" },
    },
  },
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      opts.section.header.val = {
        " █████  ███████ ████████ ██████   ██████",
        "██   ██ ██         ██    ██   ██ ██    ██",
        "███████ ███████    ██    ██████  ██    ██",
        "██   ██      ██    ██    ██   ██ ██    ██",
        "██   ██ ███████    ██    ██   ██  ██████",
        " ",
        "    ███    ██ ██    ██ ██ ███    ███",
        "    ████   ██ ██    ██ ██ ████  ████",
        "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
        "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
        "    ██   ████   ████   ██ ██      ██",
      }
      return opts
    end,
  },
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
      -- You can also add keybindings or additional configuration here
    end,
  },
  {
    "knubie/vim-kitty-navigator",
    event = "VeryLazy",
    config = function() os.execute "cp ~/.local/share/nvim/lazy/vim-kitty-navigator/*.py ~/.config/kitty/" end,
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
          ["true"] = "false",
          ["True"] = "False",
          ["Some"] = "None",
          ["Ok"] = "Err",
          ["0"] = "1",
        },
        remove_default_inverses = true,
      }
    end,
  },
  {
    "mikesmithgh/kitty-scrollback.nvim",
    enabled = true,
    lazy = true,
    cmd = { "KittyScrollbackGenerateKittens", "KittyScrollbackCheckHealth" },
    event = { "User KittyScrollbackLaunch" },
    version = "*",
    config = function() require("kitty-scrollback").setup() end,
  },
  {
    "fladson/vim-kitty",
    event = "VeryLazy",
  },
}
