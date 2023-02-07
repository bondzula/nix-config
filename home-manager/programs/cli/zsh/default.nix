{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    defaultKeymap = "emacs";

    history = {
      path = "${config.xdg.dataHome}/zsh/zsh_history";
      extended = true;
      ignoreDups = true;
      expireDuplicatesFirst = true;
    };

    shellAliases = {
      # Clean the home directory
      wget = "wget --hsts-file=$XDG_CACHE_HOME/wget_hsts";
    };

    initExtraFirst = ". /home/bondzula/.nix-profile/etc/profile.d/nix.sh";
    initExtra = "path+=('/home/bondzula/.npm-global/bin')\npath+=('/home/bondzula/.cargo/bin')\nexport PATH\neval \"$(fnm env --use-on-cd)\"";
    envExtra = "export DIRENV_LOG_FORMAT=\nexport XDG_CACHE_HOME=~/.cache";

    plugins = [
      {
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "v0.7.0";
          sha256 = "1g3pij5qn2j7v7jjac2a63lxd97mcsgw6xq6k5p7835q9fjiid98";
        };
      }
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "0.7.1";
          sha256 = "03r6hpb5fy4yaakqm3lbf4xcvd408r44jgpv4lnzl9asp4sb9qc0";
        };
      }
    ];
  };
}
