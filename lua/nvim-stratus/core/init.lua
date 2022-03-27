local M = {}

local utils = require('nvim-stratus.utils')

M.add_separator = function (separator, detach_on)
  if detach_on == true then
    return ''
  else
    return separator
  end
end

M.get_component_id = function ()
  _G['Stratus_Component_ID'] = _G['Stratus_Component_ID'] or 0
  _G['Stratus_Component_ID'] = _G['Stratus_Component_ID'] + 1
  return _G['Stratus_Component_ID']
end

M.attach_component = function (opts)
  opts.detach_on = opts.detach_on or false

  local style = opts.style or nil
  local component_id = M.get_component_id()
  utils.create_highlight_group(component_id, style)
  _G['Stratus_' .. component_id] = opts.operation

  if opts.position == 'left' then

  end

  local update_on = opts.update_on or nil
  if update_on ~= nil then
    for _, cmd in pairs(update_on) do
      vim.api.nvim_create_autocmd(cmd, {
        callback = function ()
          require('nvim-stratus').setup()
        end,
      group = 'Stratus',
      once = true,
      })
    end
  end

  local separator = M.add_separator(opts.separator.right, opts.detach_on)

  c1 = '%#' .. component_id .. '_l#' .. separator
  c2 = '%#' .. component_id .. '#' .. '%{v:lua.Stratus_' .. component_id .. '()}'
  c3 = '%#' .. component_id .. '_r#' .. separator

  require('nvim-stratus').compile({c1, c2, c3})
end

M.detach_component = function ()
end

return M
