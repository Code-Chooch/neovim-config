return {
  'nvim-lualine/lualine.nvim',
  config = function()
    local colors, config = require('tokyonight.colors').setup {
      style = 'night',
    }

    local tokyonightTheme = {}

    tokyonightTheme.normal = {
      a = { bg = colors.blue, fg = colors.black },
      b = { bg = colors.fg_gutter, fg = colors.blue },
      c = { bg = colors.bg_statusline, fg = colors.fg_sidebar },
    }

    tokyonightTheme.insert = {
      a = { bg = colors.green, fg = colors.black },
      b = { bg = colors.fg_gutter, fg = colors.green },
    }

    tokyonightTheme.command = {
      a = { bg = colors.yellow, fg = colors.black },
      b = { bg = colors.fg_gutter, fg = colors.yellow },
    }

    tokyonightTheme.visual = {
      a = { bg = colors.magenta, fg = colors.black },
      b = { bg = colors.fg_gutter, fg = colors.magenta },
    }

    tokyonightTheme.replace = {
      a = { bg = colors.red, fg = colors.black },
      b = { bg = colors.fg_gutter, fg = colors.red },
    }

    tokyonightTheme.terminal = {
      a = { bg = colors.green1, fg = colors.black },
      b = { bg = colors.fg_gutter, fg = colors.green1 },
    }

    tokyonightTheme.inactive = {
      a = { bg = colors.bg_statusline, fg = colors.blue },
      b = { bg = colors.bg_statusline, fg = colors.fg_gutter, gui = 'bold' },
      c = { bg = colors.bg_statusline, fg = colors.fg_gutter },
    }

    if config.lualine_bold then
      for _, mode in pairs(tokyonightTheme) do
        mode.a.gui = 'bold'
      end
    end

    local mode = {
      'mode',
      fmt = function(str)
        return ' ' .. str
        -- return ' ' .. str:sub(1, 1) -- displays only the first character of the mode
      end,
    }

    local filename = {
      'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 0, -- 0 = just filename, 1 = relative path, 2 = absolute path
    }

    local hide_in_width = function()
      return vim.fn.winwidth(0) > 100
    end

    local diagnostics = {
      'diagnostics',
      sources = { 'nvim_diagnostic' },
      sections = { 'error', 'warn' },
      symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
      colored = false,
      update_in_insert = false,
      always_visible = false,
      cond = hide_in_width,
    }

    local diff = {
      'diff',
      colored = false,
      symbols = { added = ' ', modified = ' ', removed = ' ' }, -- changes diff symbols
      cond = hide_in_width,
    }

    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'tokyonight', -- Set theme based on environment variable
        -- Some useful glyphs:
        -- https://www.nerdfonts.com/cheat-sheet
        --        
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        disabled_filetypes = { 'alpha', 'neo-tree' },
        always_divide_middle = true,
      },
      sections = {
        lualine_a = { mode },
        lualine_b = { 'branch' },
        lualine_c = { filename },
        lualine_x = { diagnostics, diff, { 'encoding', cond = hide_in_width }, { 'filetype', cond = hide_in_width } },
        lualine_y = { 'location' },
        lualine_z = { 'progress' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { { 'location', padding = 0 } },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = { 'fugitive' },
    }
  end,
}
