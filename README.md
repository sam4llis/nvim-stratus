# nvim-stratus

A Neovim plugin to attach customisable components to the statusline. Written in
Lua.

![An example nvim-stratus statusline.](https://github.com/sam4llis/nvim-stratus/blob/main/img/nvim-stratus-main-image.png)

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
    operation = builtins.current_mode,
    style = {
      fg = cp.black2,
      bg = cp.gray2,
      gui= 'bold',
    },
    separator = separators.arrow,
  },
  {
    operation = builtins.git_branch,
    style = {
      fg = cp.black2,
      bg = cp.gray2,
      gui= 'bold',
    },
    separator = separators.arrow,
  },
  {
    operation = builtins.filename,
    style = {
      fg = cp.black2,
      bg = cp.pink,
      gui= 'bold',
    },
    separator = separators.arrow,
  },
  {
    operation = builtins.modified,
    style = {
      fg = cp.black2,
      bg = cp.pink,
      gui= 'bold',
    },
    separator = separators.arrow,
  },
  {
    operation = builtins.spell_check,
    style = {
      fg = cp.black2,
      bg = cp.pink,
      gui= 'bold',
    },
    separator = separators.arrow,
    position = 'right',
  },
  {
    operation = builtins.file_directory,
    style = {
      fg = cp.black2,
      bg = cp.pink,
      gui= 'bold',
    },
    separator = separators.arrow,
    position = 'right',
  },
  {
    operation = builtins.percentage_line_count,
    style = {
      fg = cp.black2,
      bg = cp.gray2,
      gui= 'bold',
    },
    separator = separators.arrow,
    position = 'right',
  },
}

require('nvim-stratus').setup(components)
```

This creates a statusline that looks like the following:

![An example nvim-stratus statusline.](https://github.com/sam4llis/nvim-stratus/blob/main/img/nvim-stratus-default-statusline.png)

