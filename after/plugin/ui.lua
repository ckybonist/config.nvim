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
  vim.cmd.colorscheme('solarized8_flat')
end

-- Transparent background
local transparent_deny_set = Set({
  'solarized8',
  'solarized8_flat',
  'solarized8_high',
  'solarized8_low',
})
local current_colorscheme = vim.g.colors_name
if not(transparent_deny_set[current_colorscheme]) then
  local groups = {
    'Normal',
    'NormalFloat',
    'FloatBorder',
    'NormalNC',
  }
  for _, group in ipairs(groups) do
    vim.api.nvim_set_hl(0, group, { bg = 'none' })
  end
end

vim.api.nvim_set_hl(0, 'FloatBorder', { fg = '#B04BD0' })

