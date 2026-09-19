local markers = {
  "tailwind.config.js",
  "tailwind.config.cjs",
  "tailwind.config.mjs",
  "tailwind.config.ts",
  "tailwind.config.cts",
}

local function tailwind_root(fname)
  fname = (fname and fname ~= "") and fname or vim.uv.cwd()
  local cfg = vim.fs.find(markers, { path = fname, upward = true })[1]
  if cfg then
    return vim.fs.dirname(cfg)
  end
  local pkg = vim.fs.find("package.json", { path = fname, upward = true })[1]
  if not pkg then
    return nil
  end
  local ok, lines = pcall(vim.fn.readfile, pkg)
  if not ok then
    return nil
  end
  if table.concat(lines, "\n"):find('"tailwindcss"', 1, true) then
    return vim.fs.dirname(pkg)
  end
  return nil
end

return {
  {
    "luckasRanarison/tailwind-tools.nvim",
    name = "tailwind-tools",
    lazy = true,
    cmd = {
      "TailwindStart",
      "TailwindColorToggle",
      "TailwindSort",
      "TailwindSortSelection",
    },
    build = ":UpdateRemotePlugins",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    init = function()
      vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
        group = vim.api.nvim_create_augroup("daedalus_tailwind_tools", { clear = true }),
        callback = function(ev)
          if tailwind_root(vim.api.nvim_buf_get_name(ev.buf)) then
            require("lazy").load({ plugins = { "tailwind-tools" } })
          end
        end,
      })
    end,
    opts = {
      document_color = {
        enabled = true,
        kind = "inline",
      },
      server = {
        override = false,
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tailwindcss = {
          -- lspconfig falls back to .git for Tailwind v4. That attaches on every repo.
          root_dir = function(bufnr, on_dir)
            local root = tailwind_root(vim.api.nvim_buf_get_name(bufnr))
            if root then
              on_dir(root)
            end
          end,
          settings = {
            tailwindCSS = {
              includeLanguages = {
                rust = "html",
              },
            },
          },
        },
      },
    },
  },
}
