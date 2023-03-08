return {
  'SmiteshP/nvim-navic',
  config = function()
    local navic = require('nvim-navic')

    -- Customized config
    navic.setup({
      disable_icons = false, -- Setting it to true will disable all icons
      -- separator = ' > ',
      -- limit for amount of context shown
      -- 0 means no limit
      depth = 0,
      -- indicator used when context hits depth limit
      depth_limit_indicator = '..',
    })
  end,
}
