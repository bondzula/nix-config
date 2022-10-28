# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub }:
{
  "'plugin-Comment.nvim'" = {
    pname = "'plugin-Comment.nvim'";
    version = "ad7ffa8ed2279f1c8a90212c7d3851f9b783a3d6";
    src = fetchFromGitHub ({
      owner = "numToStr";
      repo = "Comment.nvim";
      rev = "ad7ffa8ed2279f1c8a90212c7d3851f9b783a3d6";
      fetchSubmodules = false;
      sha256 = "sha256-YJf4RKX/HZ8DfpyTqNXDk1hh7iCpGUmvhT+8VJViwr8=";
    });
    date = "2022-10-14";
  };
  "'plugin-LuaSnip'" = {
    pname = "'plugin-LuaSnip'";
    version = "663d54482b11bca1ce94f56993b9f6ab485a13dc";
    src = fetchFromGitHub ({
      owner = "L3MON4D3";
      repo = "LuaSnip";
      rev = "663d54482b11bca1ce94f56993b9f6ab485a13dc";
      fetchSubmodules = false;
      sha256 = "sha256-/uCFAunkN7zZqXlN8SnKl8Z2dUhRNqH020tIWDEe6dI=";
    });
    date = "2022-10-14";
  };
  "'plugin-SchemaStore.nvim'" = {
    pname = "'plugin-SchemaStore.nvim'";
    version = "0cd69c8a117243ac11160f7fdaa423dd95604e1f";
    src = fetchFromGitHub ({
      owner = "b0o";
      repo = "SchemaStore.nvim";
      rev = "0cd69c8a117243ac11160f7fdaa423dd95604e1f";
      fetchSubmodules = false;
      sha256 = "sha256-xfBA04I2LrhD3XRaSvJaRhdxIBl2ePb6PpmXpYmMrQw=";
    });
    date = "2022-10-28";
  };
  "'plugin-bufdelete.nvim'" = {
    pname = "'plugin-bufdelete.nvim'";
    version = "e88dbe0ba5829119d8edb5fc69d3c8553e324a93";
    src = fetchFromGitHub ({
      owner = "famiu";
      repo = "bufdelete.nvim";
      rev = "e88dbe0ba5829119d8edb5fc69d3c8553e324a93";
      fetchSubmodules = false;
      sha256 = "sha256-Zu1G3nt14vnEzjsy55IZAGCHHqPOQLZw2YcA1LcsSmI=";
    });
    date = "2022-10-07";
  };
  "'plugin-cmp-git'" = {
    pname = "'plugin-cmp-git'";
    version = "169202582f900b0e189eed5153b291383bfbba47";
    src = fetchFromGitHub ({
      owner = "hrsh7th";
      repo = "cmp-git";
      rev = "169202582f900b0e189eed5153b291383bfbba47";
      fetchSubmodules = false;
      sha256 = "sha256-1UjjqMBq3+B/TKVdYH4N3a0MZLs4LKoLsdAF0gyP0TY=";
    });
    date = "2021-10-29";
  };
  "'plugin-cmp-nvim-lsp'" = {
    pname = "'plugin-cmp-nvim-lsp'";
    version = "3cf38d9c957e95c397b66f91967758b31be4abe6";
    src = fetchFromGitHub ({
      owner = "hrsh7th";
      repo = "cmp-nvim-lsp";
      rev = "3cf38d9c957e95c397b66f91967758b31be4abe6";
      fetchSubmodules = false;
      sha256 = "sha256-4pppdlVJdn75/faaP3N+o7HgEHxyR1nvkHncnFXGDFA=";
    });
    date = "2022-10-16";
  };
  "'plugin-cmp-path'" = {
    pname = "'plugin-cmp-path'";
    version = "91ff86cd9c29299a64f968ebb45846c485725f23";
    src = fetchFromGitHub ({
      owner = "hrsh7th";
      repo = "cmp-path";
      rev = "91ff86cd9c29299a64f968ebb45846c485725f23";
      fetchSubmodules = false;
      sha256 = "sha256-thppiiV3wjIaZnAXmsh7j3DUc6ceSCvGzviwFUnoPaI=";
    });
    date = "2022-10-03";
  };
  "'plugin-cmp_luasnip'" = {
    pname = "'plugin-cmp_luasnip'";
    version = "18095520391186d634a0045dacaa346291096566";
    src = fetchFromGitHub ({
      owner = "saadparwaiz1";
      repo = "cmp_luasnip";
      rev = "18095520391186d634a0045dacaa346291096566";
      fetchSubmodules = false;
      sha256 = "sha256-Z5SPy3j2oHFxJ7bK8DP8Q/oRyLEMlnWyIfDaQcNVIS0=";
    });
    date = "2022-10-28";
  };
  "'plugin-diffview.nvim'" = {
    pname = "'plugin-diffview.nvim'";
    version = "94a3422415a092db1f2e00af5bd7db4ec1c6b8d7";
    src = fetchFromGitHub ({
      owner = "sindrets";
      repo = "diffview.nvim";
      rev = "94a3422415a092db1f2e00af5bd7db4ec1c6b8d7";
      fetchSubmodules = false;
      sha256 = "sha256-d0AfrZkS6XUw/q6VruLdO/uGQ74XD6jRv1V+x2EbjwU=";
    });
    date = "2022-10-26";
  };
  "'plugin-dressing.nvim'" = {
    pname = "'plugin-dressing.nvim'";
    version = "12b808a6867e8c38015488ad6cee4e3d58174182";
    src = fetchFromGitHub ({
      owner = "stevearc";
      repo = "dressing.nvim";
      rev = "12b808a6867e8c38015488ad6cee4e3d58174182";
      fetchSubmodules = false;
      sha256 = "sha256-qn84Ny9JsWRMFMYu/sir2RwlCk6IP+GSr7Zxn/Du+gw=";
    });
    date = "2022-10-03";
  };
  "'plugin-editorconfig.nvim'" = {
    pname = "'plugin-editorconfig.nvim'";
    version = "7d10fe6bc340fd783c0b61cf627dd235100284db";
    src = fetchFromGitHub ({
      owner = "gpanders";
      repo = "editorconfig.nvim";
      rev = "7d10fe6bc340fd783c0b61cf627dd235100284db";
      fetchSubmodules = false;
      sha256 = "sha256-+eLoPckZdsXqsyBGeM726P9WtR/pu0q7IEhKufulOxM=";
    });
    date = "2022-09-18";
  };
  "'plugin-fm-nvim'" = {
    pname = "'plugin-fm-nvim'";
    version = "8e6a77049330e7c797eb9e63affd75eb796fe75e";
    src = fetchFromGitHub ({
      owner = "is0n";
      repo = "fm-nvim";
      rev = "8e6a77049330e7c797eb9e63affd75eb796fe75e";
      fetchSubmodules = false;
      sha256 = "sha256-I29p08P4Wh/LLTDZIQ2TkYy5Kdj0G8loU6k3eFM+iVE=";
    });
    date = "2022-10-10";
  };
  "'plugin-git-worktree.nvim'" = {
    pname = "'plugin-git-worktree.nvim'";
    version = "d7f4e2584e81670154f07ca9fa5dd791d9c1b458";
    src = fetchFromGitHub ({
      owner = "ThePrimeagen";
      repo = "git-worktree.nvim";
      rev = "d7f4e2584e81670154f07ca9fa5dd791d9c1b458";
      fetchSubmodules = false;
      sha256 = "sha256-pkJkdt2XC1w0s1VpnxJFnoYiEgD01MZ7a5i2AlU1hMw=";
    });
    date = "2021-12-24";
  };
  "'plugin-gitlinker.nvim'" = {
    pname = "'plugin-gitlinker.nvim'";
    version = "c68d4873a14d2ae614875685ccca2e49472989e8";
    src = fetchFromGitHub ({
      owner = "ruifm";
      repo = "gitlinker.nvim";
      rev = "c68d4873a14d2ae614875685ccca2e49472989e8";
      fetchSubmodules = false;
      sha256 = "sha256-yPEKz2iahD1dwXCXeci9PmwJUaow9h8ybC/lSuwuJdM=";
    });
    date = "2022-09-26";
  };
  "'plugin-gitsigns.nvim'" = {
    pname = "'plugin-gitsigns.nvim'";
    version = "6321c884b1a462918b1a7c7c016bcc2f0944832c";
    src = fetchFromGitHub ({
      owner = "lewis6991";
      repo = "gitsigns.nvim";
      rev = "6321c884b1a462918b1a7c7c016bcc2f0944832c";
      fetchSubmodules = false;
      sha256 = "sha256-qSwngfHSckYHPOKcSjGEcEGCb0q3vCJedMfdIm7PTmg=";
    });
    date = "2022-10-28";
  };
  "'plugin-harpoon'" = {
    pname = "'plugin-harpoon'";
    version = "4dfe94e633945c14ad0f03044f601b8e6a99c708";
    src = fetchFromGitHub ({
      owner = "ThePrimeagen";
      repo = "harpoon";
      rev = "4dfe94e633945c14ad0f03044f601b8e6a99c708";
      fetchSubmodules = false;
      sha256 = "sha256-L3DnSmR6O2cI4uHTYj+E4vSP4slJthQmRal5+kyZJMs=";
    });
    date = "2022-10-06";
  };
  "'plugin-hydra.nvim'" = {
    pname = "'plugin-hydra.nvim'";
    version = "fa41a971765d4cce9c39185289f5a10894f66dbd";
    src = fetchFromGitHub ({
      owner = "anuvyklack";
      repo = "hydra.nvim";
      rev = "fa41a971765d4cce9c39185289f5a10894f66dbd";
      fetchSubmodules = false;
      sha256 = "sha256-4X9TAi/bH7JIKRuRYONcYVtSsmyz912V5KOI4QefC6U=";
    });
    date = "2022-10-02";
  };
  "'plugin-impatient.nvim'" = {
    pname = "'plugin-impatient.nvim'";
    version = "b842e16ecc1a700f62adb9802f8355b99b52a5a6";
    src = fetchFromGitHub ({
      owner = "lewis6991";
      repo = "impatient.nvim";
      rev = "b842e16ecc1a700f62adb9802f8355b99b52a5a6";
      fetchSubmodules = false;
      sha256 = "sha256-zUsj9JtyG1gNZ276mIs6uZtTWN9LRYiRlnZQlOyonuA=";
    });
    date = "2022-08-19";
  };
  "'plugin-keymap-layer.nvim'" = {
    pname = "'plugin-keymap-layer.nvim'";
    version = "e46840f9f377766e856964a49d7f351de3188a38";
    src = fetchFromGitHub ({
      owner = "anuvyklack";
      repo = "keymap-layer.nvim";
      rev = "e46840f9f377766e856964a49d7f351de3188a38";
      fetchSubmodules = false;
      sha256 = "sha256-IfIjh+FOzfI1AXT7n7zfBHLsPCeQoy6/XxWORULWu64=";
    });
    date = "2022-07-17";
  };
  "'plugin-lualine.nvim'" = {
    pname = "'plugin-lualine.nvim'";
    version = "3325d5d43a7a2bc9baeef2b7e58e1d915278beaf";
    src = fetchFromGitHub ({
      owner = "nvim-lualine";
      repo = "lualine.nvim";
      rev = "3325d5d43a7a2bc9baeef2b7e58e1d915278beaf";
      fetchSubmodules = false;
      sha256 = "sha256-pjpxV59Ej7tCvReP5nFi/h1veGwzLdw3PILC89+f488=";
    });
    date = "2022-10-23";
  };
  "'plugin-noice.nvim'" = {
    pname = "'plugin-noice.nvim'";
    version = "7e2e4491afb02422b26c241f9fb7f8960b51fe05";
    src = fetchFromGitHub ({
      owner = "folke";
      repo = "noice.nvim";
      rev = "7e2e4491afb02422b26c241f9fb7f8960b51fe05";
      fetchSubmodules = false;
      sha256 = "sha256-wocmqJKKAIW2qoRdJzo3A/G1+ALRXR9JTWpxWH+edz8=";
    });
    date = "2022-10-28";
  };
  "'plugin-nui.nvim'" = {
    pname = "'plugin-nui.nvim'";
    version = "d12a6977846b2fa978bff89b439e509320854e10";
    src = fetchFromGitHub ({
      owner = "MunifTanjim";
      repo = "nui.nvim";
      rev = "d12a6977846b2fa978bff89b439e509320854e10";
      fetchSubmodules = false;
      sha256 = "sha256-Xs7QSwxPgxxwoqmWvGVqSPlr5IZPm5oaFHBqseVEEr4=";
    });
    date = "2022-10-27";
  };
  "'plugin-null-ls.nvim'" = {
    pname = "'plugin-null-ls.nvim'";
    version = "f1add2302e6a01531a007c51054392d2029dbed4";
    src = fetchFromGitHub ({
      owner = "jose-elias-alvarez";
      repo = "null-ls.nvim";
      rev = "f1add2302e6a01531a007c51054392d2029dbed4";
      fetchSubmodules = false;
      sha256 = "sha256-zzOTWXW9HlzGbX8OnvrimuY1EiUAM5Il1Loi0UPpFBQ=";
    });
    date = "2022-10-26";
  };
  "'plugin-nvim'" = {
    pname = "'plugin-nvim'";
    version = "e695645298320e9714d10897aadee3cb5951567a";
    src = fetchFromGitHub ({
      owner = "catppuccin";
      repo = "nvim";
      rev = "e695645298320e9714d10897aadee3cb5951567a";
      fetchSubmodules = false;
      sha256 = "sha256-CUxc2CwRiRXHMfbt7QhYVSdx9HjPbRGIdlgnOn7Bfl0=";
    });
    date = "2022-10-28";
  };
  "'plugin-nvim-autopairs'" = {
    pname = "'plugin-nvim-autopairs'";
    version = "6b6e35fc9aca1030a74cc022220bc22ea6c5daf4";
    src = fetchFromGitHub ({
      owner = "windwp";
      repo = "nvim-autopairs";
      rev = "6b6e35fc9aca1030a74cc022220bc22ea6c5daf4";
      fetchSubmodules = false;
      sha256 = "sha256-O9QRLKr6I2csBxKE6fyvkcA7Vgs7PjaQSC4bB7yaWtE=";
    });
    date = "2022-10-27";
  };
  "'plugin-nvim-cmp'" = {
    pname = "'plugin-nvim-cmp'";
    version = "cdb77665bbf23bd2717d424ddf4bf98057c30bb3";
    src = fetchFromGitHub ({
      owner = "hrsh7th";
      repo = "nvim-cmp";
      rev = "cdb77665bbf23bd2717d424ddf4bf98057c30bb3";
      fetchSubmodules = false;
      sha256 = "sha256-ErdM+ETpkgBtAvA/RedqN+DXvunQ4OYl58HpfZQkz/s=";
    });
    date = "2022-10-22";
  };
  "'plugin-nvim-colorizer.lua'" = {
    pname = "'plugin-nvim-colorizer.lua'";
    version = "9dd7ecde55b06b5114e1fa67c522433e7e59db8b";
    src = fetchFromGitHub ({
      owner = "NvChad";
      repo = "nvim-colorizer.lua";
      rev = "9dd7ecde55b06b5114e1fa67c522433e7e59db8b";
      fetchSubmodules = false;
      sha256 = "sha256-pHdNHjR3QgnYnnP1Ay56cJuwRZ0AzqagdB4gM9Hvu9I=";
    });
    date = "2022-09-28";
  };
  "'plugin-nvim-lspconfig'" = {
    pname = "'plugin-nvim-lspconfig'";
    version = "2315a397fd5057e3a74a09a240f606af28447ebf";
    src = fetchFromGitHub ({
      owner = "neovim";
      repo = "nvim-lspconfig";
      rev = "2315a397fd5057e3a74a09a240f606af28447ebf";
      fetchSubmodules = false;
      sha256 = "sha256-wMZ7YngqVHw1t0+ZPIg2kK26LZBFnxcIiJ0i3xkdHuc=";
    });
    date = "2022-10-26";
  };
  "'plugin-nvim-navic'" = {
    pname = "'plugin-nvim-navic'";
    version = "9f7f0b797096ee852106c4fd47b6b13d0ebb364e";
    src = fetchFromGitHub ({
      owner = "SmiteshP";
      repo = "nvim-navic";
      rev = "9f7f0b797096ee852106c4fd47b6b13d0ebb364e";
      fetchSubmodules = false;
      sha256 = "sha256-W8DbHrgqaI8RqkquTC9Qr5jEYvlEPC3tgLLeC07QC/8=";
    });
    date = "2022-10-25";
  };
  "'plugin-nvim-surround'" = {
    pname = "'plugin-nvim-surround'";
    version = "7e5096b736ae252d04d543af6a13280125dc6d0f";
    src = fetchFromGitHub ({
      owner = "kylechui";
      repo = "nvim-surround";
      rev = "7e5096b736ae252d04d543af6a13280125dc6d0f";
      fetchSubmodules = false;
      sha256 = "sha256-EcygUu05HRYPbF71CIgrxitphFSkxdv+oP5ItwBDCsM=";
    });
    date = "2022-10-28";
  };
  "'plugin-nvim-ts-autotag'" = {
    pname = "'plugin-nvim-ts-autotag'";
    version = "fdefe46c6807441460f11f11a167a2baf8e4534b";
    src = fetchFromGitHub ({
      owner = "windwp";
      repo = "nvim-ts-autotag";
      rev = "fdefe46c6807441460f11f11a167a2baf8e4534b";
      fetchSubmodules = false;
      sha256 = "sha256-ltGiYNXWpWSI5RrWTVR+k6SZjcZbsHtH5m9uHTMKnzM=";
    });
    date = "2022-08-11";
  };
  "'plugin-nvim-ts-context-commentstring'" = {
    pname = "'plugin-nvim-ts-context-commentstring'";
    version = "2941f0064874b33e93d3a794a8a4e99f5f6ece56";
    src = fetchFromGitHub ({
      owner = "JoosepAlviste";
      repo = "nvim-ts-context-commentstring";
      rev = "2941f0064874b33e93d3a794a8a4e99f5f6ece56";
      fetchSubmodules = false;
      sha256 = "sha256-L2xy6mp69X5pmfN5V2YQX5vbiYtyPsDSVOpWnsZmAsM=";
    });
    date = "2022-10-14";
  };
  "'plugin-nvim-ts-rainbow'" = {
    pname = "'plugin-nvim-ts-rainbow'";
    version = "1ec3f880585c644ddd50a51502c59f4e36f03e62";
    src = fetchFromGitHub ({
      owner = "p00f";
      repo = "nvim-ts-rainbow";
      rev = "1ec3f880585c644ddd50a51502c59f4e36f03e62";
      fetchSubmodules = false;
      sha256 = "sha256-sNCatQu1U5V5dlxRayXacxSfWPUgL6Si0na2XHodgAw=";
    });
    date = "2022-09-30";
  };
  "'plugin-nvim-ufo'" = {
    pname = "'plugin-nvim-ufo'";
    version = "9d59d713c484d90790f53045a5b4685fb0686ff6";
    src = fetchFromGitHub ({
      owner = "kevinhwang91";
      repo = "nvim-ufo";
      rev = "9d59d713c484d90790f53045a5b4685fb0686ff6";
      fetchSubmodules = false;
      sha256 = "sha256-mEXoXKVeKbVSoMCzfNEOoB3fhuRPba3g7iIn9IfTdMs=";
    });
    date = "2022-10-27";
  };
  "'plugin-nvim-web-devicons'" = {
    pname = "'plugin-nvim-web-devicons'";
    version = "9061e2d355ecaa2b588b71a35e7a11358a7e51e1";
    src = fetchFromGitHub ({
      owner = "kyazdani42";
      repo = "nvim-web-devicons";
      rev = "9061e2d355ecaa2b588b71a35e7a11358a7e51e1";
      fetchSubmodules = false;
      sha256 = "sha256-kpg9K8WtZHp5FP+23AQK3W0yQOK1ZB6z8kHvy8jcHxM=";
    });
    date = "2022-10-17";
  };
  "'plugin-octo.nvim'" = {
    pname = "'plugin-octo.nvim'";
    version = "b75630f93822a569f3fc2360bb2066ec1b205bd0";
    src = fetchFromGitHub ({
      owner = "pwntester";
      repo = "octo.nvim";
      rev = "b75630f93822a569f3fc2360bb2066ec1b205bd0";
      fetchSubmodules = false;
      sha256 = "sha256-8UQp6gCsY83HJ6FmEzXjffjSJoFvJs4TIUM/5F9jrfE=";
    });
    date = "2022-10-18";
  };
  "'plugin-overseer.nvim'" = {
    pname = "'plugin-overseer.nvim'";
    version = "5f16178372fe24d5afa7f5cb871c5a86548e886b";
    src = fetchFromGitHub ({
      owner = "stevearc";
      repo = "overseer.nvim";
      rev = "5f16178372fe24d5afa7f5cb871c5a86548e886b";
      fetchSubmodules = false;
      sha256 = "sha256-G0Yns0wt5w16m1ME4XEiSjyTq4Wb3DC2CL7VxpG5d3o=";
    });
    date = "2022-10-27";
  };
  "'plugin-packer.nvim'" = {
    pname = "'plugin-packer.nvim'";
    version = "6afb67460283f0e990d35d229fd38fdc04063e0a";
    src = fetchFromGitHub ({
      owner = "wbthomason";
      repo = "packer.nvim";
      rev = "6afb67460283f0e990d35d229fd38fdc04063e0a";
      fetchSubmodules = false;
      sha256 = "sha256-CiDvG7OFg6T/e0xPm7u1rCSnnPwSLATYtjhEw0jlp/M=";
    });
    date = "2022-09-10";
  };
  "'plugin-playground'" = {
    pname = "'plugin-playground'";
    version = "e6a0bfaf9b5e36e3a327a1ae9a44a989eae472cf";
    src = fetchFromGitHub ({
      owner = "nvim-treesitter";
      repo = "playground";
      rev = "e6a0bfaf9b5e36e3a327a1ae9a44a989eae472cf";
      fetchSubmodules = false;
      sha256 = "sha256-wst6YwtTJbR65+jijSSgsS9Isv1/vO9uAjuoUg6tVQc=";
    });
    date = "2022-09-19";
  };
  "'plugin-plenary.nvim'" = {
    pname = "'plugin-plenary.nvim'";
    version = "4b7e52044bbb84242158d977a50c4cbcd85070c7";
    src = fetchFromGitHub ({
      owner = "nvim-lua";
      repo = "plenary.nvim";
      rev = "4b7e52044bbb84242158d977a50c4cbcd85070c7";
      fetchSubmodules = false;
      sha256 = "sha256-lIdBrVpi+vUudeotjFAuw4C0VT8TPoFE9cVVAQEsAYU=";
    });
    date = "2022-10-01";
  };
  "'plugin-promise-async'" = {
    pname = "'plugin-promise-async'";
    version = "70b09063cdf029079b25c7925e4494e7416ee995";
    src = fetchFromGitHub ({
      owner = "kevinhwang91";
      repo = "promise-async";
      rev = "70b09063cdf029079b25c7925e4494e7416ee995";
      fetchSubmodules = false;
      sha256 = "sha256-rGbi5nCCz1qO6CzoWxbze8iKWP6baqIZBd/Je2LU6jw=";
    });
    date = "2022-09-20";
  };
  "'plugin-splitjoin.vim'" = {
    pname = "'plugin-splitjoin.vim'";
    version = "956d67c88512b91c2938da3a9e0aeeea2b82cd0b";
    src = fetchFromGitHub ({
      owner = "AndrewRadev";
      repo = "splitjoin.vim";
      rev = "956d67c88512b91c2938da3a9e0aeeea2b82cd0b";
      fetchSubmodules = false;
      sha256 = "sha256-frMb0OXp0e+cg5mtEjAzO//iMnajTOBUiNrR3viuAUA=";
    });
    date = "2022-09-04";
  };
  "'plugin-targets.vim'" = {
    pname = "'plugin-targets.vim'";
    version = "8d6ff2984cdfaebe5b7a6eee8f226a6dd1226f2d";
    src = fetchFromGitHub ({
      owner = "wellle";
      repo = "targets.vim";
      rev = "8d6ff2984cdfaebe5b7a6eee8f226a6dd1226f2d";
      fetchSubmodules = false;
      sha256 = "sha256-Sd+2dppKHpa7ONK6JgCAFKwjDMueaChFtSF0YvrAXKQ=";
    });
    date = "2019-12-08";
  };
  "'plugin-telescope-fzf-native.nvim'" = {
    pname = "'plugin-telescope-fzf-native.nvim'";
    version = "65c0ee3d4bb9cb696e262bca1ea5e9af3938fc90";
    src = fetchFromGitHub ({
      owner = "nvim-telescope";
      repo = "telescope-fzf-native.nvim";
      rev = "65c0ee3d4bb9cb696e262bca1ea5e9af3938fc90";
      fetchSubmodules = false;
      sha256 = "sha256-hdQuS7AcvN5vIXBJnSwFsuyvX89+XDrSsea9TBWF21s=";
    });
    date = "2022-09-06";
  };
  "'plugin-telescope-live-grep-args.nvim'" = {
    pname = "'plugin-telescope-live-grep-args.nvim'";
    version = "54eaae1a84b51e2774c7b6f948d70dd11d46dee5";
    src = fetchFromGitHub ({
      owner = "nvim-telescope";
      repo = "telescope-live-grep-args.nvim";
      rev = "54eaae1a84b51e2774c7b6f948d70dd11d46dee5";
      fetchSubmodules = false;
      sha256 = "sha256-GAJuPtxbGp+JGHjE4IhqJaZzXB2d25Z28EdW848FSdw=";
    });
    date = "2022-10-27";
  };
  "'plugin-telescope.nvim'" = {
    pname = "'plugin-telescope.nvim'";
    version = "97847309cbffbb33e442f07b8877d20322a26922";
    src = fetchFromGitHub ({
      owner = "nvim-telescope";
      repo = "telescope.nvim";
      rev = "97847309cbffbb33e442f07b8877d20322a26922";
      fetchSubmodules = false;
      sha256 = "sha256-QK7JcPtRMqIUni1VbVdf2o+5tGLH0NksuMaG02BWCpo=";
    });
    date = "2022-10-26";
  };
  "'plugin-todo-comments.nvim'" = {
    pname = "'plugin-todo-comments.nvim'";
    version = "530eb3a896e9eef270f00f4baafa102361afc93b";
    src = fetchFromGitHub ({
      owner = "folke";
      repo = "todo-comments.nvim";
      rev = "530eb3a896e9eef270f00f4baafa102361afc93b";
      fetchSubmodules = false;
      sha256 = "sha256-8sSPpg6G/EHVCm2bZV5LZHn/+Kxdq47IEum4oWyrYa4=";
    });
    date = "2022-10-28";
  };
  "'plugin-trouble.nvim'" = {
    pname = "'plugin-trouble.nvim'";
    version = "ed65f84abc4a1e5d8f368d7e02601fc0357ea15e";
    src = fetchFromGitHub ({
      owner = "folke";
      repo = "trouble.nvim";
      rev = "ed65f84abc4a1e5d8f368d7e02601fc0357ea15e";
      fetchSubmodules = false;
      sha256 = "sha256-kpOJnyAStqx+R5iMLpHAiW1h8ljjnSAwKgvFi667M1Y=";
    });
    date = "2022-10-14";
  };
  "'plugin-vim-tpipeline'" = {
    pname = "'plugin-vim-tpipeline'";
    version = "abd013d512e58b3770fab65a3230cd840a24475c";
    src = fetchFromGitHub ({
      owner = "vimpostor";
      repo = "vim-tpipeline";
      rev = "abd013d512e58b3770fab65a3230cd840a24475c";
      fetchSubmodules = false;
      sha256 = "sha256-nXJMqEmc3d07TEVjNno+7rs9sXdM681AD0kenJZQHUE=";
    });
    date = "2022-10-23";
  };
  "'plugin-vim-wordmotion'" = {
    pname = "'plugin-vim-wordmotion'";
    version = "5dd613ed68a0ecf0fc6c11cd4098c03583786bf0";
    src = fetchFromGitHub ({
      owner = "chaoren";
      repo = "vim-wordmotion";
      rev = "5dd613ed68a0ecf0fc6c11cd4098c03583786bf0";
      fetchSubmodules = false;
      sha256 = "sha256-0Rzd+td/8S9vR/AJU058HX2auBAm+rNNAKAm2ribPl0=";
    });
    date = "2022-07-04";
  };
  "'plugin-zk-nvim'" = {
    pname = "'plugin-zk-nvim'";
    version = "73affbc95fba3655704e4993a8929675bc9942a1";
    src = fetchFromGitHub ({
      owner = "mickael-menu";
      repo = "zk-nvim";
      rev = "73affbc95fba3655704e4993a8929675bc9942a1";
      fetchSubmodules = false;
      sha256 = "sha256-BQrF88hVSDc9zjCWcSSCnw1yhCfMu8zsMbilAI0Xh2c=";
    });
    date = "2022-07-14";
  };
}
