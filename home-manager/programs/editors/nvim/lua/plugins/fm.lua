local status, fm = pcall(require, "fm-nvim")

if not status then
  return
end

fm.setup {
  -- (Vim) Command used to open files
  edit_cmd = "edit",

  -- See `Q&A` for more info
  on_close = {},
  on_open = {},

  -- UI Options
  ui = {
    default = "float",

    float = {
      border    = "rounded",
      float_hl  = "Normal",
      border_hl = "FloatBorder",
      blend     = 0, -- (:h winblend)
      height    = 0.8,
      width     = 0.8,
    },

    split = {
      direction = "topleft",
      size = 24
    }
  },
  cmds = {
    lf_cmd      = "lf",
    lazygit_cmd = "lazygit",
  },
  mappings = {
    vert_split = "<C-v>",
    horz_split = "<C-h>",
    tabedit    = "<C-t>",
    edit       = "<C-e>",
    ESC        = "<ESC>"
  },
}

vim.keymap.set("n", "<leader>ol", function() fm.Lf(vim.fn.expand('%:p')) end)
vim.keymap.set("n", "<leader>gg", function() fm.Lazygit() end)
