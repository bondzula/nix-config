# User configuration for bat

{
  programs.bat = {
    enable = true;
    config = {
      theme = "Catppuccin-mocha";
    };
  };

  xdg.configFile."bat/themes" = {
    recursive = true;
    source = ./themes;
  };

  programs.zsh.shellAliases = { cat = "bat"; };
}
