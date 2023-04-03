return {
  'akinsho/toggleterm.nvim',
  config = function()
    require('toggleterm').setup({
      open_mapping = '<space>tt',
      direction = 'float',
      float_opts = { direction = 'float', border = 'curved' },
    })
  end,
}
