-- Utilities for creating configurations
local util = require "formatter.util"

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
  -- Enable or disable logging
  logging = true,
  -- Set the log level
  log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  filetype = {
    -- Formatter configurations for filetype "lua" go here
    -- and will be executed in order
    c = {
      -- "formatter.filetypes.lua" defines default configurations for the
      -- "lua" filetype
      require("formatter.filetypes.c").clangformat,

      -- You can also define your own configuration
      function()
        return {
          exe = "clang-format",
          args = {
            "-style='{IndentWidth: 4, BasedOnStyle: LLVM}'",
          },
          stdin = true,
        }
      end
    },
  }
}
