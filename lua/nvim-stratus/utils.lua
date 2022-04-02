-- TODO: Documentation.
local M = {}

-- TODO: Something like if group.pos = 1 or END, remove highlight group accordingly.
M.create_highlight_group = function (group, opts)

  local default_opts = {
    fg = '#111111',
    bg = '#FFFFFF',
    gui = 'NONE',
  }

  for k, v in pairs(default_opts) do
    opts.style[k] = opts.style[k] or v
  end

  if opts.position == 'left' then
    vim.cmd(string.format('highlight %s   guifg=%s guibg=%s gui=%s', group, opts.style.fg, opts.style.bg, opts.style.gui))
    vim.cmd(string.format('highlight %s_l guifg=%s guibg=%s gui=%s', group, opts.style.fg, opts.style.bg, opts.style.gui))
    vim.cmd(string.format('highlight %s_r guifg=%s guibg=%s gui=%s', group, opts.style.bg, opts.style.fg, opts.style.gui))
  elseif opts.position == 'right' then
    vim.cmd(string.format('highlight %s   guifg=%s guibg=%s gui=%s', group, opts.style.fg, opts.style.bg, opts.style.gui))
    vim.cmd(string.format('highlight %s_l guifg=%s guibg=%s gui=%s', group, opts.style.bg, opts.style.fg, opts.style.gui))
    vim.cmd(string.format('highlight %s_r guifg=%s guibg=%s gui=%s', group, opts.style.fg, opts.style.bg, opts.style.gui))
  end

end


M.create_separator = function (separator, operation)
  if operation == '' then
    return ''
  else
    return separator
  end
end


M.create_component_globals = function (component_id, opts)

  local prefix = string.format('Stratus_%s', component_id)

  _G[ prefix ] = opts.operation
  _G[ string.format('%s_separator', prefix) ] = opts.sep
  _G[ string.format('%s_create_separator', prefix) ] = M.create_separator
  _G[ string.format('%s_detach_on', prefix) ] = opts.detach_on or ''
end


M.remove_highlight_group = function (group)
end


M.get_component_id = function ()
  _G['Stratus_Component_ID'] = _G['Stratus_Component_ID'] or 0
  _G['Stratus_Component_ID'] = _G['Stratus_Component_ID'] + 1
  return _G['Stratus_Component_ID']
end


M.surround_whitespace = function (operation)
  local space = ' ' -- This is a Unicode Space!
  return space .. operation .. space
end

return M
