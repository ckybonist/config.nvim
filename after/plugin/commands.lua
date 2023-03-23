local create_command = vim.api.nvim_create_user_command
local telescope_builtin = require('telescope.builtin')

create_command('Gbackend', function()
  telescope_builtin['live_grep']({
    search_dirs = { 'app' },
    type_filter = 'backend',
  })
end, {})
vim.keymap.set('n', '<leader>fb', vim.cmd.Gbackend, KeymapOpts({ desc = '[F]ind [B]ackend code'}))

create_command('Grspec', function()
  telescope_builtin['live_grep']({
    search_dirs = { 'spec' },
    type_filter = 'backend',
  })
end, {})
vim.keymap.set('n', '<leader>fsp', vim.cmd.Grspec, KeymapOpts({ desc = '[F]ind [S][P]ec'}))

create_command('Gjs', function()
  telescope_builtin['live_grep']({
    type_filter = 'ecmascript',
  })
end, {})
vim.keymap.set('n', '<leader>fjs', vim.cmd.Gjs, KeymapOpts({ desc = '[F]ind [J][S] code'}))

create_command('LspDefinition', function()
  vim.lsp.buf.definition()
end, {})
