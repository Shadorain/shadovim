local status_ok, jabs = pcall(require, "jabs")
if status_ok then
  jabs.setup {
    border = 'rounded',
    offset = {
      bottom = 6,
    },
    preview = {
      border = 'rounded'
    },
    keymap = {
      close = "d",
      preview = "p",
    },
    highlight = {
      current = "Title",
      hidden = "FloatermNC",
      split = "EndOfBuffer",
      alternate = "Identifier"
    },
  }
end
