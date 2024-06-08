local create_command = vim.api.nvim_create_user_command
local ts = require('telescope.builtin')
local base_opts = { layout_config = { width = 140 } }

-- type_filter's type defined in ripgreprc
create_command('Gbackend', function()
  local opts = vim.tbl_extend(
    'keep',
    base_opts,
    { search_dirs = { 'app', 'config', 'lib', 'modules' }, type_filter = 'backendRoR' }
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

create_command('Format', function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ['end'] = { args.line2, end_line:len() },
    }
  end
  require('conform').format({ async = true, lsp_fallback = true, range = range })
end, { range = true })
