local M = {}

local utils = require('nvim-stratus.utils')

M.attach_component = function (opts)
  opts.position = opts.position or 'left'

  if opts.position == 'left' then
    opts.sep = opts.separator.right
  elseif opts.position == 'right' then
    opts.sep = opts.separator.left
  end

  local component_id = utils.get_component_id()
  utils.create_highlight_group(component_id, opts)
  utils.create_component_globals(component_id, opts)

  local prefix = string.format('_G.Stratus_%s', component_id)
  local separator = string.format('luaeval("%s_separator")', prefix)
  local operation = string.format('luaeval("%s()")', prefix)
  local component_separator = '%{v:lua.' .. prefix .. '_create_separator(' .. separator .. ',' .. operation .. ')}'

  local component = {}
  component.left_sep  = '%#' .. component_id .. '_l#' .. component_separator
  component.operation = '%#' .. component_id .. '#' .. '%{v:lua.Stratus_' .. component_id .. '()}'
  component.right_sep = '%#' .. component_id .. '_r#' .. component_separator

  require('nvim-stratus').compile({component.left_sep, component.operation, component.right_sep}, opts.position)
end

M.detach_component = function ()
end

return M
