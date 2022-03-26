local M = {}

-- FIXME: Function doesn't work if an option is not specified.
-- TODO: Something like if group.pos = 1 or END, remove highlight group accordingly.
-- TODO: Documentation.
M.create_highlight_group = function (group, opts)

  for _, opt in pairs(opts) do
    opts.opt = opts.opt == nil and '' or opts.opt
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
