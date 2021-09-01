vim.cmd [[autocmd ColorScheme * highlight NormalFloat guibg=#1f2335]]
vim.cmd [[autocmd ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

-- LSP settings
local border = {
      {"🭽", "FloatBorder"},
      {"▔", "FloatBorder"},
      {"🭾", "FloatBorder"},
      {"▕", "FloatBorder"},
      {"🭿", "FloatBorder"},
      {"▁", "FloatBorder"},
      {"🭼", "FloatBorder"},
      {"▏", "FloatBorder"},
}

local M = {}
M.icons = {
  Class = " ",
  Color = " ",
  Constant = " ",
  Constructor = " ",
  Enum = "了 ",
  EnumMember = " ",
  Field = " ",
  File = " ",
  Folder = " ",
  Function = " ",
  Interface = "ﰮ ",
  Keyword = " ",
  Method = "ƒ ",
  Module = " ",
  Property = " ",
  Snippet = "﬌ ",
  Struct = " ",
  Text = " ",
  Unit = " ",
  Value = " ",
  Variable = " ",
}
function M.setup()
  local kinds = vim.lsp.protocol.CompletionItemKind
  for i, kind in ipairs(kinds) do
    kinds[i] = M.icons[kind] or kind
  end
end

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
})

local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }
for type, icon in pairs(signs) do
  local hl = "LspDiagnosticsSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.lsp.diagnostic.show_line_diagnostics({focusable=false})]]

local function goto_definition(split_cmd)
  local util = vim.lsp.util
  local log = require("vim.lsp.log")
  local api = vim.api

  local handler = function(_, method, result)
    if result == nil or vim.tbl_isempty(result) then
      local _ = log.info() and log.info(method, "No location found")
      return nil
    end

    if split_cmd then
      vim.cmd(split_cmd)
    end

    if vim.tbl_islist(result) then
      util.jump_to_location(result[1])

      if #result > 1 then
        util.set_qflist(util.locations_to_items(result))
        api.nvim_command("copen")
        api.nvim_command("wincmd p")
      end
    else
      util.jump_to_location(result)
    end
  end

  return handler
end
vim.lsp.handlers["textDocument/definition"] = goto_definition('split')

vim.lsp.handlers["textDocument/publishDiagnostics"] =
function(_, _, params, client_id, _)
    local config = { -- your config
      underline = true,
      virtual_text = {
        prefix = "■ ",
        spacing = 4,
      },
      signs = true,
      update_in_insert = false,
    }
    local uri = params.uri
    local bufnr = vim.uri_to_bufnr(uri)

    if not bufnr then
      return
    end

    local diagnostics = params.diagnostics

    for i, v in ipairs(diagnostics) do
      diagnostics[i].message = string.format("%s: %s", v.source, v.message)
    end

    vim.lsp.diagnostic.save(diagnostics, bufnr, client_id)

    if not vim.api.nvim_buf_is_loaded(bufnr) then
      return
    end

    vim.lsp.diagnostic.display(diagnostics, bufnr, client_id, config)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.documentationFormat = { 'markdown', 'plaintext' }
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = { 'documentation', 'detail', 'additionalTextEdits', },
}

-- luasnip setup
-- local luasnip = require 'luasnip'
-- -- nvim-cmp setup
-- local cmp = require 'cmp'
-- cmp.setup {
--     completion = { completeopt = "menuone,noselect,noinsert", },
--     -- snippet = { expand = function(args) require('luasnip').lsp_expand(args.body) end, },
--     mapping = {
--         ['<C-p>'] = cmp.mapping.select_prev_item(),
--         ['<C-n>'] = cmp.mapping.select_next_item(),
--         ['<C-d>'] = cmp.mapping.scroll_docs(-4),
--         ['<C-f>'] = cmp.mapping.scroll_docs(4),
--         ['<C-Space>'] = cmp.mapping.complete(),
--         ['<C-e>'] = cmp.mapping.close(),
--         ['<CR>'] = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = true, },
--         ['<Tab>'] = function(fallback)
--           if vim.fn.pumvisible() == 1 then
--               vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n')
--           -- elseif luasnip.expand_or_jumpable() then
--           --     vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
--           else fallback()
--           end
--         end,
--         ['<S-Tab>'] = function(fallback)
--           if vim.fn.pumvisible() == 1 then
--               vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-p>', true, true, true), 'n')
--           -- elseif luasnip.jumpable(-1) then
--           --     vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
--           else fallback()
--           end
--         end,
--     },
--     sources = {
--         { name = 'nvim_lsp' },
--         -- { name = 'luasnip' },
--     },
-- }

local on_attach = function(client, bufnr)
  vim.lsp.handlers["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = border})
  vim.lsp.handlers["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = border})
end

local on_attach = function(client)
    -- vim.lsp.handlers["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = border})
    -- vim.lsp.handlers["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = border})
    require'completion'.on_attach(client)
end

require 'lspconfig'.rls.setup {
    settings = {
        rust = { unstable_features = true, build_on_save = false, all_features = true }
    },
    on_attach = on_attach,
    capabilities = capabilities
}

require'lspconfig'.clangd.setup { on_attach = on_attach, capabilities = capabilities }
require'lspconfig'.rust_analyzer.setup { on_attach = on_attach, capabilities = capabilities }
