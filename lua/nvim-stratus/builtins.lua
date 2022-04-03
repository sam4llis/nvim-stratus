local M = {}
local utils = require('nvim-stratus.utils')

--
-- @desc:
--   Returns the current mode.
-- @return: string
--   The current mode in string format.
--
M.current_mode = function ()
  local modes = require('nvim-stratus.ui.modes')
  local mode = modes[vim.api.nvim_get_mode().mode]
  return utils.surround_whitespace(mode):upper()
end

--
-- @desc:
--   Returns the current git branch of the active buffer.
-- @return: string
--   The git branch if the active buffer does belong to a git directory.
--   An empty string if the active buffer does not belong to a git directory.
--
M.git_branch = function ()
  local branch = vim.b.gitsigns_head or ''
  if branch == '' then return '' end
  local s = string.format(' %s', branch)
  return utils.surround_whitespace(s)
end

--
-- @desc:
--   Returns the current number of words in the active buffer.
-- @return: string
--   The number of words in string format.
--
M.word_count = function ()
  local words = tostring(vim.fn.wordcount().words)
  return string.format('  %s Words ', words)
end

--
-- @desc:
--   Checks whether spelling is enabled in the active buffer.
-- @return: string
--   The spelling language if `set spell` is enabled.
--   An empty string if `set nospell` is enabled.
--
M.spell_check = function ()
  if vim.opt.spell._value then
    return string.format('  %s ', vim.bo.spelllang)
  end
  return ''
end

--
-- @desc:
--   Returns the filename of the active buffer.
-- @return: string
--   The filename of the active buffer if the file has been written.
--   An empty string if the active buffer is not a written file.
--
M.filename = function ()
  local filename = vim.fn.expand('%:t')
  if filename ~= '' then
    return string.format('  %s ', filename)
  else
    return ''
  end
end

--
-- @desc:
--   Returns the file directory of the active buffer.
-- @return: string
--   The file directory of the active buffer.
--
M.file_directory = function ()
  return string.format('  ﱮ %s ', vim.fn.expand('%:p:h:t'))
end

--
-- @desc:
--   Checks whether the active buffer has been modified or is read-only.
-- @return: string
--   '+' if the active buffer has been modified.
--   '-' if the active buffer is read-only.
--   An empty string if the active buffer is not a written file.
--
M.modified = function ()
  if vim.bo.modified then
    return '  + '
  elseif vim.bo.modifiable == false or vim.bo.readonly == true then
    return '  - '
  end
  return ''
end

--
-- @desc:
--   Returns the percentage of the cursor through the active buffer, and the
--   total number of lines in the active buffer.
-- @return: string
--   A string displaying the cursor-position percentage, and the total number
--   of lines in the active buffer.
--
M.percentage_line_count = function ()
  local lines = vim.fn.line('$')
  local percentage = math.floor(vim.fn.line('.') / lines * 100) .. '%'
  return string.format('  %s/%s ', percentage, lines)
end

-- TODO: Documentation
M.get_lsp_diagnostic = function ()
  -- TODO: this needs some work, see :h vim.diagnostic.get()
  -- TODO: hide this if no LSP is enabled.
  -- TODO: split into multiple get() functions - i.e. get_errors(), get_warnings(), etc.
  local result = {}
  local levels = {
  errors = 'Error',
  warnings = 'Warning',
  info = 'Information',
  hints = 'Hint'
  }

  for k, level in pairs(levels) do
    result[k] = vim.lsp.diagnostic.get_count(0, level)
  end
  return string.format(
  "  %s   %s   %s   %s ",
  result['errors'] or 0, result['warnings'] or 0,
  result['info'] or 0, result['hints'] or 0
)
end

return M
