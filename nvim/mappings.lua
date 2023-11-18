return {
  n = {
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>b"] = { name = "Buffers" },
    ["gg"] = { "gg0", desc = "Go to start in normal" },
    ["G"] = { "G$", desc = "Go to end in normal" },
    ["<F6>"] = { "<cmd>CompilerOpen<cr>", desc = "Open compiler.nvim", noremap = true, silent = true },
    ["<S-F6>"] = { "<cmd>CompilerRedo<cr>", noremap = true },
    ["<S-F7>"] = { "<cmd>CompilerToggleResults<cr>", noremap = true },
  },
  v = {
    ["gg"] = { "gg0", desc = "Go to start in visual" },
    ["G"] = { "G$", desc = "Go to end in visual" },
  },
}
