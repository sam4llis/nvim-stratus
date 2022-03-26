-- TODO: Create components for word count, spell=on, etc.

-- TODO: Check whether we actually require Neovim 0.7.0.
if vim.fn.has('nvim-0.7.0') ~= 1 then
  vim.api.nvim_err_writeln("The plugin 'nvim-stratus' requires Neovim 0.7.0.")
  vim.api.nvim_err_writeln("Please update your Neovim.")
  return
end

local M = {}

local utils = require('nvim-stratus.utils')
local core = require('nvim-stratus.core')
local separators = require('nvim-stratus.ui.separators')
local cp = require('catppuccin.core.color_palette') -- TODO: Move this outside of the nvim-stratus plugin.
local builtins = require('nvim-stratus.builtins')

M.setup = function ()
  vim.opt.statusline = ''

  -- core.attach_component({
  --   name = 'Mode',
  --   operation = "require('nvim-stratus.builtins').current_mode()",
  --   style = {
  --     fg = cp.black2,
  --     bg = cp.teal,
  --     gui = 'bold',
  --   },
  --   separator = separators.arrow,
  --   position = 'left',
  -- })

  -- if vim.b.gitsigns_head ~= nil then
  --   core.attach_component({
  --     name = 'GitBranch',
  --     operation = "require('nvim-stratus.builtins').git_branch()",
  --     style = {
  --       fg = cp.black2,
  --       bg = cp.gray2,
  --       gui = 'bold',
  --     },
  --     separator = separators.arrow,
  --     position = 'left',

      -- detach_on = vim.b.gitsigns_head == nil,
    -- })
  -- end

  core.attach_component({
    name = 'FileName',
    operation = function ()
      return require('nvim-stratus.builtins').filename()
    end,
    style = {
      fg = cp.black2,
      bg = cp.gray2,
      gui = 'bold',
    },
    separator = separators.arrow,
    position = 'left',
  })


  -- -- FIXME: moving around diagnostics using [g or ]g causes modification glitch in separators.
  -- -- TODO: Disable on no LSP detected on buffer.
  -- core.attach_component({
  --   name = 'LSP',
  --   operation = "require('nvim-stratus.builtins').get_lsp_diagnostic()",
  --   style = {
  --     fg = cp.black2,
  --     bg = cp.flamingo,
  --     gui = 'bold',
  --
  --   },
  --   separator = separators.arrow,
  --   -- detach_on = vim.bo.modified == false,
  --   position = 'left',
  -- })

  -- core.attach_component({
  --   name = 'Modified',
  --   operation = "require('nvim-stratus.builtins').modified()",
  --   style = {
  --     fg = cp.black2,
  --     bg = cp.yellow,
  --     gui = 'bold',
  --   },
  --   separator = separators.arrow,
  --   detach_on = vim.bo.modified == false,
  --   position = 'left',
  --   update_on = {'BufModifiedSet'},
  -- })

end

M.compile = function (components)
  for _, c in pairs(components) do
    vim.opt.statusline:append(c)
  end
end

return M
