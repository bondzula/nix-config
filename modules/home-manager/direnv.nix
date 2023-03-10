{
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv = { enable = true; };
  };

  programs.zsh.envExtra = ''
    export DIRENV_LOG_FORMAT=""
  '';
}
