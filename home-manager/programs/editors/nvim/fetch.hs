{-# LANGUAGE OverloadedStrings #-}

module Main where

import Data.Foldable
import Data.Text
import NvFetcher hiding (Branch, Revision)

type Branch = Text

type Revision = Text

main :: IO ()
main = runNvFetcher packageSet

packageSet :: PackageSet ()
packageSet = do
    -- Vitals
    plugin ("wbthomason", "packer.nvim")
    plugin ("lewis6991", "impatient.nvim")
    plugin ("nvim-lua", "plenary.nvim")

    plugin ("JoosepAlviste", "nvim-ts-context-commentstring")
    plugin ("nvim-treesitter", "playground")
    plugin ("windwp", "nvim-ts-autotag")
    plugin ("windwp", "nvim-autopairs")
    plugin ("p00f", "nvim-ts-rainbow")
    plugin ("nvim-telescope", "telescope.nvim")
    plugin ("nvim-telescope", "telescope-fzf-native.nvim")
    plugin ("nvim-telescope", "telescope-live-grep-args.nvim")
    plugin ("kyazdani42", "nvim-web-devicons")
    -- plugin ("yorickpeterse", "nvim-pqf")
    plugin ("is0n", "fm-nvim")
    plugin ("stevearc", "overseer.nvim")
    plugin ("kevinhwang91", "nvim-ufo")
    plugin ("kevinhwang91", "promise-async")
    plugin ("catppuccin", "nvim")
    plugin ("famiu", "bufdelete.nvim")
    plugin ("wellle", "targets.vim")
    plugin ("gpanders", "editorconfig.nvim")
    plugin ("SmiteshP", "nvim-navic")
    plugin ("anuvyklack", "hydra.nvim")
    plugin ("anuvyklack", "keymap-layer.nvim")
    plugin ("stevearc", "dressing.nvim")
    plugin ("chaoren", "vim-wordmotion")
    plugin ("numToStr", "Comment.nvim")
    plugin ("AndrewRadev", "splitjoin.vim")
    plugin ("folke", "todo-comments.nvim")
    plugin ("folke", "trouble.nvim")
    plugin ("folke", "noice.nvim")
    plugin ("MunifTanjim", "nui.nvim")
    plugin ("kylechui", "nvim-surround")
    -- plugin ("sQVe", "sort.nvim")
    plugin ("nvim-lualine", "lualine.nvim")
    plugin ("vimpostor", "vim-tpipeline")
    plugin ("mickael-menu", "zk-nvim")
    plugin ("hrsh7th", "nvim-cmp")
    plugin ("hrsh7th", "cmp-nvim-lsp")
    plugin ("hrsh7th", "cmp-cmdline")
    plugin ("hrsh7th", "cmp-path")
    plugin ("hrsh7th", "cmp-git")
    plugin ("saadparwaiz1", "cmp_luasnip")
    plugin ("onsails", "lspkind.nvim")
    plugin ("sindrets", "diffview.nvim")
    plugin ("L3MON4D3", "LuaSnip")
    plugin ("neovim", "nvim-lspconfig")
    plugin ("jose-elias-alvarez", "null-ls.nvim")
    plugin ("b0o", "SchemaStore.nvim")
    plugin ("ThePrimeagen", "harpoon")
    plugin ("ThePrimeagen", "git-worktree.nvim")
    plugin ("NvChad", "nvim-colorizer.lua")
    plugin ("lewis6991", "gitsigns.nvim")
    plugin ("ruifm", "gitlinker.nvim")
    plugin ("pwntester", "octo.nvim")

{- | Define a Neovim plugin fetching the latest rev.

 This wraps single quotes around each name to
 make sure it is valid input for nvchecker.
-}
plugin :: (Text, Text) -> PackageSet ()
plugin (owner, repo) = plugin' (owner, repo) Nothing

-- | Define a Neovim plugin fetching the latest rev from a branch
plugin' :: (Text, Text) -> Maybe Branch -> PackageSet ()
plugin' (owner, repo) branch =
    define $
        fetchGitHub src (owner, repo)
  where
    p = package (mconcat ["'plugin-", repo, "'"])
    url = mconcat ["https://github.com/", owner, "/", repo]
    src = case branch of
        Nothing -> sourceGit p url
        Just b -> sourceGit' p (url, b)

-- | Define a Neovim plugin with a pinned commit
plugin'' :: (Text, Text) -> Revision -> PackageSet ()
plugin'' (owner, repo) rev =
    define $
        p
            `sourceManual` rev
            `fetchGitHub` (owner, repo)
  where
    p = package (mconcat ["'plugin-", repo, "'"])

-- | Define a Treesitter grammar.
grammar :: (Text, Text) -> PackageSet ()
grammar (owner, repo) =
    define $
        package repo
            `sourceGit` mconcat ["https://github.com/", owner, "/", repo]
            `fetchGitHub` (owner, repo)
