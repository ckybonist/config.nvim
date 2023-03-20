return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    's1n7ax/nvim-window-picker',
  },
  config = function()
    -- Unless you are still migrating, remove the deprecated commands from v1.x
    vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

    local picker = require('window-picker')
    picker.setup({
      autoselect_one = true,
      include_current = false,
      filter_rules = {
        -- filter using buffer options
        bo = {
          -- if the file type is one of following, the window will be ignored
          filetype = { 'neo-tree', 'neo-tree-popup', 'notify' },

          -- if the buffer type is one of following, the window will be ignored
          buftype = { 'terminal', 'quickfix' },
        },
      },
      other_win_hl_color = '#e35e4f',
    })
    vim.keymap.set('n', '<leader>p', function()
      local picked_window_id = picker.pick_window() or vim.api.nvim_get_current_win()
      vim.api.nvim_set_current_win(picked_window_id)
    end, { desc = '[P]ick a window' })

    require('neo-tree').setup({
      window = {
        mappings = {
          ['Y'] = function(state)
            -- Copy absolute path
            local node = state.tree:get_node()
            local content = node.path
            vim.fn.setreg('"', content)
            vim.fn.setreg('1', content)
            vim.fn.setreg('+', content)
          end,

          ['<leader>y'] = function(state)
            -- Copy relative path
            local node = state.tree:get_node()
            local content = node.path:gsub(state.path, ''):sub(2)
            vim.fn.setreg('"', content)
            vim.fn.setreg('1', content)
            vim.fn.setreg('+', content)
          end,
        },
      },
    })

    vim.cmd([[nnoremap \ :NeoTreeRevealToggle<cr>]])
  end,
}
