require(... .. ".options")
require(... .. ".autocmds")

local check, config = pcall(require, "config")
if check then
  require("config")
end
