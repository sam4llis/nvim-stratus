-- FIXME: Double whitespace needs to be added to statusline.

local M = {}
local utils = require('nvim-stratus.utils')

M.current_mode = function ()
  local modes = require('nvim-stratus.ui.modes')
  local mode = modes[vim.api.nvim_get_mode().mode]
  return utils.surround_whitespace(mode):upper()
end

M.git_branch = function ()
  local branch = vim.b.gitsigns_head or ''
  if branch == '' then return '' end
  local s = string.format(' %s', branch)
  return utils.surround_whitespace(s)
end

M.word_count = function ()
  local words = tostring(vim.fn.wordcount().words)
  return string.format('  %s Words ', words)
end

M.spell_check = function ()
  if vim.opt['spell']._value then
    return string.format('  %s ', vim.bo.spelllang)
  end
  return ''
end

M.filename = function ()
  local filename = vim.fn.expand('%:t')
  if filename ~= '' then
    return string.format('  %s ', filename)
  else
    return ''
  end
end

M.file_directory = function ()
  return string.format('  ﱮ %s ', vim.fn.expand('%:p:h:t'))
end

M.modified = function ()
  if vim.bo.modified then
    return '  + '
  elseif vim.bo.modifiable == false or vim.bo.readonly == true then
    return '  - '
  end
  return ''
end

M.percentage_line_count = function ()
  local lines = vim.fn.line('$')
  local percentage = math.floor(vim.fn.line('.') / lines * 100) .. '%'
  return string.format('  %s/%s ', percentage, lines)
end

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
