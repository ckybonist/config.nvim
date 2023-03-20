return {
  'ThePrimeagen/harpoon',
  config = function()
    local mark = require('harpoon.mark')
    local ui = require('harpoon.ui')

    vim.keymap.set('n', '<leader>ha', function()
      mark.add_file()
    end, vim.tbl_extend('keep', KeymapOpts({ desc = '[H]arpoon [A]dd file' })))

    vim.keymap.set('n', '<C-e>', function()
      ui.toggle_quick_menu()
    end, vim.tbl_extend('keep', KeymapOpts({ desc = 'Harpoon: toggle quick menu' })))

    vim.keymap.set('n', '<C-h>', function()
      ui.nav_file(1)
    end, vim.tbl_extend('keep', KeymapOpts({ desc = 'Harpoon: navigate to entry 1' })))

    vim.keymap.set('n', '<C-t>', function()
      ui.nav_file(2)
    end, vim.tbl_extend('keep', KeymapOpts({ desc = 'Harpoon: navigate to entry 2' })))

    vim.keymap.set('n', '<C-n>', function()
      ui.nav_file(3)
    end, vim.tbl_extend('keep', KeymapOpts({ desc = 'Harpoon: navigate to entry 3' })))

    vim.keymap.set('n', '<C-s>', function()
      ui.nav_file(4)
    end, vim.tbl_extend('keep', KeymapOpts({ desc = 'Harpoon: navigate to entry 4' })))
  end,
}
