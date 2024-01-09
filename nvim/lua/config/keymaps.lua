-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- This file is automatically loaded by lazyvim.config.init
local Util = require("lazyvim.util")

local map = vim.keymap.set

-- Simple remap
map("n", "o", "o<esc>", { silent = true })
map("n", "O", "O<esc>", { silent = true })

-- New buffer shortcut
map("n", "<tab>", "<cmd>bnext<cr>")
map("n", "<S-tab>", "<cmd>bprevious<cr>")
map("n", "<leader>x", function()
  local bd = require("mini.bufremove").delete
  if vim.bo.modified then
    local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
    if choice == 1 then -- Yes
      vim.cmd.write()
      bd(0)
    elseif choice == 2 then -- No
      bd(0, true)
    end
  else
    bd(0)
  end
end)

-- Saving made easy
map("n", "<leader>ww", "<cmd>w<cr>")
map("n", "<leader>wq", "<cmd>wq<cr>")

-- Reformating
map({ "n", "v" }, "<leader>fm", function()
  Util.format({ force = true })
end, { desc = "Format" })

-- Comments
map("n", "<C-c>", "gcc")
map("v", "<C-c>", "gc")

-- Managing errors
map("n", "<leader>ee", "<cmd>lua vim.diagnostic.open_float()<CR>")
map("n", "<leader>et", "<cmd>Telescope diagnostics<CR>")
map("n", "<leader>en", "<cmd>lua vim.diagnostic.goto_next()<CR>")
map("n", "<leader>ep", "<cmd>lua vim.diagnostic.goto_prev()<CR>")

-- Deleting the opening of file explorer with leader-e
map("n", "<leader>e", "")

-- -- Ignore the replacement on lines with alt+{j, k}
-- map("i", "<A-j>", "<esc>j")
-- map("i", "<A-k>", "<esc>k")

-- Select everything
map("n", "vA", "ggvG$")
