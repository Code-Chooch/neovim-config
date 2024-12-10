return {
  'goolord/alpha-nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },

  config = function()
    local alpha = require 'alpha'
    local startify = require 'alpha.themes.dashboard'

    startify.section.header.val = {
      [[                                                      ]],
      [[             _____          _                         ]],
      [[            / ____|        | |                        ]],
      [[           | |     ___   __| | ___                    ]],
      [[           | |    / _ \ / _` |/ _ \                   ]],
      [[           | |___| (_) | (_| |  __/                   ]],
      [[            \_____\___/ \__,_|\___|       _           ]],
      [[            / ____| |                    | |          ]],
      [[           | |    | |__   ___   ___   ___| |__        ]],
      [[           | |    | '_ \ / _ \ / _ \ / __| '_ \       ]],
      [[           | |____| | | | (_) | (_) | (__| | | |      ]],
      [[            \_____|_| |_|\___/ \___/ \___|_| |_|      ]],
      [[                                                      ]],
    }
    startify.section.buttons.val = {}
    -- disable MRU
    -- startify.section.mru.val = { { type = 'padding', val = 0 } }
    -- disable MRU cwd
    -- startify.section.mru_cwd.val = { { type = 'padding', val = 0 } }
    -- disable nvim_web_devicons
    -- startify.nvim_web_devicons.enabled = false
    -- startify.nvim_web_devicons.highlight = false
    -- startify.nvim_web_devicons.highlight = 'Keyword'
    --
    -- startify.section.bottom_buttons.val = {
    --  startify.button('q', '  Quit NVIM', ':qa<CR>'),
    -- }
    -- startify.section.footer = {
    --   { type = 'text', val = 'footer' },
    -- }
    -- ignore filetypes in MRU

    -- startify.mru_opts.ignore = function(path, ext)
    -- return (string.find(path, 'COMMIT_EDITMSG')) or (vim.tbl_contains(default_mru_ignore, ext))
    -- end
    alpha.setup(startify.config)
  end,
}
