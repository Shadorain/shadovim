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
  {"╭", "FloatBorder"},  -- {"┌", "FloatBorder"},
  {"─", "FloatBorder"},  -- {"─", "FloatBorder"},
  {"╮", "FloatBorder"},  -- {"┐", "FloatBorder"},
  {"│", "FloatBorder"},  -- {"│", "FloatBorder"},
  {"╯", "FloatBorder"},  -- {"┘", "FloatBorder"},
  {"─", "FloatBorder"},  -- {"─", "FloatBorder"},
  {"╰", "FloatBorder"},  -- {"└", "FloatBorder"},
  {"│", "FloatBorder"},  -- {"│", "FloatBorder"},
}
-- Sign defining {{{
local signs = { Error = " ", Warn = "", Hint = "", Info = "🞧 " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
-- }}}
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
-- vim.diagnostic.config({virtual_lines = { only_current_line = true }})
vim.diagnostic.config({virtual_text = false })
-- Capabilities {{{
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
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
capabilities.offsetEncoding = { "utf-16" }
--- Nvim-UFO
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true
}
--- }}}
-- On attach {{{
local function attach_navic(client, bufnr)
  vim.g.navic_silence = true
  local status_ok, navic = pcall(require, "nvim-navic")
  if not status_ok then
    return
  end
  navic.attach(client, bufnr)
end

vim.lsp.handlers["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded", focusable = true, max_width = 80, max_height = 20 })
vim.lsp.handlers["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded", focusable = true, max_width = 80, max_height = 20 })

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  attach_navic(client, bufnr)
  vim.opt.shiftwidth = 4
  vim.opt.tabstop = 4
  vim.opt.softtabstop = 4
  vim.cmd[[let g:rustfmt_autosave = 1]]

  local l_mappings = {
    ["{"]  = { '<cmd>AerialPrev<cr>', "Prev Func" },
    ["}"]  = { '<cmd>AerialNext<cr>', "Next Func" },
    ["[["] = { '<cmd>AerialPrevUp<cr>', "Prev Up" },
    ["]]"] = { '<cmd>AerialNextUp<cr>', "Next Up" },
    ["[d"] = { '<cmd>lua vim.diagnostic.goto_prev()<cr>',  "Diag Prev" },
    ["]d"] = { '<cmd>lua vim.diagnostic.goto_next()<cr>',  "Diag Next" },
    K = { function()
      local winid = require('ufo').peekFoldedLinesUnderCursor()
      if not winid then
        vim.lsp.buf.hover()
      end end, "Hover" },
    g = {
      d = { '<cmd>Telescope lsp_definitions<CR>',                               "Definition" },
      D = { '<cmd>Telescope lsp_declarations<CR>',                              "Declaration" },
      I = { '<cmd>Telescope lsp_incoming_calls<CR>',                            "Incoming Calls" },
      O = { '<cmd>Telescope lsp_outgoing_calls<CR>',                            "Outgoing Calls" },
      r = { '<cmd>lua require("mod").lsp_references()<CR>',                     "References" },
      i = { '<cmd>lua require("mod").lsp_implementations()<CR>',                "Implementation" },
      E = { '<cmd>lua require("rust-tools").expand_macro.expand_macro()<CR>',   "Expand Macro" },
      P = { '<cmd>lua require("rust-tools").parent_module.parent_module()<CR>', "Parent Module" },
    },
    ["<leader>"] = {
      L = { '<cmd>lua require("lsp_lines").toggle()<CR>',        "LSP Lines" },
      o = { '<cmd>AerialToggle<cr>',                             "Aerial" },
      F = { '<cmd>lua vim.lsp.buf.format({ async = true })<cr>', "Format" },
      D = { '<cmd>lua vim.lsp.buf.type_definition()<cr>',        "Type Def" },
      e = { '<cmd>lua vim.diagnostic.open_float({border="single", focusable=false, max_width = 60})<cr>', "Float" },
      -- q = { '<cmd>lua vim.diagnostic.setloclist()<cr>',          "Loc List" },
      c = {
        a = { '<cmd>lua vim.lsp.buf.code_action()<CR>', "Code Actions" },
        l = { '<cmd>lua vim.lsp.codelens.run()<CR>',    "Code Lens" },
        T = { '<cmd>ClangdSwitchSourceHeader<CR>',      "Clang Toggle Source/Header" },
        t = { '<cmd>ClangdTypeHierarchy<CR>',           "Clang Type Hierarchy" },
        s = { '<cmd>ClangdSymbolInfo<CR>',              "Clang Symbol Info" },
        b = { '<cmd>Task start auto build<CR>',         "Task Build" },
        r = { '<cmd>Task start auto run<CR>',           "Task Run" },
        C = { '<cmd>Task start auto configure<CR>',     "Task Configure" },
        S = { '<cmd>Task set_module_param auto target<CR>', "Task Set Target" },
      },
      w = {
        a = { '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>',                       "Add Workspace" },
        r = { '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>',                    "Remove Workspace" },
        l = { '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', "List Workspaces" },
      },
      ["rn"] = { '<cmd>lua vim.lsp.buf.rename()<CR>', "Rename" },
    },
  }
  local v_mappings = {
    ["<leader>"] = {
      c = {
        a = { '<cmd>lua vim.lsp.buf.code_action()<CR>', "Range Action" },
        s = { '<cmd>ClangdAST<CR>', "Clangd AST" },
      },
    },
  }

  -- local bufnr = vim.api.nvim_get_current_buf()
  require('ufo').setFoldVirtTextHandler(bufnr, require('mod').fold_handler)
  -- LSP Mode Opts
  local opts_l = {
    mode = "n",       -- NORMAL mode
    buffer = bufnr,     -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true,    -- use `silent` when creating keymaps
    noremap = true,   -- use `noremap` when creating keymaps
    nowait = true,    -- use `nowait` when creating keymaps
  }
  local opts_v = {
    mode = "v",       -- VISUAL mode
    buffer = bufnr,   -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true,    -- use `silent` when creating keymaps
    noremap = true,   -- use `noremap` when creating keymaps
    nowait = true,    -- use `nowait` when creating keymaps
  }
  local wk = require("which-key")
  wk.register(l_mappings, opts_l)
  wk.register(v_mappings, opts_v)

  -- Lsp Signature {{{
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
  -- }}}
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
end
-- }}}
-- Lsp Init {{{
function setup_codelens_refresh(client, bufnr)
  local status_ok, codelens_supported = pcall(function()
    return client.supports_method "textDocument/codeLens"
  end)
  if not status_ok or not codelens_supported then
    return
  end
  local group = "lsp_code_lens_refresh"
  local cl_events = { "BufEnter", "InsertLeave" }
  local ok, cl_autocmds = pcall(vim.api.nvim_get_autocmds, {
    group = group,
    buffer = bufnr,
    event = cl_events,
  })

  if ok and #cl_autocmds > 0 then
    return
  end
  vim.api.nvim_create_augroup(group, { clear = false })
  vim.api.nvim_create_autocmd(cl_events, {
    group = group,
    buffer = bufnr,
    callback = vim.lsp.codelens.refresh,
  })
end
--- Rust-tools {{{
local dap = require('dap')
dap.adapters.lldb = {
  type = "executable",
  command = "/usr/bin/lldb-vscode",
  name = 'lldb',
}

dap.adapters.codelldb = {
  type = 'server',
  port = "13000",
  executable = {
    command = '/usr/bin/codelldb',
    args = {"--port", "${port}"},
  }
}

dap.configurations.rust = {
  {
    name = "Rust debug",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = true,
  },
}
dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      local path
      vim.ui.input({ prompt = "Path to executable: ", default = vim.loop.cwd() .. "/build/" }, function(input)
        path = input
      end)
      vim.cmd [[redraw]]
      return path
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
  },
}

dap.configurations.c = dap.configurations.cpp
local extension_path = vim.env.HOME .. '/.vscode-oss/extensions/vadimcn.vscode-lldb-1.8.1-universal/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb.so'

local rs_opts = {
  tools = {
    on_initialized = function()

      vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "CursorHold", "InsertLeave" }, {
        pattern = { "*.rs" },
        callback = function()
          vim.lsp.codelens.refresh()
        end,
      })
      -- setup_codelens_refresh()
    end,
    autoSetHints = true,
    -- hover_with_actions = true,
    parent_module = true,
    join_lines = true,
    -- runnables = { use_telescope = true },
    -- debuggables = { use_telescope = true },
    inlay_hints = {
      auto = true,
      only_current_line = false,
      only_current_line_autocmd = "CursorHold",
      show_parameter_hints = true,
      parameter_hints_prefix = "❰ ",
      other_hints_prefix = "≣ ",
      -- parameter_hints_prefix = " ",
      -- other_hints_prefix = " ",
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
    -- vim.keymap.set("n", "gE", require'rust-tools'.expand_macro.expand_macro, { buffer = bufnr })
    -- vim.keymap.set("n", "gP", require'rust-tools'.parent_module.parent_module, { buffer = bufnr })
    -- vim.keymap.set("n", "<leader>ca", require('rust-tools').hover_actions.hover_actions, { buffer = bufnr })
    -- vim.keymap.set("n", "<Leader>cg", require('rust-tools').code_action_group.code_action_group, { buffer = bufnr })
    -- end,
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      ["rust-analyzer"] = {
        lens = { enable = true },
        checkOnSave = { command = "clippy" },
        diagnostics = {
          enabled = true,
          disabled = { "unresolved-proc-macro" },
          enableExperimental = true,
        }
      },
    },
  },
  dap = {
    adapter = require('rust-tools.dap').get_codelldb_adapter(
      codelldb_path, liblldb_path),
    -- name = 'rt_lldb',
    -- adapter = {
    --   type = "executable",
    --   command = "lldb-vscode",
    --   name = "rt_lldb",
    -- },
  }
}
local rs_opts2 = {
  tools = {
    on_initialized = function()
      vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "CursorHold", "InsertLeave" }, {
        pattern = { "*.rs" },
        callback = function()
          vim.lsp.codelens.refresh()
        end,
      })
      -- setup_codelens_refresh()
    end,
  },
  server = {
    on_attach = on_attach,
    capabilities = capabilities,
  },
}
require('rust-tools').setup(rs_opts)
--- }}}
require("clangd_extensions").setup {
  server = {
    on_attach = on_attach,
    cmd = { "clangd",
      "--background-index",
      "--fallback-style=Google",
      "--all-scopes-completion",
      "--clang-tidy",
      "--log=error",
      "--suggest-missing-includes",
      "--cross-file-rename",
      "--completion-style=detailed",
      "--pch-storage=memory", -- could also be disk
      "--folding-ranges",
      "--enable-config", -- clangd 11+ supports reading from .clangd configuration file
      "--offset-encoding=utf-16", --temporary fix for null-ls
    },
    capabilities = capabilities,
  },
  extensions = {
    ast = {
      role_icons = {
        type = "",
        declaration = "",
        expression = "",
        specifier = "",
        statement = "",
        ["template argument"] = "",
      },

      kind_icons = {
        Compound = "",
        Recovery = "",
        TranslationUnit = "",
        PackExpansion = "",
        TemplateTypeParm = "",
        TemplateTemplateParm = "",
        TemplateParamObject = "",
      },
    },
  },
}
vim.cmd [[
  command ClangdToggleInlayHints lua require('clangd_extensions.inlay_hints').toggle_inlay_hints()
  command -range ClangdAST lua require('clangd_extensions.ast').display_ast(<line1>, <line2>)
  command ClangdTypeHierarchy lua require('clangd_extensions.type_hierarchy').show_hierarchy()
  command ClangdSymbolInfo lua require('clangd_extensions.symbol_info').show_symbol_info()
  command -nargs=? -complete=customlist,s:memuse_compl ClangdMemoryUsage lua require('clangd_extensions.memory_usage').show_memory_usage('<args>' == 'expand_preamble')
]]

local nvim_lsp = require('lspconfig')
local util = require('lspconfig/util')

local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimport()
  end,
  group = format_sync_grp,
})

require('go').setup({
  lsp_cfg = {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
      gopls = {
        completeUnimported = true,
        usePlaceholders = true,
        analyses = {
          unusedparams = true,
        },
      },
    },
  }
})

local servers = { 'taplo' } -- 'clangd',
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = { debounce_text_changes = 150, }
  }
end
-- }}}
-- [[ ----------------------------------------------------------------------- ]]
