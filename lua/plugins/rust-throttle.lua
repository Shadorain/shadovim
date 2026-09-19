-- Daedalus is a thin LXC (4 vCPU, 8GB). rust-analyzer defaults to one
-- thread per physical core and pounds the NVMe. Mac/desktop should not
-- inherit that cap from this shared config.
local function throttle_rust_analyzer()
  if vim.fn.has("macunix") == 1 then
    return false
  end
  local host = (vim.uv.os_gethostname() or vim.fn.hostname() or ""):lower()
  host = host:match("^([^.]+)") or host
  return host == "daedalus"
end

if not throttle_rust_analyzer() then
  return {}
end

return {
  {
    "mrcjkb/rustaceanvim",
    opts = {
      server = {
        default_settings = {
          ["rust-analyzer"] = {
            numThreads = 2,
            cachePriming = { numThreads = 2 },
            cargo = {
              targetDir = true,
            },
            -- checkOnSave is a boolean now. Command lives on check.
            check = { command = "check" },
          },
        },
      },
    },
  },
}
