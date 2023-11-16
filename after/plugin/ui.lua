local set = vim.opt

set.lazyredraw = true
set.guifont = 'FuraCode Nerd Font Mono:h14'

if Exists('&termguicolors') and Exists('&winblend') then
  vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = 1

  set.termguicolors = true
  set.winblend = 0
  set.wildoptions = 'pum'
  set.pumblend = 5
  set.background = 'dark'
  -- substrata
  -- kanagawa
  -- github_dark_high_contrast
  -- vim.cmd.colorscheme('kanagawa')
  vim.cmd.colorscheme('onenord')
end

vim.api.nvim_set_hl(0, 'FloatBorder', { fg = '#B04BD0' })
