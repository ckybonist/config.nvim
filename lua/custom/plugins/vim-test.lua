return {
  'vim-test/vim-test',
  config = function()
    vim.g['test#preserve_screen'] = 1
    vim.g['test#neovim#start_normal'] = 1
    vim.g['test#strategy'] = 'toggleterm'
    vim.g['test#ruby#rspec#executable'] = 'rspec'
    vim.g['test#neovim#term_position'] = 'bot 25'
  end,
}
