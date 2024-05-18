require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("i", "jk", "<ESC>")

map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "window Left" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "window Right" })
map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "window Down" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "window Up" })

map("n", "ù", "%", { desc = "change mapping" })

-- Create lines automatically
map("n", "o", "o<ESC>", { desc = "insert below" })
map("n", "O", "O<ESC>", { desc = "insert above" })

-- Savings
map("n", "<leader>ww", "<cmd> w <CR>", { desc = "save file" })
map("n", "<leader>wq", "<cmd> wq <CR>", { desc = "save file and exit" })

map("n", "vA", "gg_vG$", { desc = "Select everything" })

map("n", "<leader>fm", function()
  require("conform").format()
end, { desc = "File Format with conform" })

local mapdel = vim.keymap.del

mapdel("n", "<leader>e")

map("n", "U", "<C-r>")

-- Rust mapping
map("n", "gD", vim.lsp.buf.declaration)
map("n", "gd", vim.lsp.buf.definition)
map("n", "<leader>a", vim.lsp.buf.code_action)

-- map("n", ">>", ">>gv")
-- map("n", "<<", "<<gv")
map("v", ">", ">gv")
map("v", "<", "<gv")

-- Live grep
map("n", "<leader>ts", "<cmd> Telescope live_grep<CR>")
map(
  "v",
  "<leader>ts",
  [[y<cmd>lua require('telescope.builtin').live_grep({ default_text = vim.fn.getreg('"') })<CR>]],
  { noremap = true, silent = true }
)

map("n", "<leader>gn", "<cmd> Gitsign next_hunk<CR>")
map("n", "<leader>gp", "<cmd> Gitsign prev_hunk<CR>")

map("n", "<leader>du", function()
  require("dapui").toggle {}
end, { desc = "Dap UI" })
