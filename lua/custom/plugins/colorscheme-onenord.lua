return {
  'rmehri01/onenord.nvim',
  config = function()
    require('onenord').setup({
      disable = { background = true },
    })
  end,
}
