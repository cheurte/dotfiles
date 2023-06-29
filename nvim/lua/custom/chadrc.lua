---@type ChadrcConfig
 local M = {}

-- local highlights = require "custom.highlights"

 M.ui = {
    theme = 'ayu_dark',
    transparency = false,
    lsp_semantic_tokens = false,
    extended_integration = {"alpha"},
    hl_override = {
        CursorLineNr = {
            fg = "black",
            bg = "green",
        }
    },
    statusline = {
        theme = "default"
    },
    cmp = {
        style = "atom_colored",
    }
 }
 M.plugins = "custom.plugins"
 M.mappings = require "custom.mappings"
-- M.highlights = require "custom.highlights"
return M
