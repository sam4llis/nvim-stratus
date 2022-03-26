-- -- FIXME: Modes 'V.Block' and 'S.Block' do not work.
-- local M = setmetatable({
--   ['n']  = 'Normal',
--   ['no'] = 'N·Pending',
--   ['v']  = 'Visual',
--   ['V']  = 'V·Line',
--   [''] = 'V·Block',
--   ['s']  = 'Select',
--   ['S']  = 'S·Line',
--   [''] = 'S·Block',
--   ['i']  = 'Insert',
--   ['ic'] = 'Insert',
--   ['R']  = 'Replace',
--   ['Rv'] = 'V·Replace',
--   ['c']  = 'Command',
--   ['cv'] = 'Vim·Ex',
--   ['ce'] = 'Ex',
--   ['r']  = 'Prompt',
--   ['rm'] = 'More',
--   ['r?'] = 'Confirm',
--   ['!']  = 'Shell',
--   ['t']  = 'Terminal',
-- }, {
--   __index = function()
--     return 'Unknown'
--   end
-- })

-- return M
local M = {
  ['n'] = 'NORMAL',
  ['no'] = 'OP',
  ['nov'] = 'OP',
  ['noV'] = 'OP',
  ['no'] = 'OP',
  ['niI'] = 'NORMAL',
  ['niR'] = 'NORMAL',
  ['niV'] = 'NORMAL',
  ['v'] = 'VISUAL',
  ['V'] = 'LINES',
  [''] = 'BLOCK',
  ['s'] = 'SELECT',
  ['S'] = 'SELECT',
  [''] = 'BLOCK',
  ['i'] = 'INSERT',
  ['ic'] = 'INSERT',
  ['ix'] = 'INSERT',
  ['R'] = 'REPLACE',
  ['Rc'] = 'REPLACE',
  ['Rv'] = 'V-REPLACE',
  ['Rx'] = 'REPLACE',
  ['c'] = 'COMMAND',
  ['cv'] = 'COMMAND',
  ['ce'] = 'COMMAND',
  ['r'] = 'ENTER',
  ['rm'] = 'MORE',
  ['r?'] = 'CONFIRM',
  ['!'] = 'SHELL',
  ['t'] = 'TERM',
  ['nt'] = 'TERM',
  ['null'] = 'NONE',
}

return M
