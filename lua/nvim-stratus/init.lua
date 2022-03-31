-- TODO: add 'format' to 'attach_components', e.g.,
--   format = [block (current/default), strata (continous without spaces)].
-- TODO: Create components for word count, spell=on, etc.
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
end

M.compile = function (components)
  for _, c in pairs(components) do
    vim.opt.statusline:append(c)
  end
end

return M
