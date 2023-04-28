return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('bufferline').setup({})

    vim.keymap.set('n', '<leader>bp', ':BufferLinePick<CR>', KeymapOpts({ desc = '[B]uffer [P]ick' }))
  end,
}
