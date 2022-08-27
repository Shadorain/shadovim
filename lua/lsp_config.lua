--[[ ========================================================================
"  .____                       _________                _____.__           .__                
"  |    |      ____________    \_   ___ \  ____   _____/ ____\__| ____     |  |  __ _______   
"  |    |     /  ___/\____ \   /    \  \/ /  _ \ /    \   __\|  |/ ___\    |  | |  |  \__  \  
"  |    |___  \___ \ |  |_> >  \     \___(  <_> )   |  \  |  |  / /_/  >   |  |_|  |  // __ \_
"  |_______ \/____  >|   __/____\______  /\____/|___|  /__|  |__\___  / /\ |____/____/(____  /
"          \/     \/ |__| /_____/      \/            \/        /_____/  \/                 \/
" =========================================================================== ]]
-- Styling {{{
local border = {
    {"┌", "FloatBorder"},
    {"─", "FloatBorder"},
    {"┐", "FloatBorder"},
    {"│", "FloatBorder"},
    {"┘", "FloatBorder"},
    {"─", "FloatBorder"},
    {"└", "FloatBorder"},
    {"│", "FloatBorder"},
}
-- {"╭", "FloatBorder"},
-- {"─", "FloatBorder"},
-- {"╮", "FloatBorder"},
-- {"│", "FloatBorder"},
-- {"╯", "FloatBorder"},
-- {"─", "FloatBorder"},
-- {"╰", "FloatBorder"},
-- {"│", "FloatBorder"},
-- }}}
-- Sign defining {{{
-- local signs = { Error = "× ", Warning = " ", Hint = " ", Information = " " }
-- local signs = { Error = "⮀ ", Warning = "", Hint = "", Information = "🞧 " }
local signs = { Error = " ", Warn = "", Hint = "", Info = "🞧 " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
-- }}}
-- Diagnostics {{{
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = false,
})
-- }}}
vim.cmd ('autocmd CursorHold * lua vim.diagnostic.open_float({border="single", focusable=false, max_width = 60})')
-- Capabilities {{{
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
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

--- Nvim-UFO
-- capabilities.textDocument.foldingRange = {
--     dynamicRegistration = false,
--     lineFoldingOnly = true
-- }
-- }}}
-- On attach {{{
local function attach_navic(client, bufnr)
  vim.g.navic_silence = true
  local status_ok, navic = pcall(require, "nvim-navic")
  if not status_ok then
    return
  end
  navic.attach(client, bufnr)
end

vim.lsp.handlers["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, { border = border, focusable = false, max_width = 80, max_height = 20 })
vim.lsp.handlers["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, { border = border, focusable = false, max_width = 80, max_height = 20 })

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    attach_navic(client, bufnr)
  
    -- LSP Mappings
    local opts = { noremap = true, silent = true }
    buf_set_keymap('n', 'gD',        '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd',        '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gi',        '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', 'gr',        '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '[d',        '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d',        '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    -- buf_set_keymap('n', 'K',         '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    -- buf_set_keymap('n', '<C-k>',     '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>cl', '<cmd>lua vim.lsp.codelens.run()<CR>', opts)
    buf_set_keymap('n', '<space>gr', '<cmd>lua require("mod").lsp_references()<CR>', opts)
    buf_set_keymap('n', '<space>gi', '<cmd>lua require("mod").lsp_implementations()<CR>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>co', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts) -- Until i can get a nicer picker ;(
    -- buf_set_keymap('n', '<space>ca', '<cmd>lua require("mod").code_actions()<CR>', opts)
    buf_set_keymap('v', '<space>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
    buf_set_keymap('n', '<space>D',  '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>e',  '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    buf_set_keymap('n', '<space>q',  '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
    buf_set_keymap('n', '<space>f',  '<cmd>lua vim.lsp.buf.format({ async = true })<CR>', opts)

    -- local bufnr = vim.api.nvim_get_current_buf()
    -- require('ufo').setFoldVirtTextHandler(bufnr, require('mod').fold_handler)

    -- Updated to support Nvim-UFO
    vim.keymap.set('n', 'K', function()
        local winid = require('ufo').peekFoldedLinesUnderCursor()
        if not winid then
            vim.lsp.buf.hover()
        end
    end)

    require("lsp_signature").on_attach({
        bind = true,
        floating_window = true,
        floating_window_above_cur_line = true,
        fix_pos = false,
        hint_enable = true,
        hint_prefix = " ",
        hint_scheme = "String",
        use_lspsaga = false,
        hi_parameter = "ModeMsg",
        max_height = 12,
        max_width = 120,
        transparency = 80,
        handler_opts = { border = "single" },
        trigger_on_newline = false,
        debug = false,
        padding = '',
        shadow_blend = 36,
        shadow_guibg = 'Black',
        timer_interval = 200,
        -- toggle_key = '<M-f>',
    })
    require("lsp_signature").setup()
    -- Lspkind {{{
    require('lspkind').init({
      -- with_text = false,
      mode = "symbol_text",
      preset = 'default',
      symbol_map = {
        Text = "",
        Method = "",
        Function = "",
        Constructor = "",
        Field = "ﰠ",
        Variable = "",
        Class = "ﴯ",
        Interface = "",
        Module = "",
        Property = "ﰠ",
        Unit = "塞",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "פּ",
        Event = "",
        Operator = "",
        TypeParameter = ""
      },
    })
    -- }}}
    local status_ok, illuminate = pcall(require, "illuminate")
      if not status_ok then
        return
      end
    illuminate.on_attach(client)
    -- if client.server_capabilities.documentHighlightProvider then
        
        -- vim.api.nvim_exec(
        -- [[
        --     hi LspReferenceRead  gui=bold guibg=#1b1b29 blend=10
        --     hi LspReferenceText  gui=bold guibg=#1b1b29 blend=10
        --     hi LspReferenceWrite gui=bold guibg=#1b1b29 blend=10
        --     augroup lsp_document_highlight
        --     autocmd! * <buffer>
        --     autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        --     autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        --     augroup END
        -- ]], false)
    -- end
end
-- }}}
-- Lsp Init {{{
--- Rust-tools {{{
local rs_opts = {
  tools = {
    on_initialized = function()
      vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "CursorHold", "InsertLeave" }, {
        pattern = { "*.rs" },
        callback = function()
          vim.lsp.codelens.refresh()
        end,
      })
    end,
    autoSetHints = true,
    -- hover_with_actions = true,
    parent_module = true,
    join_lines = true,
    runnables = { use_telescope = true },
    debuggables = { use_telescope = true },
    inlay_hints = {
      only_current_line = false,
      only_current_line_autocmd = "CursorHold",
      show_parameter_hints = true,
      parameter_hints_prefix = "❰ ",
      other_hints_prefix = "≣ ",
      max_len_align = false,
      max_len_align_padding = 1,
      right_align = false,
      right_align_padding = 7,
      highlight = "Comment",
    },
    hover_actions = {
      auto_focus = false,
      border = {
        {"╭", "FloatBorder"}, {"─", "FloatBorder"},
        {"╮", "FloatBorder"}, {"│", "FloatBorder"},
        {"╯", "FloatBorder"}, {"─", "FloatBorder"},
        {"╰", "FloatBorder"}, {"│", "FloatBorder"}
      },
      max_width = 80,
      max_height = 20,
    },
  },
  server = {
    -- on_attach = function(_, bufnr)
    --   vim.keymap.set("n", "<leader>ca", require('rust-tools').hover_actions.hover_actions, { buffer = bufnr })
    --   vim.keymap.set("n", "<Leader>cg", require('rust-tools').code_action_group.code_action_group, { buffer = bufnr })
    -- end,
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      ["rust-analyzer"] = {
        lens = { enable = true },
        checkOnSave = { command = "clippy" },
      },
    },
  },
}
require('rust-tools').setup(rs_opts)
--- }}}
local nvim_lsp = require('lspconfig')
local servers = { 'clangd', 'taplo' }
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
        flags = { debounce_text_changes = 150, }
    }
end
-- }}}
-- [[ ----------------------------------------------------------------------- ]]
