return {
  'vim-test/vim-test',
  config = function()
    vim.g['test#preserve_screen'] = 1
    vim.g['test#neovim#start_normal'] = 1
    vim.g['test#strategy'] = 'toggleterm'
    vim.g['test#ruby#rspec#executable'] = 'rspec'
    vim.g['test#neovim#term_position'] = 'bot 25'

    vim.keymap.set('n', '<leader>tf', vim.cmd.TestFile, KeymapOpts({ desc = '[T]est [F]ile' }))
    vim.keymap.set('n', '<leader>tr', vim.cmd.TestNearest, KeymapOpts({ desc = '[T]est Nea[R]est' }))
    vim.keymap.set('n', '<leader>tl', vim.cmd.TestLast, KeymapOpts({ desc = '[T]est [L]ast runned example' }))
    vim.keymap.set('n', '<leader>tv', vim.cmd.TestVisit, KeymapOpts({ desc = '[V]isit the last runned [T]est' }))
  end,
}
