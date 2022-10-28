local ok, packer = pcall(require, "packer")
if not ok then
  return
end

local function generated(name)
  local plugin_name = name:match("[^/]+$")
  local plugin_dir = vim.fn.stdpath("data") .. "/plugins/" .. plugin_name
  if vim.fn.isdirectory(plugin_dir) > 0 then
    return plugin_dir
  end
  return name
end

packer.init({
  auto_clean = true,
  compile_on_sync = true,
  display = {
    working_sym = "ﲊ",
    error_sym = "✗",
    done_sym = "﫟",
    removed_sym = "",
    moved_sym = "",
  },
})

packer.startup({
  function(use)
    -- Vitals
    use({ generated("wbthomason/packer.nvim") })
    use({ generated("lewis6991/impatient.nvim") })
    use({ generated("nvim-lua/plenary.nvim") })

    -- Icons
    use({ generated("kyazdani42/nvim-web-devicons") })

    -- Colorschemes
    use({
      generated("catppuccin/nvim"),
      as = "catppuccin"
    })

    -- Treesitter setup
    use({
      {
        "nvim-treesitter/nvim-treesitter",
        config = function()
          require("plugins.treesitter")
        end,
      },

      -- https://github.com/nvim-treesitter/playground
      {
        generated("nvim-treesitter/playground"),
        command = "TSPlaygroundToggle",
        after = "nvim-treesitter",
      },

      -- https://github.com/JoosepAlviste/nvim-ts-context-commentstring
      {
        generated("JoosepAlviste/nvim-ts-context-commentstring"),
        after = "nvim-treesitter",
      },

      -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
      {
        generated("nvim-treesitter/nvim-treesitter-textobjects"),
        after = "nvim-treesitter",
      },

      -- https://github.com/windwp/nvim-ts-autotag
      {
        generated("windwp/nvim-ts-autotag"),
        after = "nvim-treesitter",
        event = 'InsertEnter'
      },

      -- https://github.com/windwp/nvim-autopairs
      {
        generated("windwp/nvim-autopairs"),
        config = function()
          require("plugins.autopairs")
        end,
      }
    })

    -- Telescope
    use({
      -- https://github.com/nvim-telescope/telescope.nvim
      {
        generated("nvim-telescope/telescope.nvim"),
        config = function()
          require("plugins.telescope")
        end,
      },

      -- https://github.com/nvim-telescope/telescope-live-grep-args.nvim
      {
        generated("nvim-telescope/telescope-live-grep-args.nvim"),
      },

      -- https://github.com/nvim-telescope/telescope-fzf-native.nvim
      {
        generated("nvim-telescope/telescope-fzf-native.nvim"),
        run = "make",
      },
    })

    -- https://github.com/famiu/bufdelete.nvim
    use({
      generated("famiu/bufdelete.nvim"),
    })

    -- https://github.com/wellle/targets.vim
    use({
      generated("wellle/targets.vim"),
    })

    -- https://github.com/gpanders/editorconfig.nvim
    use({
      generated('gpanders/editorconfig.nvim'),
    })

    -- https://github.com/is0n/fm-nvim
    use({
      generated('is0n/fm-nvim'),
      config = function()
        require("plugins.fm")
      end,
      cmd = { 'Lf', 'Lazygit' },
      keys = { { 'n', '<leader>ol' }, { 'n', '<leader>gg' } }
    })

    -- https://github.com/stevearc/overseer.nvim
    use({
      generated('stevearc/overseer.nvim'),
      config = function()
        require('overseer').setup()
      end
    })

    -- https://github.com/SmiteshP/nvim-navic
    use({
      generated("SmiteshP/nvim-navic"),
      config = function()
        require("plugins.navic")
      end,
    })

    -- https://github.com/anuvyklack/hydra.nvim
    use({
      generated('anuvyklack/hydra.nvim'),
      config = function()
        require("plugins.hydra")
      end,
      requires = {
        -- needed only for pink hydras
        generated('anuvyklack/keymap-layer.nvim')
      }
    })

    -- https://github.com/stevearc/dressing.nvim
    use({
      generated('stevearc/dressing.nvim'),
      config = function()
        require("plugins.dressing")
      end,
    })

    -- https://github.com/chaoren/vim-wordmotion
    use({
      generated("chaoren/vim-wordmotion"),
      config = function()
        vim.g.wordmotion_prefix = "<leader>"
      end
    })

    -- https://github.com/kevinhwang91/nvim-ufo
    use({
      generated('kevinhwang91/nvim-ufo'),
      config = function()
        require("plugins.ufo")
      end,
      requires = {
        generated('kevinhwang91/promise-async'),
      }
    })

    -- https://github.com/numToStr/Comment.nvim
    use({
      generated("numToStr/Comment.nvim"),
      config = function()
        require("plugins.comment")
      end,
    })

    -- https://github.com/AndrewRadev/splitjoin.vim
    use({
      generated("AndrewRadev/splitjoin.vim")
    })

    -- https://github.com/folke/todo-comments.nvim
    use({
      generated("folke/todo-comments.nvim"),
      config = function()
        require('plugins.todo-comments')
      end,
    })

    use({
      generated("folke/noice.nvim"),
      config = function()
        require('plugins.noice')
      end,
      requires = {
        generated("MunifTanjim/nui.nvim")
      }
    })

    use({
      generated("folke/trouble.nvim"),
      config = function()
        require('plugins.trouble')
      end,
    })

    -- https://github.com/kylechui/nvim-surround
    use({
      generated("kylechui/nvim-surround"),
      config = function()
        require("nvim-surround").setup({})
      end
    })

    -- https://github.com/nvim-lualine/lualine.nvim
    use({
      generated("nvim-lualine/lualine.nvim"),
      config = function()
        require("plugins.lualine")
      end,
    })

    -- https://github.com/vimpostor/vim-tpipeline
    use({
      generated("vimpostor/vim-tpipeline"),
      config = function()
        vim.g.tpipeline_autoembed = 1
        vim.g.tpipeline_cursormoved = 1
      end
    })

    -- https://github.com/mickael-menu/zk-nvim
    use({
      generated("mickael-menu/zk-nvim"),
      config = function()
        require("plugins.zk-nvim")
      end,
    })

    -- CMP Completion
    use({
      -- https://github.com/hrsh7th/nvim-cmp
      {
        generated("hrsh7th/nvim-cmp"),
        config = function()
          require("plugins.cmp")
        end,
      },

      -- https://github.com/hrsh7th/cmp-path
      {
        generated("hrsh7th/cmp-path"),
      },

      -- https://github.com/hrsh7th/cmp-nvim-lsp
      {
        generated("hrsh7th/cmp-nvim-lsp"),
      },

      -- https://github.com/saadparwaiz1/cmp_luasnip
      {
        generated("saadparwaiz1/cmp_luasnip"),
      },
    })

    -- https://github.com/L3MON4D3/LuaSnip
    use({
      generated("L3MON4D3/LuaSnip"),
      config = function()
        require("plugins.luasnip")
      end,
    })

    -- https://github.com/neovim/nvim-lspconfig
    use({
      generated("neovim/nvim-lspconfig"),
      config = function()
        require("plugins.lsp")
      end
    })

    -- https://github.com/jose-elias-alvarez/null-ls.nvim
    use({
      generated("jose-elias-alvarez/null-ls.nvim"),
    })

    -- https://github.com/b0o/SchemaStore.nvim
    use({
      generated("b0o/schemastore.nvim"),
    })

    -- https://github.com/ThePrimeagen/harpoon
    use({
      generated("ThePrimeagen/harpoon"),
      config = function()
        require("plugins.harpoon")
      end,
    })

    -- https://github.com/norcalli/nvim-colorizer.lua
    use({
      generated("NvChad/nvim-colorizer.lua"),
      config = function()
        require("plugins.colorizer")
      end,
      ft = { 'javascript', 'typescript', 'vue', 'tsx', 'css', 'html', 'php' }
    })

    -- https://github.com/ThePrimeagen/git-worktree.nvim
    use({
      generated("ThePrimeagen/git-worktree.nvim"),
      config = function()
        require("plugins.git-worktree")
      end,
    })

    -- https://github.com/lewis6991/gitsigns.nvim
    use({
      generated("lewis6991/gitsigns.nvim"),
      config = function()
        require("plugins.gitsigns")
      end,
    })

    -- https://github.com/ruifm/gitlinker.nvim
    use({
      generated('ruifm/gitlinker.nvim'),
      config = function()
        require("plugins.gitlinker")
      end,
    })

    -- https://github.com/pwntester/octo.nvim
    use({
      generated("pwntester/octo.nvim"),
      cmd = 'Octo',
      config = function()
        require("plugins.octo")
      end
    })
  end,

  config = {
    display = {
      open_fn = require("packer.util").float,
    },
  },
})
