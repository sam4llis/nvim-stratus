local M = {}

local utils = require('nvim-stratus.utils')


M.add_separator = function (separator, detach_on)
  if detach_on == true then
    return ''
  else
    return separator
  end
  -- require('nvim-stratus').setup()
end
-- builtins = require('nvim-stratus.builtins')
-- opts = { name = 'TestHighlightGroup' operation = function () OR require('components.git_branch') position = 'left' style = { fg = nil, bg = nil, gui = nil, }, separator = **default global or define here** attach_on = { -- useful for stuff like wordcount etc. filetype = {} -- If this evaluates to true, call M.attach_component() }, detach_on -= nil **e.g., filetype** }
-- TODO: Would be cool to have some OOP here - detach components when they are not being used (e.g., + on file not written).
--


M.attach_component = function (opts)
  opts.detach_on = opts.detach_on or false

  -- NOTE: Maybe don't need a variable for `name` and we can just convert the function call variable to its name variable? Create highlight group for the component.
  local name = opts.name or nil
  local style = opts.style or nil
  utils.create_highlight_group(name, style)

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

  -- FIXME: We probably don't want the user to assign a name to the component,
  -- rather this global variable iteration should just work 'Under The Hood' to
  -- avoid this.
  _G['stratus_' .. opts.name] = opts.operation

  c1 = '%#' .. name .. '_l#' .. separator
  c2 = '%#' .. name .. '#' .. '%{v:lua.stratus_' .. opts.name .. '()}'
  c3 = '%#' .. name .. '_r#' ..  separator

  require('nvim-stratus').compile({c1, c2, c3})

end


M.detach_component = function ()
end

return M
