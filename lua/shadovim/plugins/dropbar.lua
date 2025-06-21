return {
  'Bekaboo/dropbar.nvim',
  lazy = false,
  dependencies = {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make'
  },
  config = function()
    local dropbar_api = require('dropbar.api')
    vim.keymap.set('n', '<Leader>;', dropbar_api.pick, { desc = 'Pick symbols in winbar' })
    vim.keymap.set('n', '[;', dropbar_api.goto_context_start, { desc = 'Go to start of current context' })
    vim.keymap.set('n', '];', dropbar_api.select_next_context, { desc = 'Select next context' })

    -- Highlights
    vim.api.nvim_set_hl(0, 'DropBarKindFile', { link = 'Directory', bold = true })
    vim.api.nvim_set_hl(0, 'DropBarKindArray', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindBoolean', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindBreakStatement', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindCall', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindCaseStatement', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindClass', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindConstant', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindConstructor', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindContinueStatement', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindDeclaration', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindDelete', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindDoStatement', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindElseStatement', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindElement', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindEnum', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindEnumMember', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindEvent', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindField', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindFolder', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindForStatement', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindFunction', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindH1Marker', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindH2Marker', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindH3Marker', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindH4Marker', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindH5Marker', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindH6Marker', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindIdentifier', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindIfStatement', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindInterface', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindKeyword', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindList', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindMacro', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindMarkdownH1', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindMarkdownH2', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindMarkdownH3', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindMarkdownH4', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindMarkdownH5', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindMarkdownH6', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindMethod', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindModule', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindNamespace', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindNull', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindNumber', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindObject', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindOperator', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindPackage', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindPair', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindProperty', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindReference', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindRepeat', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindRuleSet', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindScope', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindSpecifier', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindStatement', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindString', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindStruct', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindSwitchStatement', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindTerminal', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindType', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindTypeParameter', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindUnit', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindValue', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindVariable', { link = 'Special' })
    vim.api.nvim_set_hl(0, 'DropBarKindWhileStatement', { link = 'Special' })


    require('dropbar').setup({
      bar = {
        sources = function(buf, _)
          local sources = require("dropbar.sources")
          local utils = require("dropbar.utils")
          -- local filename = {
          --   get_symbols = function(buff, win, cursor)
          --     local symbols = sources.path.get_symbols(buff, win, cursor)
          --     return { symbols[#symbols] }
          --   end,
          -- }
          if vim.bo[buf].ft == "markdown" then
            return { sources.markdown }
          end
          if vim.bo[buf].buftype == "terminal" then
            return { sources.terminal }
          end
          return { utils.source.fallback({ sources.lsp, sources.treesitter }) }
        end
      },
      icons = {
        ui = {
          bar = {
            separator = '  ',
            extends = '…',
          }
        }
      }
    })
  end
}
