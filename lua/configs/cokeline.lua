local hlgroups = require("cokeline.hlgroups")

require('cokeline').setup({
  default_hl = {
    fg = function(buffer)
      return
        buffer.is_focused
        and hlgroups.get_hl_attr('Normal', 'fg')
         or hlgroups.get_hl_attr('Comment', 'fg')
    end,
    bg = hlgroups.get_hl_attr('ColorColumn', 'bg'),
  },

  components = {
    {
      text = ' ',
      bg = hlgroups.get_hl_attr('Normal', 'bg'),
    },
    {
      text = '',
      fg = hlgroups.get_hl_attr('ColorColumn', 'bg'),
      bg = hlgroups.get_hl_attr('Normal', 'bg'),
    },
    {
      text = function(buffer)
        return buffer.devicon.icon
      end,
      fg = function(buffer)
        return buffer.devicon.color
      end,
    },
    {
      text = ' ',
    },
    {
      text = function(buffer) return buffer.filename .. '  ' end,
      style = function(buffer)
        return buffer.is_focused and 'bold' or nil
      end,
    },
    {
      text = '',
      delete_buffer_on_left_click = true,
    },
    {
      text = '',
      fg = hlgroups.get_hl_attr('ColorColumn', 'bg'),
      bg = hlgroups.get_hl_attr('Normal', 'bg'),
    },
  },
})
