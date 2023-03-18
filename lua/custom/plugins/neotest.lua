return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'antoinemadec/FixCursorHold.nvim',
    'olimorris/neotest-rspec',
  },
  config = function()
    local neotest = require('neotest')
    neotest.setup({
      adapters = {
        require('neotest-rspec')({
          rspec_cmd = function()
            return vim.tbl_flatten({
              'rspec',
            })
          end,
        }),
      },
      -- Temporarily remove status icons as the status detection is buggy...
      icons = {
        passed = '',
        failed = '',
        running = '🏃',
        skipped = '⚠️',
        unknown = '',
      },
    })

    vim.keymap.set('n', '<leader>tf', function() neotest.run.run(vim.fn.expand("%")) end,
      { desc = '[T]est [F]ile', noremap = true, silent = true })
    vim.keymap.set('n', '<leader>tn', neotest.run.run, { desc = '[T]est [N]earest', noremap = true, silent = true })
    vim.keymap.set('n', '<leader>ts', neotest.summary.toggle,
      { desc = '[T]est [S]ummary', noremap = true, silent = true })
    vim.keymap.set('n', '<leader>to', function() neotest.output.open({ enter = true }) end,
      { desc = '[T]est [O]utput window', noremap = true, silent = true })
    vim.keymap.set('n', '[t', neotest.jump.prev, { desc = 'Prev[ [T]est', noremap = true, silent = true })
    vim.keymap.set('n', ']t', neotest.jump.next, { desc = 'Next] [T]est', noremap = true, silent = true })
    vim.keymap.set('n', '[tf', function()
      neotest.jump.prev({ status = 'failed' })
    end, { desc = 'Prev[ [T]est which is [F]ailed', noremap = true, silent = true })
    vim.keymap.set('n', ']tf', function()
      neotest.jump.next({ status = 'failed' })
    end, { desc = 'Next] [T]est which is [F]ailed', noremap = true, silent = true })
  end,
}
