-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Register custom keymap with which-key
local which_key = require("which-key")
which_key.add({
  {
    "<leader>t",
    "<cmd>Lazy<CR>",
    desc = "Lazy Tools",
    icon = "🔧",
    mode = { "n", "v" }, -- NORMAL and VISUAL mode
  },
  {
    "<leader>ta",
    "<cmd>AerialToggle!<CR>",
    desc = "Aerial",
    icon = "ƒ",
    mode = { "n" },
  },
  -- grug-far.nvim
  {
    "<leader>sr",
    desc = "Search/Replace",
    icon = "㏛🗁",
    mode = { "n", "v" },
  },
  -- -------
  {
    "<leader>tg",
    "<cmd>Grapple toggle<CR>",
    desc = "Grapple",
    mode = { "n" },
  },
  {
    "<leader>gd",
    desc = "Git Diff",
    mode = { "n" },
  },
  -- calendar.vim
  {
    "<leader>tc",
    desc = "Calendar",
    icon = "",
  },
  {
    "<leader>tcC",
    "<cmd>Calendar -view=clock<CR>",
    icon = "󰃰",
    desc = "Toggle Clock View!",
  },
  -- -------
})
