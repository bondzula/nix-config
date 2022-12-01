local ok, ufo = pcall(require, "ufo")

if not ok then
  return
end

vim.wo.foldcolumn = '0'
vim.wo.foldlevel = 99
vim.wo.foldenable = true

local handler = function(virtText, lnum, endLnum, width, truncate)
  local newVirtText = {}
  local suffix = ('  %d '):format(endLnum - lnum)
  local sufWidth = vim.fn.strdisplaywidth(suffix)
  local targetWidth = width - sufWidth
  local curWidth = 0
  for _, chunk in ipairs(virtText) do
    local chunkText = chunk[1]
    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
    if targetWidth > curWidth + chunkWidth then
      table.insert(newVirtText, chunk)
    else
      chunkText = truncate(chunkText, targetWidth - curWidth)
      local hlGroup = chunk[2]
      table.insert(newVirtText, { chunkText, hlGroup })
      chunkWidth = vim.fn.strdisplaywidth(chunkText)
      -- str width returned from truncate() may less than 2nd argument, need padding
      if curWidth + chunkWidth < targetWidth then
        suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
      end
      break
    end
    curWidth = curWidth + chunkWidth
  end
  table.insert(newVirtText, { suffix, 'MoreMsg' })
  return newVirtText
end

-- global handler
ufo.setup({
  fold_virt_text_handler = handler,
  preview = {
    win_config = {
      border = { '', '─', '', '', '', '─', '', '' },
      winhighlight = 'Normal:Folded',
      winblend = 0
    },
    mappings = {
      scrollU = '<C-u>',
      scrollD = '<C-d>'
    }
  },
})

vim.keymap.set('n', 'K', function()
  local winid = require('ufo').peekFoldedLinesUnderCursor()
  if not winid then
    -- choose one of coc.nvim and nvim lsp
    vim.fn.CocActionAsync('definitionHover') -- coc.nvim
    vim.lsp.buf.hover()
  end
end)

vim.api.nvim_set_hl(0, "UfoFoldedBg", {})
vim.api.nvim_set_hl(0, "UfoFoldedFg", {})
vim.api.nvim_set_hl(0, "UfoPreviewSbar", {})
vim.api.nvim_set_hl(0, "UfoPreviewCursorLine", {})
vim.api.nvim_set_hl(0, "UfoPreviewWinBar", {})
vim.api.nvim_set_hl(0, "UfoPreviewThumb", {})
vim.api.nvim_set_hl(0, "UfoFoldedEllipsis", {})
