require('matugen').setup()

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local function get_wordcount()
  if vim.fn.mode():find("[vV\22]") then
    return vim.fn.wordcount().visual_words or 0
  end
  return vim.fn.wordcount().words
end

local function wordcount()
  local n = get_wordcount()
  return n .. " " .. (n == 1 and "word" or "words")
end

require("lualine").setup({
  sections = {
    lualine_z = { { wordcount } },
  },
})
