--[[ ========================================================================
"                     .___   .__
"    _____   ____   __| _/   |  |  __ _______
"   /     \ /  _ \ / __ |    |  | |  |  \__  \
"  |  Y Y  (  <_> ) /_/ |    |  |_|  |  // __ \_
"  |__|_|  /\____/\____ | /\ |____/____/(____  /
"        \/            \/ \/                 \/
" =========================================================================== ]]
local M = {}
-- Telescope {{{
local action_state = require "telescope.actions.state"
local themes = require "telescope.themes"
local builtin = require "telescope.builtin"

function M.file_browser()
  local opts = {
    sorting_strategy = "ascending",
    scroll_strategy = "cycle",
    layout_config = { prompt_position = "bottom" },
    file_ignore_patterns = { "vendor/*" },
    attach_mappings = function(prompt_bufnr, map)
      local current_picker = action_state.get_current_picker(prompt_bufnr)
      local modify_cwd = function(new_cwd)
        current_picker.cwd = new_cwd
        current_picker:refresh(opts.new_finder(new_cwd), { reset_prompt = true })
      end

      map("i", "-", function()
        modify_cwd(current_picker.cwd .. "/..")
      end)
      map("i", "~", function()
        modify_cwd(vim.fn.expand "~")
      end)

      local modify_depth = function(mod)
        return function()
          opts.depth = opts.depth + mod
          local this_picker = action_state.get_current_picker(prompt_bufnr)
          this_picker:refresh(opts.new_finder(current_picker.cwd), { reset_prompt = true })
        end
      end

      map("i", "<M-=>", modify_depth(1))
      map("i", "<M-+>", modify_depth(-1))
      map("n", "yy", function()
        local entry = action_state.get_selected_entry()
        vim.fn.setreg("+", entry.value)
      end)

      return true
    end,
  }
  builtin.file_browser(opts)
end

function M.git_diff()
  local opts = {
    layout_strategy = "horizontal",
    border = true,
    prompt_title = "~ Git Diff ~",
    layout_config = {
      width = 0.99,
      height = 0.99,
      prompt_position = "bottom",
    },
  }
  require("telescope.builtin").git_status(opts)
end

function M.lsp_references()
  local opts = {
    layout_strategy = "vertical",
    layout_config = { prompt_position = "bottom" },
    sorting_strategy = "ascending",
    ignore_filename = false,
  }
  builtin.lsp_references(opts)
end

function M.lsp_implementations()
  local opts = {
    layout_strategy = "vertical",
    layout_config = { prompt_position = "bottom" },
    sorting_strategy = "ascending",
    ignore_filename = false,
  }
  builtin.lsp_implementations(opts)
end
-- }}}
-- UFO {{{
function M.fold_handler(virtText, lnum, endLnum, width, truncate)
    local newVirtText = {}
    local suffix = ('  %d '):format(endLnum - lnum)
    local sufWidth = vim.fn.strdisplaywidth(suffix)
    local targetWidth = width - sufWidth
    local curWidth = 0
    for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
        else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, {chunkText, hlGroup})
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
                suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
            end
            break
        end
        curWidth = curWidth + chunkWidth
    end
    table.insert(newVirtText, {suffix, 'Exception'})
    return newVirtText
end
-- }}}
return M
-- [[ ----------------------------------------------------------------------- ]]
