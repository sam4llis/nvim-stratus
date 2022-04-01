local M = {}

local utils = require('nvim-stratus.utils')

M.attach_component = function (opts)

  local component_id = utils.get_component_id()
  utils.create_highlight_group(component_id, opts.style)
  utils.create_component_globals(component_id, opts)

  if opts.position == 'left' then
  end

  if update_on ~= nil then
    vim.api.nvim_create_augroup('Stratus', { clear = true })
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

  local prefix = string.format('_G.Stratus_%s', component_id)
  local separator = string.format('luaeval("%s_separator")', prefix)
  local operation = string.format('luaeval("%s()")', prefix)
  local component_separator = '%{v:lua.' .. prefix .. '_create_separator(' .. separator .. ',' .. operation .. ')}'

  c1 = '%#' .. component_id .. '_l#' .. component_separator
  c2 = '%#' .. component_id .. '#' .. '%{v:lua.Stratus_' .. component_id .. '()}'
  c3 = '%#' .. component_id .. '_r#' .. component_separator

  require('nvim-stratus').compile({c1, c2, c3})
end

M.detach_component = function ()
end

return M
