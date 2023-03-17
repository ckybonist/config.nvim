-- A pretty diagnostics, references, telescope results, quickfix and location list
return {
  'folke/trouble.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('trouble').setup({})
  end,
}
