{ pkgs, ... }:

{
  home.packages = with pkgs; [
    atuin
  ];

  xdg.configFile."atuin/config.toml" = {
    source = ./config.toml;
  };
}
