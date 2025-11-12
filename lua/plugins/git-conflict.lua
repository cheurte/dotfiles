return {
  "akinsho/git-conflict.nvim",
  version = "*",
  config = true,
  event = "BufReadPre", -- Load when reading files
  cmd = {
    "GitConflictChooseOurs",
    "GitConflictChooseTheirs",
    "GitConflictChooseBoth",
    "GitConflictChooseNone",
    "GitConflictNextConflict",
    "GitConflictPrevConflict",
    "GitConflictListQf",
  },
}
