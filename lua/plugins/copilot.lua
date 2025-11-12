return {
  "zbirenbaum/copilot.lua",
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true,
      hide_during_completion = true,
      debounce = 75,
      keymap = {
        accept = "<C-a>",
        accept_word = "<C-s>",
        accept_line = false,
        next = "<C-n>",
        prev = "<C-p>",
        dismiss = "<C-]>",
      },
    },
    copilot_node_command = "node", -- Node.js version must be > 18.x
    server_opts_overrides = {},
  },
  config = function(_, opts)
    require("copilot").setup(opts)

    -- Auto-trigger copilot suggestions when entering insert mode
    local group = vim.api.nvim_create_augroup("CopilotAutoTrigger", { clear = true })
    vim.api.nvim_create_autocmd("InsertEnter", {
      group = group,
      callback = function()
        -- Small delay to ensure copilot is ready
        vim.defer_fn(function()
          if require("copilot.suggestion").is_visible() then return end
          -- Force trigger copilot suggestion
          require("copilot.suggestion").next()
        end, 100)
      end,
    })

    -- Also trigger on cursor movement in insert mode to be more responsive
    vim.api.nvim_create_autocmd("CursorMovedI", {
      group = group,
      callback = function()
        vim.defer_fn(function()
          if not require("copilot.suggestion").is_visible() then require("copilot.suggestion").next() end
        end, 50)
      end,
    })
  end,
}
