# nvim-stratus

A Neovim plugin to attach customisable components to the statusline. Written in
Lua.

## Installation

You can install this plugin with your favourite package manager. As an example,
for [vim-plug](https://github.com/junegunn/vim-plug):

```
Plug 'sam4llis/nvim-stratus'
```


## Usage

### Stratus Configuration

Stratus allows the user to split the statusline into multiple components and
comes with a multitude of built-in components for easy configuration. To add
stratus components to your statusline, you can call Stratus' `setup()` function.
This setup function requires a `components` table, which tells Stratus which
components should be added to the statusline.

My default configuration for Stratus uses colours defined by the
[Catppuccin](https://github.com/catppuccin/nvim) colorscheme.

```
local cp = require('catppuccin.core.color_palette')
local separators = require('nvim-stratus.ui.separators')
local builtins = require('nvim-stratus.builtins')

local components = {
  {
    operation = function ()
      return builtins.current_mode()
    end,
    style = {
      fg = cp.black2,
      bg = cp.white,
      gui= 'bold',
    },
    separator = separators.arrow,
  },
  {
    operation = function ()
      return builtins.git_branch()
    end,
    style = {
      fg = cp.black2,
      bg = cp.white,
      gui= 'bold',
    },
    separator = separators.arrow,
  },
  {
    operation = function ()
      return builtins.filename()
    end,
    style = {
      fg = cp.black2,
      bg = cp.flamingo,
      gui= 'bold',
    },
    separator = separators.arrow,
  },
  {
    operation = function ()
      return builtins.modified()
    end,
    style = {
      fg = cp.black2,
      bg = cp.flamingo,
      gui= 'bold',
    },
    separator = separators.arrow,
    detach_on = vim.bo.modified,
  },
}

require('nvim-stratus').setup(components)
```

This creates a statusline that looks like the following:

![An example nvim-stratus statusline.](https://github.com/sam4llis/nvim-stratus/blob/main/img/nvim-stratus-default-statusline.png)

