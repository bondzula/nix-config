{
  programs.zellij = {
    enable = true;
  };

  # config file
  xdg.configFile."zellij/config.kdl" = {
    source = ./config.kdl;
  };

  xdg.configFile."zellij/layouts/custom-default.kdl" = {
    source = ./layouts/custom-default.kdl;
  };
}
