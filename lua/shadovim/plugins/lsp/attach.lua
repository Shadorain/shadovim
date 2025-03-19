local M = {}

local cmp_nvim_lsp = require("cmp_nvim_lsp")

local lsp_references = function()
  local builtin = require("telescope.builtin")
  local opts = {
    layout_strategy = "vertical",
    layout_config = { prompt_position = "bottom" },
    sorting_strategy = "ascending",
    ignore_filename = false,
  }
  builtin.lsp_references(opts)
end

local lsp_implementations = function()
  local builtin = require("telescope.builtin")
  local opts = {
    layout_strategy = "vertical",
    layout_config = { prompt_position = "bottom" },
    sorting_strategy = "ascending",
    ignore_filename = false,
  }
  builtin.lsp_implementations(opts)
end

M.on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  local bufopts = { noremap = true, silent = true, buffer = bufnr, nowait = true }

  require("which-key").add({
    { "<leader>c",  group = "CODE ACTIONS" },
    {
      "<leader>ca",
      function()
        -- if vim.bo[bufnr].filetype == "rust" then
        -- 	vim.cmd.RustLsp("codeAction")
        -- else
        vim.lsp.buf.code_action()
        -- end
      end,
      desc = "Code Actions"
    },
    { "<leader>F",  "<cmd>lua vim.lsp.buf.format()<cr>",                                     desc = "Format" },
    { "<leader>cl", "<cmd>lua vim.lsp.codelens.run()<CR>",                                   desc = "Code Lens" },
    { "<leader>ce", '<cmd>lua vim.cmd.RustLsp("explainError")<CR>',                          desc = "Explain Error" },
    { "<leader>ch", '<cmd>lua vim.cmd.RustLsp({ "hover", "actions" })<CR>',                  desc = "Hover Actions" },
    { "<leader>cR", '<cmd>lua vim.cmd.RustLsp("renderDiagnostic")<CR>',                      desc = "Render Diagnostic" },
    { "<leader>co", '<cmd>lua vim.cmd.RustLsp("openDocs")<CR>',                              desc = "Open Docs" },
    { "<leader>cT", "<cmd>lua vim.diagnostic.enable(not vim.diagnostic.is_enabled())<CR>",   desc = "Toggle Diagnostics" },

    { "<leader>cr", "<cmd>OverseerRun<CR>",                                                  desc = "Overseer Run" },
    { "<leader>cb", "<cmd>OverseerBuild<CR>",                                                desc = "Build" },
    { "<leader>ct", "<cmd>OverseerToggle<CR>",                                               desc = "Overseer Toggle" },

    -- { "<leader>w",  group = "WORKSPACES" },
    { "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>",                       desc = "Add Workspace" },
    { "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", desc = "List Workspaces" },
    { "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>",                    desc = "Remove Workspace" },


    {
      "K",
      function()
        local winid = require("ufo").peekFoldedLinesUnderCursor()
        if not winid then vim.lsp.buf.hover() end
      end,
      desc = "Hover"
    },
    { "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>",        desc = "Diag Prev" },
    { "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>",        desc = "Diag Next" },

    { "gd", "<cmd>Telescope lsp_definitions<CR>",             desc = "Definition" },
    { "gi", function() lsp_implementations() end,             desc = "Implementations" },
    { "gr", function() lsp_references() end,                  desc = "References" },
    { "gD", "<cmd>Telescope lsp_declarations<CR>",            desc = "Declaration" },
    { "gI", "<cmd>Telescope lsp_incoming_calls<CR>",          desc = "Incoming Calls" },
    { "gO", "<cmd>Telescope lsp_outgoing_calls<CR>",          desc = "Outgoing Calls" },
    { "gP", '<cmd>lua vim.cmd.RustLsp("parentModule")<CR>',   desc = "Parent Module" },
    { "gE", '<cmd>lua vim.cmd.RustLsp("expandMacro")()<CR>',  desc = "Expand Macro" },
    { "ge", '<cmd>lua vim.cmd.RustLsp("explainError")()<CR>', desc = "Expand Macro" },
    { "gC", '<cmd>lua vim.cmd.RustLsp("openCargo")<CR>',      desc = "Open Cargo.toml" },
  }, bufopts)

  if client.server_capabilities.inlayHintProvider then
    vim.lsp.inlay_hint.enable(true)
  end

  require("lsp_signature").on_attach({
    bind = true,
    handler_opts = { border = "rounded" },
  }, bufnr)
end

M.capabilities = vim.tbl_deep_extend("force", vim.lsp.protocol.make_client_capabilities(),
  cmp_nvim_lsp.default_capabilities())
M.capabilities.offsetEncoding = { "utf-16", "utf-8" }

return M
