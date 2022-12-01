{ inputs, lib, config, pkgs, ... }: {

  imports = [
    ./programs/cli
    ./programs/editors
  ];

  home = {
    username = "bondzula";
    homeDirectory = "/home/bondzula";
  };

  # Font config
  fonts.fontconfig.enable = true;

  # Enable home-manager and git
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "22.05";
}
