local neogit = require("neogit")
local utils = require('utils')

utils.map('n', '<Leader>gs', ':Neogit<CR>')  -- Git status
utils.map('n', '<Leader>gc', ':Neogit commit<CR>')  -- Git status

neogit.setup {
  disable_signs = false,
  disable_context_highlighting = false,
  -- customize displayed signs
  signs = {
    -- { CLOSED, OPENED }
    section = { ">", "v" },
    item = { ">", "v" },
    hunk = { "", "" },
  },
  -- override/add mappings
  mappings = {
    -- modify status buffer mappings
    status = {
      -- Adds a mapping with "B" as key that does the "BranchPopup" command
      -- ["B"] = "BranchPopup",
      -- Removes the default mapping of "s"
      ["s"] = "",
    }
  }
}
