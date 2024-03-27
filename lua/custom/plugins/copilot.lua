return {
  'github/copilot.vim',
  config = function()
    vim.g.copilot_node_command = os.getenv('COPILOT_NODE_PATH')
    -- Prevent keymap conflicts
    vim.g.copilot_no_tab_map = true
    vim.cmd([[
      imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
    ]])
  end,
}
