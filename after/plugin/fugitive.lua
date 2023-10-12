vim.keymap.set('n', 'gu', '<cmd>diffget //2<CR>', KeymapOpts({ desc = 'Git: Select Left Diff' }))
vim.keymap.set('n', 'gh', '<cmd>diffget //3<CR>', KeymapOpts({ desc = 'Git: Select Right Diff' }))

local gbrowse_sha_under_cursor = function()
  local revision = WordUnderCursor() -- commit SHA
  --[[
  -- dot(.) will append line number to the link
  -- `:%` means the current file in the index
  --]]
  vim.cmd('.' .. 'GBrowse ' .. revision .. ':%')
end
vim.keymap.set(
  'n',
  '<leader>gc',
  gbrowse_sha_under_cursor,
  KeymapOpts({ desc = '[G]it: Browse the Commit Under Cursor' })
)
vim.keymap.set('n', '<C-/>', ':Git blame<CR>', KeymapOpts({ desc = '[G]it: Browse the Commit Under Cursor' }))
