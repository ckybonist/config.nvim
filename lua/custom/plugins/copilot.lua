return {
  'github/copilot.vim',
  config = function()
    vim.g.copilot_node_command = '~/.local/share/rtx/installs/node/20.2.0/bin/node'
    -- Prevent keymap conflicts
    vim.g.copilot_no_tab_map = true
    vim.cmd([[
      imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
    ]])
  end,
}
