return {
  'nvim-tree/nvim-tree.lua',
  config = function()
    require('nvim-tree').setup({
      -- sort_by = "case_sensitive",
      view = {
        adaptive_size = true,
        mappings = {
          list = { { key = 'u', action = 'dir_up' } },
        },
        float = { enable = false },
      },
      renderer = { group_empty = true },
      filters = { dotfiles = true },
      respect_buf_cwd = true,
      sync_root_with_cwd = true,
      update_focused_file = { enable = true, update_root = true },
    })

    vim.keymap.set('n', '<C-\\>', '<cmd>NvimTreeToggle<CR>', KeymapOpts({ desc = 'Toggle Filetree' }))
    vim.keymap.set('n', '`f', '<cmd>NvimTreeFocus<CR>', KeymapOpts({ desc = 'Focus on Filetree' }))
  end,
}
