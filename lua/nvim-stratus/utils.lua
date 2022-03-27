local M = {}

-- TODO: Something like if group.pos = 1 or END, remove highlight group accordingly.
-- TODO: Documentation.
M.create_highlight_group = function (group, opts)

  local default_opts = {
    fg = '#111111',
    bg = '#FFFFFF',
    gui = 'NONE',
  }

  for k, v in pairs(default_opts) do
    opts[k] = opts[k] or v
  end

  vim.cmd(string.format('highlight %s   guifg=%s guibg=%s gui=%s', group, opts.fg, opts.bg, opts.gui))
  vim.cmd(string.format('highlight %s_l guifg=%s guibg=%s gui=%s', group, opts.fg, opts.bg, opts.gui))
  vim.cmd(string.format('highlight %s_r guifg=%s guibg=%s gui=%s', group, opts.bg, opts.fg, opts.gui))

end


-- TODO: Documentation.
M.remove_highlight_group = function (group)
end


M.ternary = function (cond, T, F)
  if cond then return T else return F end
end

return M
