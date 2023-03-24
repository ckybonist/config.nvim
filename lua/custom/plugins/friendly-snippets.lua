return {
  'rafamadriz/friendly-snippets',
  config = function()
    require('luasnip').filetype_extend('ruby', { 'rails' })
  end,
}
