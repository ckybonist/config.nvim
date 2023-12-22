local create_command = vim.api.nvim_create_user_command
local ts = require('telescope.builtin')
local base_opts = { layout_config = { width = 140 } }

-- type_filter's type defined in ripgreprc
create_command('Gbackend', function()
  local opts = vim.tbl_extend(
    'keep',
    base_opts,
    { search_dirs = { 'app', 'config', 'lib', 'modules', 'spec' }, type_filter = 'backendRoR' }
  )
  ts.live_grep(require('telescope.themes').get_dropdown(opts))
end, {})
vim.keymap.set('n', '<leader>fb', vim.cmd.Gbackend, KeymapOpts({ desc = '[F]ind [B]ackend code' }))

create_command('Grspec', function()
  local opts = vim.tbl_extend('keep', base_opts, { search_dirs = { 'spec' }, type_filter = 'backendRoR' })
  ts.live_grep(require('telescope.themes').get_dropdown(opts))
end, {})

create_command('Gjs', function()
  local opts = vim.tbl_extend('keep', base_opts, { type_filter = 'js' })
  ts.live_grep(require('telescope.themes').get_dropdown(opts))
end, {})

create_command('Gstyle', function()
  local opts = vim.tbl_extend('keep', base_opts, { type_filter = 'stylesheet' })
  ts.live_grep(require('telescope.themes').get_dropdown(opts))
end, {})

create_command('NLFormat', function()
  vim.lsp.buf.format({ async = true })
end, { desc = '[null-ls] Formatting' })

create_command('NLCodeAction', function()
  vim.lsp.buf.code_action()
end, { desc = '[null-ls] Code Actions' })
