return {
  'zbirenbaum/copilot-cmp',
  event = 'InsertEnter',
  dependencies = { 'zbirenbaum/copilot.lua' },
  config = function()
    vim.defer_fn(function()
      require('copilot').setup({
        copilot_node_command = os.getenv('COPILOT_NODE_PATH'),
      })
      require('copilot_cmp').setup()
    end, 100)
  end,
}
