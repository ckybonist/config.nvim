return {
  'ruifm/gitlinker.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local gitlinker = require('gitlinker')

    gitlinker.setup()

    vim.keymap.set('n', '<leader>gl', function()
      gitlinker.get_buf_range_url('n', { action_callback = require('gitlinker.actions').open_in_browser })
    end, KeymapOpts({ silent = true, desc = '[G]it: Browse GitHub Permalink' }))

    vim.keymap.set('v', '<leader>gl', function()
      gitlinker.get_buf_range_url('v', { action_callback = require('gitlinker.actions').open_in_browser })
    end, KeymapOpts({ silent = true, desc = '[G]it: Browse GitHub Permalink' }))
  end,
}
