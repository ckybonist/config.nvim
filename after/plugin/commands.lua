local create_command = vim.api.nvim_create_user_command
local telescope_builtin = require('telescope.builtin')

-- type_filter's type defined in ripgreprc
create_command('Gbackend', function()
  telescope_builtin['live_grep']({
    search_dirs = { 'app', 'config', 'lib', 'modules', 'spec' },
    type_filter = 'backendRoR',
  })
end, {})
vim.keymap.set('n', '<leader>fb', vim.cmd.Gbackend, KeymapOpts({ desc = '[F]ind [B]ackend code' }))

create_command('Grspec', function()
  telescope_builtin['live_grep']({
    search_dirs = { 'spec' },
    type_filter = 'backendRoR',
  })
end, {})

create_command('Gjs', function()
  telescope_builtin['live_grep']({
    type_filter = 'ecmascript',
  })
end, {})
vim.keymap.set('n', '<leader>fjs', vim.cmd.Gjs, KeymapOpts({ desc = '[F]ind [J][S] code' }))

create_command('NLFormat', function()
  vim.lsp.buf.format({ async = true })
end, { desc = '[null-ls] Formatting' })

create_command('NLCodeAction', function()
  vim.lsp.buf.code_action()
end, { desc = '[null-ls] Code Actions' })
