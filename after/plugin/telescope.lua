-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`

function vim.getVisualSelection()
  -- https://github.com/nvim-telescope/telescope.nvim/issues/1923#issuecomment-1122642431
  vim.cmd('noau normal! "vy"')
  local text = vim.fn.getreg('v')
  vim.fn.setreg('v', {})

  text = string.gsub(text, '\n', '')
  if #text > 0 then
    return text
  else
    return ''
  end
end

require('telescope').setup({
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
  extensions = {
    project = {
      base_dirs = {
        '~/bonio/PaGamO',
        '~/bonio/PaymentService',
        '~/bonio/operatings',
        '~/golang/src/github.com/BonioTw/PaGamO-WebSocket-Go',
        '~/.config/nvim',
      },
      -- https://github.com/nvim-telescope/telescope-project.nvim/issues/130
      sync_with_nvim_tree = false,
    },
    file_browser = {
      theme = 'ivy',
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
    },
  },
})

require('telescope-alternate').setup({
  mappings = {
    { 'app/**/*.rb', { { 'spec/[1].rb', 'Test' } } },
    {
      'app/models/(.*).rb',
      {
        { 'db/helpers/**/*[1:pluralize]*.rb', 'Helper' },
        { 'app/controllers/**/*[1:pluralize]_controller.rb', 'Controller' },
        { 'app/graphql/object_type_white_list.rb', 'GQL Types' },
        { 'app/graphql/types/query_type.rb', 'GQL Types' },
        { 'app/graphql/types/[1]*_(type|interface|enum).rb', 'GQL Types' },
        { 'app/graphql/mutations/[1]/*.rb', 'GQL Mutation' },
        { 'app/graphql/mutations/*[1].rb', 'GQL Mutation' },
        { 'app/api/grape_api/abilities/[1].rb', 'Grape API' },
        { 'app/api/grape_api/entities/**/[1].rb', 'Grape API' },
        { 'app/api/grape_api/helpers/[1].rb', 'Grape API' },
        { 'app/api/grape_api/v1/**/[1]*.rb', 'Grape API' },
      },
    },
    {
      'app/services/(.*)/(.*)_service.rb',
      {
        { 'app/models/**/*[1].rb', 'Model' },
        { 'app/controllers/**/*[2:pluralize]_controller.rb', 'Controller' },
        { 'app/graphql/object_type_white_list.rb', 'GQL Types' },
        { 'app/graphql/types/query_type.rb', 'GQL Types' },
        { 'app/graphql/types/*[2]*_type.rb', 'GQL Types' },
        { 'app/graphql/mutations/[2]/*.rb', 'GQL Mutation' },
        { 'app/graphql/mutations/*[2].rb', 'GQL Mutation' },
      },
    },
  },
  presets = { 'rails', 'rspec' },
})
vim.keymap.set('n', '<leader>sa', function()
  vim.cmd('Telescope telescope-alternate alternate_file')
end, KeymapOpts({ desc = '[S]earch [A]lternate files' }))

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'project')
pcall(require('telescope').load_extension, 'file_browser')
pcall(require('telescope').load_extension, 'telescope-alternate')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
    winblend = 10,
    previewer = false,
  }))
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<C-p>', require('telescope.builtin').git_files, { desc = 'Find Git Files' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('v', '<leader>sw', function()
  local text = vim.getVisualSelection()
  require('telescope.builtin').grep_string({ default_text = text })
end, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sp', function()
  require('telescope').extensions.project.project({})
end, { desc = '[S]earch [P]rojects' })
