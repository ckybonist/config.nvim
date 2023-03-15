return {
  'ThePrimeagen/harpoon',
  config = function ()
    local mark = require('harpoon.mark')
    local ui = require('harpoon.ui')
    local term = require('harpoon.term')
    local opts = { noremap = true, silent = true }

    vim.keymap.set('n', '<leader>a', function()
      mark.add_file()
    end, opts)
    vim.keymap.set('n', '<C-e>', function()
      ui.toggle_quick_menu()
    end, opts)

    vim.keymap.set('n', '<C-h>', function()
      ui.nav_file(1)
    end, opts)
    vim.keymap.set('n', '<C-t>', function()
      ui.nav_file(2)
    end, opts)
    vim.keymap.set('n', '<C-n>', function()
      ui.nav_file(3)
    end, opts)
    vim.keymap.set('n', '<C-s>', function()
      ui.nav_file(4)
    end, opts)
    vim.keymap.set('n', '<leader>ta', function()
      term.gotoTerminal(1)
    end, opts)
  end
}
