local M = setmetatable({
  ['python'] = '',
  ['typescript'] = '',
  ['html'] =  '',
  ['vim'] = '',
  ['scss'] = '',
  ['css'] = '',
  ['javascript'] = '',
  ['javascriptreact'] = '',
  ['rust'] = '',
  ['ruby'] = '',
  ['cpp'] = '',
  ['c'] = '',
  ['go'] = '',
  ['lua'] = '',
}, {
  __index = function()
    return ''
  end
})

return M
