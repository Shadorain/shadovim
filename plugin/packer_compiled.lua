-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/shadow/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/shadow/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/shadow/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/shadow/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/shadow/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = false,
    needs_bufread = false,
    path = "/home/shadow/.local/share/nvim/site/pack/packer/opt/LuaSnip"
  },
  ["ack.vim"] = {
    loaded = true,
    path = "/home/shadow/.local/share/nvim/site/pack/packer/start/ack.vim"
  },
  aniseed = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = true,
    path = "/home/shadow/.local/share/nvim/site/pack/packer/opt/aniseed"
  },
  ["cmp-buffer"] = {
    after_files = { "/home/shadow/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/shadow/.local/share/nvim/site/pack/packer/opt/cmp-buffer"
  },
  ["cmp-calc"] = {
    after_files = { "/home/shadow/.local/share/nvim/site/pack/packer/opt/cmp-calc/after/plugin/cmp_calc.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/shadow/.local/share/nvim/site/pack/packer/opt/cmp-calc"
  },
  ["cmp-nvim-lsp"] = {
    after_files = { "/home/shadow/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/shadow/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    after_files = { "/home/shadow/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua/after/plugin/cmp_nvim_lua.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/shadow/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    after_files = { "/home/shadow/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/shadow/.local/share/nvim/site/pack/packer/opt/cmp-path"
  },
  cmp_luasnip = {
    after_files = { "/home/shadow/.local/share/nvim/site/pack/packer/opt/cmp_luasnip/after/plugin/cmp_luasnip.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/shadow/.local/share/nvim/site/pack/packer/opt/cmp_luasnip"
  },
  ["follow-md-links.nvim"] = {
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20follow-md-links\frequire\0" },
    loaded = false,
    needs_bufread = true,
    path = "/home/shadow/.local/share/nvim/site/pack/packer/opt/follow-md-links.nvim"
  },
  genutils = {
    loaded = true,
    path = "/home/shadow/.local/share/nvim/site/pack/packer/start/genutils"
  },
  ["goyo.vim"] = {
    loaded = true,
    path = "/home/shadow/.local/share/nvim/site/pack/packer/start/goyo.vim"
  },
  ["hop.nvim"] = {
    loaded = true,
    path = "/home/shadow/.local/share/nvim/site/pack/packer/start/hop.nvim"
  },
  ["lightline.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/shadow/.local/share/nvim/site/pack/packer/opt/lightline.vim"
  },
  ["lsp_signature.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/shadow/.local/share/nvim/site/pack/packer/opt/lsp_signature.nvim"
  },
  ["mkdir.nvim"] = {
    config = { "\27LJ\2\n%\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\nmkdir\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/shadow/.local/share/nvim/site/pack/packer/opt/mkdir.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\nœ\1\0\0\3\0\6\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\0\0'\2\4\0B\0\2\0029\0\2\0005\2\5\0B\0\2\1K\0\1\0\1\0\2\vmap_cr\2\17map_complete\2\"nvim-autopairs.completion.cmp\1\0\1\rcheck_ts\2\nsetup\19nvim-autopairs\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/shadow/.local/share/nvim/site/pack/packer/opt/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "cmp-buffer", "cmp-calc", "cmp-nvim-lsp", "cmp-nvim-lua", "cmp-path", "cmp_luasnip" },
    loaded = true,
    only_config = true
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/home/shadow/.local/share/nvim/site/pack/packer/start/nvim-dap"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/shadow/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    config = { "\27LJ\2\nA\2\0\4\1\3\0\a6\0\0\0009\0\1\0009\0\2\0-\2\0\0G\3\0\0A\0\1\1K\0\1\0\1À\24nvim_buf_set_keymap\bapi\bvimö\b\1\2\n\0&\0f3\2\0\0005\3\1\0\18\4\2\0'\6\2\0'\a\3\0'\b\4\0\18\t\3\0B\4\5\1\18\4\2\0'\6\2\0'\a\5\0'\b\6\0\18\t\3\0B\4\5\1\18\4\2\0'\6\2\0'\a\a\0'\b\b\0\18\t\3\0B\4\5\1\18\4\2\0'\6\2\0'\a\t\0'\b\n\0\18\t\3\0B\4\5\1\18\4\2\0'\6\2\0'\a\v\0'\b\f\0\18\t\3\0B\4\5\1\18\4\2\0'\6\2\0'\a\r\0'\b\14\0\18\t\3\0B\4\5\1\18\4\2\0'\6\2\0'\a\15\0'\b\16\0\18\t\3\0B\4\5\1\18\4\2\0'\6\2\0'\a\17\0'\b\18\0\18\t\3\0B\4\5\1\18\4\2\0'\6\2\0'\a\19\0'\b\20\0\18\t\3\0B\4\5\1\18\4\2\0'\6\2\0'\a\21\0'\b\22\0\18\t\3\0B\4\5\1\18\4\2\0'\6\2\0'\a\23\0'\b\24\0\18\t\3\0B\4\5\0016\4\25\0009\4\26\0049\4\27\0046\5\25\0009\5\26\0059\5\29\0056\a\25\0009\a\26\a9\a\27\a9\a\30\a5\b\31\0B\5\3\2=\5\28\0046\4\25\0009\4\26\0049\4\27\0046\5\25\0009\5\26\0059\5\29\0056\a\25\0009\a\26\a9\a\27\a9\a\30\a5\b!\0B\5\3\2=\5 \0046\4\"\0'\6#\0B\4\2\0029\4$\0045\6%\0B\4\2\0012\0\0€K\0\1\0\1\0\1\16hint_prefix\tï•› \14on_attach\18lsp_signature\frequire\1\0\1\vborder\frounded\31textDocument/signatureHelp\1\0\1\vborder\frounded\nhover\twith\23textDocument/hover\rhandlers\blsp\bvim<<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>\14<Leader>e+<cmd>lua vim.lsp.buf.code_action()<CR>\15<Leader>ca*<cmd>lua vim.lsp.buf.references()<CR>\15<Leader>rf&<cmd>lua vim.lsp.buf.rename()<CR>\15<Leader>rn7<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>\15<Leader>dr4<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>\15<Leader>da.<cmd>lua vim.lsp.buf.signature_help()<CR>\n<C-k>.<cmd>lua vim.lsp.buf.implementation()<CR>\agi%<cmd>lua vim.lsp.buf.hover()<CR>\6K*<cmd>lua vim.lsp.buf.definition()<CR>\agd+<cmd>lua vim.lsp.buf.declaration()<CR>\agD\6n\1\0\2\vsilent\2\fnoremap\2\0™\1\1\0\r\3\b\0\0236\0\0\0-\2\0\0B\0\2\4X\3\16€-\5\1\0008\5\4\0059\5\1\0056\a\2\0009\a\3\a'\t\4\0-\n\2\0008\n\4\n\14\0\n\0X\v\1€4\n\0\0005\v\6\0003\f\5\0=\f\a\vB\a\4\0A\5\0\1E\3\3\3R\3îK\0\1\0\3À\0À\2À\14on_attach\1\0\0\0\nforce\15tbl_extend\bvim\nsetup\vipairs5\0\0\3\1\3\0\a-\0\0\0B\0\1\0016\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\4À\fbufdo e\bcmd\bvim«\1\1\0\a\0\t\0\0206\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0029\3\4\1B\3\1\0029\4\5\1B\4\1\0013\4\6\0\18\5\4\0B\5\1\0013\5\b\0=\5\a\0012\0\0€K\0\1\0\0\22post_install_hook\0\nsetup\22installed_servers\15lsp_config\15lspinstall\14lspconfig\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/shadow/.local/share/nvim/site/pack/packer/opt/nvim-lspinstall"
  },
  ["nvim-treesitter"] = {
    after = { "aniseed", "nvim-ts-context-commentstring", "nvim-treesitter-textobjects", "nvim-treesitter-textsubjects" },
    config = { "\27LJ\2\nÓ\14\0\0\a\0004\0<6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0025\1\a\0005\2\4\0005\3\5\0=\3\6\2=\2\b\1=\1\3\0006\1\0\0'\3\t\0B\1\2\0029\1\n\0015\3\v\0005\4\f\0=\4\r\0035\4\14\0005\5\15\0=\5\16\4=\4\17\0035\4\18\0=\4\19\0035\4\20\0005\5\21\0=\5\22\4=\4\23\0035\4\24\0005\5\25\0=\5\16\4=\4\26\0035\4\27\0=\4\28\0035\4\31\0005\5\29\0005\6\30\0=\6\16\5=\5 \0045\5!\0005\6\"\0=\6#\0055\6$\0=\6%\0055\6&\0=\6'\0055\6(\0=\6)\5=\5*\4=\4+\0035\4,\0005\5-\0=\5.\4=\4/\0035\0040\0=\0041\0035\0042\0=\0043\3B\1\2\1K\0\1\0\26context_commentstring\1\0\1\venable\2\14tree_docs\1\0\1\venable\1\15playground\16keybindings\1\0\n\21toggle_hl_groups\6i\24toggle_query_editor\6o\vupdate\6R\14show_help\6?\14goto_node\t<cr>\21unfocus_language\6F\19focus_language\6f\28toggle_language_display\6I\27toggle_anonymous_nodes\6a\30toggle_injected_languages\6t\1\0\3\20persist_queries\1\15updatetime\3\25\venable\2\16textobjects\tmove\22goto_previous_end\1\0\5\bgpF\20@function.outer\tgpiC\16@call.inner\bgpC\16@call.outer\bgpP\21@parameter.inner\tgpiF\20@function.inner\24goto_previous_start\1\0\5\tgpic\16@call.inner\bgpc\16@call.outer\bgpp\21@parameter.inner\tgpif\20@function.inner\bgpf\20@function.outer\18goto_next_end\1\0\5\tgniC\16@call.inner\bgnC\16@call.outer\bgnP\21@parameter.inner\tgniF\20@function.inner\bgnF\20@function.outer\20goto_next_start\1\0\5\bgnp\21@parameter.inner\tgnic\16@call.inner\bgnc\16@call.outer\tgnif\20@function.inner\bgnf\20@function.outer\1\0\2\14set_jumps\2\venable\2\vselect\1\0\0\1\0\f\bast\21@statement.outer\aaf\20@function.outer\aaB\17@block.outer\aiB\17@block.inner\6p\21@parameter.inner\bisc\21@scopename.inner\aal\16@loop.outer\bacd\23@conditional.outer\aif\20@function.inner\bacm\19@comment.outer\bicd\23@conditional.inner\ail\16@loop.outer\1\0\2\venable\2\14lookahead\2\14autopairs\1\0\1\venable\2\17textsubjects\1\0\1\6,\23textsubjects-smart\1\0\1\venable\2\17query_linter\16lint_events\1\3\0\0\rBufWrite\15CursorHold\1\0\2\venable\2\21use_virtual_text\2\vindent\1\0\1\venable\2\26incremental_selection\fkeymaps\1\0\4\21node_incremental\bgnn\21node_decremental\bgnp\19init_selection\bgnn\22scope_incremental\bgns\1\0\1\venable\2\14highlight\1\0\1\venable\2\1\0\1\21ensure_installed\ball\nsetup\28nvim-treesitter.configs\17install_info\1\0\1\rfiletype\rmarkdown\nfiles\1\3\0\0\17src/parser.c\19src/scanner.cc\1\0\1\burl5https://github.com/ikatyang/tree-sitter-markdown\rmarkdown\23get_parser_configs\28nvim-treesitter.parsers\frequire\0" },
    loaded = false,
    needs_bufread = true,
    path = "/home/shadow/.local/share/nvim/site/pack/packer/opt/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/shadow/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects"
  },
  ["nvim-treesitter-textsubjects"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/shadow/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textsubjects"
  },
  ["nvim-ts-context-commentstring"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/shadow/.local/share/nvim/site/pack/packer/opt/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/shadow/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/shadow/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  playground = {
    commands = { "TSPlaygroundToggle" },
    loaded = false,
    needs_bufread = true,
    path = "/home/shadow/.local/share/nvim/site/pack/packer/opt/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/shadow/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/shadow/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["quick-scope"] = {
    loaded = true,
    path = "/home/shadow/.local/share/nvim/site/pack/packer/start/quick-scope"
  },
  ["rust-tools.nvim"] = {
    loaded = true,
    path = "/home/shadow/.local/share/nvim/site/pack/packer/start/rust-tools.nvim"
  },
  ["rust.vim"] = {
    loaded = true,
    path = "/home/shadow/.local/share/nvim/site/pack/packer/start/rust.vim"
  },
  tabular = {
    loaded = true,
    path = "/home/shadow/.local/share/nvim/site/pack/packer/start/tabular"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/shadow/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-bookmarks"] = {
    loaded = true,
    path = "/home/shadow/.local/share/nvim/site/pack/packer/start/vim-bookmarks"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/shadow/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "/home/shadow/.local/share/nvim/site/pack/packer/start/vim-floaterm"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/home/shadow/.local/share/nvim/site/pack/packer/start/vim-gitgutter"
  },
  ["vim-markdown"] = {
    loaded = true,
    path = "/home/shadow/.local/share/nvim/site/pack/packer/start/vim-markdown"
  },
  ["vim-polyglot"] = {
    loaded = true,
    path = "/home/shadow/.local/share/nvim/site/pack/packer/start/vim-polyglot"
  },
  ["vim-rust-syntax-ext"] = {
    loaded = true,
    path = "/home/shadow/.local/share/nvim/site/pack/packer/start/vim-rust-syntax-ext"
  },
  ["vim-sneak"] = {
    loaded = true,
    path = "/home/shadow/.local/share/nvim/site/pack/packer/start/vim-sneak"
  },
  ["vim-startify"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/shadow/.local/share/nvim/site/pack/packer/opt/vim-startify"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^cmp"] = "LuaSnip",
  ["^lsp_signature"] = "lsp_signature.nvim"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\nC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequireâ\4\1\0\t\0$\0?6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0005\4\3\0=\4\5\0035\4\a\0003\5\6\0=\5\b\4=\4\t\0035\4\f\0009\5\n\0009\5\v\5B\5\1\2=\5\r\0049\5\n\0009\5\14\5B\5\1\2=\5\15\0049\5\n\0009\5\16\5)\aüÿB\5\2\2=\5\17\0049\5\n\0009\5\16\5)\a\4\0B\5\2\2=\5\18\0049\5\n\0009\5\19\5B\5\1\2=\5\20\0049\5\n\0009\5\21\5B\5\1\2=\5\22\0049\5\n\0009\5\23\0055\a\26\0009\b\24\0009\b\25\b=\b\27\aB\5\2\2=\5\28\4=\4\n\0034\4\a\0005\5\29\0>\5\1\0045\5\30\0>\5\2\0045\5\31\0>\5\3\0045\5 \0>\5\4\0045\5!\0>\5\5\0045\5\"\0>\5\6\4=\4#\3B\1\2\1K\0\1\0\fsources\1\0\1\tname\tpath\1\0\1\tname\tcalc\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\1\0\1\tname\rnvim_lua\1\0\1\tname\vbuffer\t<CR>\rbehavior\1\0\1\vselect\1\fReplace\20ConfirmBehavior\fconfirm\n<C-c>\nclose\14<C-Space>\rcomplete\n<C-u>\n<C-d>\16scroll_docs\n<C-n>\21select_next_item\n<C-p>\1\0\0\21select_prev_item\fmapping\fsnippet\vexpand\1\0\0\0\15completion\1\0\0\1\0\1\16completeopt\21menuone,noselect\nsetup\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd cmp_luasnip ]]
vim.cmd [[ packadd cmp-buffer ]]
vim.cmd [[ packadd cmp-path ]]
vim.cmd [[ packadd cmp-nvim-lua ]]
vim.cmd [[ packadd cmp-nvim-lsp ]]
vim.cmd [[ packadd cmp-calc ]]
time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file TSPlaygroundToggle lua require("packer.load")({'playground'}, { cmd = "TSPlaygroundToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufWritePre * ++once lua require("packer.load")({'mkdir.nvim'}, { event = "BufWritePre *" }, _G.packer_plugins)]]
vim.cmd [[au ColorScheme * ++once lua require("packer.load")({'nvim-lspinstall', 'follow-md-links.nvim', 'nvim-autopairs'}, { event = "ColorScheme *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
