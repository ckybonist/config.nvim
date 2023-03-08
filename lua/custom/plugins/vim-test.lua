return {
  'vim-test/vim-test',
  config = function()
    local opts = { silent = true }

    vim.keymap.set('n', '<leader>sl', '<cmd>TestNearest<CR>', opts)
    vim.keymap.set('n', '<leader>sf', '<cmd>TestFile<CR>', opts)
    vim.keymap.set('n', '<leader>su', '<cmd>TestSuite<CR>', opts)
    vim.keymap.set('n', '<leader>sv', '<cmd>TestVisit<CR>', opts)

    vim.g['test#preserve_screen'] = 1
    vim.g['test#neovim#start_normal'] = 1
    vim.g['test#strategy'] = 'toggleterm'
    vim.g['test#ruby#rspec#executable'] = 'rspec'
    vim.g['test#neovim#term_position'] = 'bot 25'
  end
}
