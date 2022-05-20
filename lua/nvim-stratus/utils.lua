local M = {}

--
-- @desc:
--   Function that creates highlight groups for stratus component. Default
--   highlight options are overwritten if the user supplies this function with
--   their own options.
-- @param group: string
--   The name of the highlight group.
-- @param opts: table | nil
--   User-specified highlight options.
--   keys:
--     fg - Foreground colour for the highlight group.
--     bg - Background colour for the highlight group.
--     gui - GUI mode attributes (e.g., bold font).
-- @return: nil
--
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


--
-- @desc:
--   Function that returns a separator dependent on the input of an operation.
-- @param separator: string
--   The separator to be used if operation is true.
-- @param operation: string
--   The output of an operation function (e.g., the output of a function from
--   nvim-startus' builtins directory).
-- @return: string
--   An empty string if the operation input is also an empty string.
--   The separator input if the operation is not an empty string.
--
M.create_separator = function (separator, operation)
  if operation == '' then
    return ''
  else
    return separator
  end
end


-- TODO: Documentation
M.create_component_globals = function (component_id, opts)

  local prefix = string.format('Stratus_%s', component_id)

  _G[ prefix ] = opts.operation
  _G[ string.format('%s_separator', prefix) ] = opts.sep
  _G[ string.format('%s_create_separator', prefix) ] = M.create_separator
  _G[ string.format('%s_detach_on', prefix) ] = opts.detach_on or ''
end


-- TODO: Would this function be useful?
M.remove_highlight_group = function (group)
end


--
-- @desc:
--   Function that returns a unique ID for nvim-stratus components.
-- @return: int
--   A unique integer to identify distinct nvim-stratus components.
--
M.get_component_id = function ()
  _G['Stratus_Component_ID'] = _G['Stratus_Component_ID'] or 0
  _G['Stratus_Component_ID'] = _G['Stratus_Component_ID'] + 1
  return _G['Stratus_Component_ID']
end


--
-- @desc:
--   Function that encapsulates its input in Unicode space characters.
--   A Unicode space is required as items within the statusline surrounded by
--   %{} require two leading spaces to insert a singular space - a Unicode
--   space character negates the need for this.
-- @return: string
--   The input encapsulated by Unicode space characters.
--
M.surround_whitespace = function (operation)
  local space = ' ' -- This is a Unicode Space!
  return space .. operation .. space
end

return M
