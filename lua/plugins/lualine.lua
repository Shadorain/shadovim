local colors = {
  black = "#505079", -- '#1b1b29',
  white = "#6c6fB0",
  gray = "#616683", -- '#2e303e',
  normal = "#e95676",
  insert = "#4654b3",
  visual = "#6546e0",
  replace = "#db3567",
  command = "#bd93f9",
}
local theme = {
  normal = {
    a = { bg = "None", fg = colors.normal, gui = "bold" },
    b = { bg = "None", fg = colors.gray },
    c = { bg = "None", fg = colors.black },
  },
  insert = {
    a = { bg = "None", fg = colors.insert, gui = "bold" },
    b = { bg = "None", fg = colors.gray },
    c = { bg = "None", fg = colors.black },
  },
  visual = {
    a = { bg = "None", fg = colors.visual, gui = "bold" },
    b = { bg = "None", fg = colors.gray },
    c = { bg = "None", fg = colors.black },
  },
  replace = {
    a = { bg = "None", fg = colors.replace, gui = "bold" },
    b = { bg = "None", fg = colors.gray },
    c = { bg = "None", fg = colors.black },
  },
  command = {
    a = { bg = "None", fg = colors.command, gui = "bold" },
    b = { bg = "None", fg = colors.gray },
    c = { bg = "None", fg = colors.black },
  },
  inactive = {
    a = { bg = "None", fg = colors.black },
    b = { bg = "None", fg = colors.gray },
    c = { bg = "None", fg = colors.black },
  },
}

local pomo = function()
  local ok, pomo = pcall(require, "pomo")
  if not ok then
    return ""
  end
  local timer = pomo.get_first_to_finish()
  if timer == nil then
    return ""
  end
  return "󰄉 " .. tostring(timer)
end

return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      local sections = {
        lualine_c = { "filename" },
        lualine_x = {
          "overseer",
          {
            "diagnostics",
            icons_enabled = true,
            sources = { "nvim_lsp" },
            sections = { "error", "warn" }, -- 'info', 'hint'
            diagnostics_color = {
              error = "LualineDiagnosticError",
              warn = "LualineDiagnosticWarn",
              info = "LualineDiagnosticInfo",
              hint = "LualineDiagnosticHint",
            },
            colored = true,
            update_in_insert = false,
            always_visible = false,
          },
          pomo,
        },
        lualine_y = {
          {
            "filetype",
            icons_enabled = false,
          },
        },
        lualine_z = { "location" },
      }

      -- Extensions
      local lazy = require("lazy")
      local lazy_ext = {
        sections = {
          lualine_a = {
            function()
              return "󰒲  Lazy"
            end,
          },
          lualine_y = {
            function()
              return "Loaded: " .. lazy.stats().loaded .. "/" .. lazy.stats().count
            end,
          },
          lualine_z = {
            {
              require("lazy.status").updates,
              cond = require("lazy.status").has_updates,
            },
          },
        },
        filetypes = { "lazy" },
      }

      local snacks_picker_ext = {
        sections = {
          lualine_a = {
            function()
              return "  Files"
            end,
          },
          lualine_x = { pomo },
          lualine_y = {},
          lualine_z = {},
        },
        filetypes = { "snacks_picker_list" },
      }
      local snacks_dash_ext = {
        sections = {
          lualine_a = {
            function()
              return "Dashboard"
            end,
          },
          lualine_x = { pomo },
          lualine_y = {},
          lualine_z = {
            function()
              return "  " .. os.date("%R")
            end,
          },
        },
        filetypes = { "snacks_dashboard" },
      }

      local function is_loclist()
        return vim.fn.getloclist(0, { filewinid = 1 }).filewinid ~= 0
      end
      vim.g.qf_disable_statusline = true
      local quickfix_ext = {
        sections = {
          lualine_a = {
            function()
              return is_loclist() and "Location List" or "Quickfix List"
            end,
          },
          lualine_b = {
            function()
              if is_loclist() then
                return vim.fn.getloclist(0, { title = 0 }).title
              end
              return vim.fn.getqflist({ title = 0 }).title
            end,
          },
          lualine_z = { "location" },
        },
        filetypes = { "qf" },
      }

      local blank_ext = {
        sections = {
          lualine_x = { pomo },
        },
        filetypes = { "toggleterm", "trouble", "snacks_terminal" },
      }

      -- Setup
      opts.options = {
        theme = theme,
        section_separators = "",
        component_separators = "",
      }
      opts.sections = sections
      opts.inactive_sections = sections
      opts.disabled_filetypes = {
        statusline = {
          "toggleterm",
          "trouble",
        },
      }
      opts.extensions = { lazy_ext, blank_ext, snacks_picker_ext, snacks_dash_ext, quickfix_ext }
      return opts
    end,
  },
}
