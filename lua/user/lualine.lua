  local colors = {
    red = '#fb4934',
    grey = '#d5c4a1',
    black = '#282828',
    white = '#fbf1c7',
    light_green = '#b8bb26',
    orange = '#fe8019',
    green = '#98971a',
    purple = '#b16286',
    yellow = '#d79921',
    blue = '#076678',
  }

  local theme = {
    normal = {
      a = { fg = colors.white, bg = colors.black },
      b = { fg = colors.white, bg = colors.black },
      c = { fg = colors.black, bg = colors.grey },
      z = { fg = colors.grey, bg = colors.blue },
    },
    insert = { a = { fg = colors.black, bg = colors.light_green } },
    visual = { a = { fg = colors.black, bg = colors.orange } },
    replace = { a = { fg = colors.black, bg = colors.green } },
    inactive = {
      a = { fg = colors.grey, bg = colors.black },
      b = { fg = colors.grey, bg = colors.black },
      c = { fg = colors.grey, bg = colors.black },
      z = { fg = colors.grey, bg = colors.black },
    },
  }

  local empty = require('lualine.component'):extend()
  function empty:draw(default_highlight)
    self.status = ''
    self.applied_separator = ''
    self:apply_highlights(default_highlight)
    self:apply_section_separators()
    return self.status
  end

  -- Put proper separators and gaps between components in sections
  local function process_sections(sections)
    for name, section in pairs(sections) do
      local left = name:sub(9, 10) < 'x'
      for pos = 1, name ~= 'lualine_z' and #section or #section - 1 do
        table.insert(section, pos * 2, { empty, color = { fg = colors.grey, bg = colors.grey } })
      end
      for id, comp in ipairs(section) do
        if type(comp) ~= 'table' then
          comp = { comp }
          section[id] = comp
        end
        comp.separator = left and { right = '' } or { left = '' }
      end
    end
    return sections
  end

  local function search_result()
    if vim.v.hlsearch == 0 then
      return ''
    end
    local last_search = vim.fn.getreg('/')
    if not last_search or last_search == '' then
      return ''
    end
    local searchcount = vim.fn.searchcount { maxcount = 9999 }
    return last_search .. '(' .. searchcount.current .. '/' .. searchcount.total .. ')'
  end

  local function modified()
    if vim.bo.modified then
      return '+'
    elseif vim.bo.modifiable == false or vim.bo.readonly == true then
      return '-'
    end
    return ''
  end
  require("lualine").setup({
    options = {
      theme = theme,
      component_separators = '',
      section_separators = { left = '', right = '' },
    },
    sections = process_sections {
      lualine_a = { 'mode' },
      lualine_b = {
        {'branch', color = { bg = colors.yellow, fg = colors.black }},
        {'diff', color = { bg = colors.black }},
        {
          'diagnostics',
          source = { 'nvim' },
          sections = { 'error' },
          diagnostics_color = { error = { bg = colors.red, fg = colors.white } },
        },
        {
          'diagnostics',
          source = { 'nvim' },
          sections = { 'warn' },
          diagnostics_color = { warn = { bg = colors.orange, fg = colors.white } },
        },
        { 'filename', file_status = false, path = 1, color = { bg = colors.purple, fg = colors.black } },
        { modified, color = { bg = colors.red } },
        {
          '%w',
          cond = function()
            return vim.wo.previewwindow
          end,
        },
        {
          '%r',
          cond = function()
            return vim.bo.readonly
          end,
        },
        {
          '%q',
          cond = function()
            return vim.bo.buftype == 'quickfix'
          end,
        },
      },
      lualine_c = {},
      lualine_x = {},
      lualine_y = { {search_result, color = {bg = colors.yellow, fg = colors.black}}, 'filetype' },
      lualine_z = { 'progress', 'location' },
    },
    inactive_sections = {
      lualine_c = { {'%f %y %m', color = { bg = colors.black, fg = colors.grey}} },
      lualine_x = {{color = { bg = colors.black, fg = colors.grey}}},
    },
  })
