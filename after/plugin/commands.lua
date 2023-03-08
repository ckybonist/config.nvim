local create_command = vim.api.nvim_create_user_command
local telescope_builtin = require('telescope.builtin')

create_command('Gbackend', function()
  telescope_builtin['live_grep']({
    search_dirs = { 'app' },
    type_filter = 'backend',
  })
end, {})

create_command('Gjs', function()
  telescope_builtin['live_grep']({
    type_filter = 'ecmascript',
  })
end, {})

create_command('GRSpec', function()
  telescope_builtin['live_grep']({
    search_dirs = { 'spec' },
    type_filter = 'backend',
  })
end, {})

create_command('ReloadConfig', function()
  local hls_status = vim.v.hlsearch
  for name, _ in pairs(package.loaded) do
    if name:match('^accky') then
      package.loaded[name] = nil
    end
  end

  dofile(vim.env.MYVIMRC)
  if hls_status == 0 then
    vim.opt.hlsearch = false
  end
end, {})

create_command('LspDefinition', function()
  vim.lsp.buf.definition()
end, {})
