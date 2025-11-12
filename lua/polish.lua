-- if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*[Jj]enkinsfile*",
  callback = function() vim.bo.filetype = "groovy" end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    -- Save cursor position
    local cursor_pos = vim.api.nvim_win_get_cursor(0)
    -- Remove trailing whitespace
    vim.cmd [[%s/\s\+$//e]]
    -- Restore cursor position
    vim.api.nvim_win_set_cursor(0, cursor_pos)
  end,
  desc = "Remove trailing whitespace on save",
})
