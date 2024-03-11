require("nvchad.mappings")

-- add yours here
local map = vim.keymap.set
-- TMUX mapping
map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "window Left" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "window Right" })
map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "window Down" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "window Up" })

map("n", "<leader>fm", function()
	require("conform").format()
end, { desc = "File Format with conform" })

map("n", "ù", "%", { desc = "change mapping" })

-- Create lines automatically
map("n", "o", "o<ESC>", { desc = "insert below" })
map("n", "O", "O<ESC>", { desc = "insert above" })

-- Savings
map("n", "<leader>ww", "<cmd> w <CR>", { desc = "save file" })
map("n", "<leader>wq", "<cmd> wq <CR>", { desc = "save file and exit" })

map("n", "vA", "ggvG$", { desc = "Select everything" })

-- Trouble
map("n", "<leader>en", function()
	require("trouble").next({ skip_groups = true, jump = true })
end)

map("n", "<leader>ep", function()
	require("trouble").previous({ skip_groups = true, jump = true })
end)

map("n", "ù", "%")

local mapdel = vim.keymap.del

mapdel("n", "<leader>e")
