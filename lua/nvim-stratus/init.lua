-- TODO: add 'format' to 'attach_components', e.g.,
--   format = [block (current/default), strata (continous without spaces)].
-- TODO: Add '?change_on_colour? = true' option for 'attach_component' objects,
--   which changes background of components on mode change.

-- TODO: Check whether we actually require Neovim 0.7.0.
if vim.fn.has('nvim-0.7.0') ~= 1 then
  vim.api.nvim_err_writeln("The plugin 'nvim-stratus' requires Neovim 0.7.0.")
  vim.api.nvim_err_writeln("Please update your Neovim.")
  return
end

local M = {}

M.setup = function (components)
  vim.opt.statusline = ''
  for _, component in pairs(components) do
    require('nvim-stratus.core').attach_component(component)
  end

  vim.opt.statusline:append(table.concat(_G['Stratus_Components_Left']))
  vim.opt.statusline:append('%=')
  vim.opt.statusline:append(table.concat(_G['Stratus_Components_Right']))
end

M.compile = function (components, position)
  _G['Stratus_Components_Left'] = _G['Stratus_Components_Left'] or {}
  _G['Stratus_Components_Centre'] = _G['Stratus_Components_Centre'] or {}
  _G['Stratus_Components_Right'] = _G['Stratus_Components_Right'] or {}
  if position == 'left' then
    for _, c in pairs(components) do
      table.insert(_G['Stratus_Components_Left'], c)
    end
  elseif position == 'right' then
    for _, c in pairs(components) do
      table.insert(_G['Stratus_Components_Right'], c)
    end
  else
    for _, c in pairs(components) do
      table.insert(_G['Stratus_Components_Centre'], c)
    end
  end
end

return M
