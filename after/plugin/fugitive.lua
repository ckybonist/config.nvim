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
  '<leader>gb',
  gbrowse_sha_under_cursor,
  KeymapOpts({ desc = 'Git: Browse with Revision under Cursor' })
)
