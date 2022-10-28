-- https://github.com/norcalli/nvim-colorizer.lua
require 'colorizer'.setup({
  filetypes = {
    'javascript';
    'typescript';
    'php';
    '!css';
    '!html';
    '!tsx';
    '!jsx';
    '!dart';
    '!vue';
  },
  user_default_options = { mode = 'background' }
})
