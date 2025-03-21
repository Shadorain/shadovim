return {
  "mrcjkb/rustaceanvim",
  version = "^4",
  ft = { "rust" },
  config = function()
    vim.g.rustaceanvim = function()
      -- Update this path
      local extension_path = vim.env.HOME .. "/.vscode/extensions/vadimcn.vscode-lldb-1.10.0/"
      local codelldb_path = extension_path .. "adapter/codelldb"
      local liblldb_path = extension_path .. "lldb/lib/liblldb"
      local this_os = vim.uv.os_uname().sysname

      -- The path is different on Windows
      if this_os:find("Windows") then
        codelldb_path = extension_path .. "adapter\\codelldb.exe"
        liblldb_path = extension_path .. "lldb\\bin\\liblldb.dll"
      else
        -- The liblldb extension is .so for Linux and .dylib for MacOS
        liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
      end

      local cfg = require("rustaceanvim.config")
      return {
        -- Plugin configuration
        tools = {
          code_actions = { ui_select_falback = true },
        },
        -- LSP configuration
        server = {
          on_attach = require("shadovim.plugins.lsp.attach").on_attach,
          default_settings = {
            -- rust-analyzer language server configuration
            ["rust-analyzer"] = {
              lens = { enable = true },
              checkOnSave = { command = "clippy" },
              diagnostics = {
                enabled = true,
                disabled = { "unresolved-proc-macro" },
                enableExperimental = true,
              },
              cargo = {
                allFeatures = true,
              }
            },
          },
        },
        -- DAP configuration
        dap = {
          adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
        },
      }
    end
  end,
}
