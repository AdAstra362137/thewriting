 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#291414',
    base01 = '#452121',
    base02 = '#3e1e1e',
    base03 = '#756161',
    base04 = '#b6afaf',
    base05 = '#f3f2f2',
    base06 = '#f3f2f2',
    base07 = '#f3f2f2',
    base08 = '#ce7979',
    base09 = '#d1d176',
    base0A = '#daa36d',
    base0B = '#e46767',
    base0C = '#e9e996',
    base0D = '#ec9393',
    base0E = '#e9bf96',
    base0F = '#781d1d',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#f3f2f2',          bg = '#291414' })
  hi('TelescopeBorder',         { fg = '#756161',             bg = '#291414' })
  hi('TelescopePromptNormal',   { fg = '#f3f2f2',          bg = '#291414' })
  hi('TelescopePromptBorder',   { fg = '#756161',             bg = '#291414' })
  hi('TelescopePromptPrefix',   { fg = '#e46767',             bg = '#291414' })
  hi('TelescopePromptCounter',  { fg = '#b6afaf',  bg = '#291414' })
  hi('TelescopePromptTitle',    { fg = '#291414',             bg = '#e46767' })
  hi('TelescopePreviewTitle',   { fg = '#291414',             bg = '#daa36d' })
  hi('TelescopeResultsTitle',   { fg = '#291414',             bg = '#d1d176' })
  hi('TelescopeSelection',      { fg = '#f3f2f2',          bg = '#3e1e1e' })
  hi('TelescopeSelectionCaret', { fg = '#e46767',             bg = '#3e1e1e' })
  hi('TelescopeMatching',       { fg = '#e46767',             bold = true })
end

 -- Register a signal handler for SIGUSR1 (matugen updates)
 local signal = vim.uv.new_signal()
 signal:start(
   'sigusr1',
   vim.schedule_wrap(function()
     package.loaded['matugen'] = nil
     require('matugen').setup()
   end)
 )

 return M
