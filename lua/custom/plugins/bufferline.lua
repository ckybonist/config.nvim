return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('bufferline').setup({
      options = {
        hover = {
          enabled = true,
          delay = 200,
          reveal = { 'close' },
        },
        buffer_close_icon = '',
        close_icon = '',
        indicator = {
          icon = '▎', -- this should be omitted if indicator style is not 'icon'
          style = 'icon',
        },
        separator_style = 'thick',
        show_tab_indicators = true,
      },
      highlights = {
        buffer_selected = {
          -- fg = '#cb4b16',
          -- sp = '#cb4b16',
          bold = true,
        },
      },
    })

    vim.keymap.set('n', '\\', ':BufferLinePick<CR>', KeymapOpts({ desc = '[B]uffer [P]ick' }))
  end,
}
