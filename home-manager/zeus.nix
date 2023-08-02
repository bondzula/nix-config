{ pkgs, outputs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "bondzula";
  home.homeDirectory = "/home/bondzula";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05";

  # Allow unfree software
  nixpkgs.config.allowUnfreePredicate = (pkg: true);

  # Import existing modules
  imports = [
    outputs.hmModules.console
    outputs.hmModules.php
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # TODO: Extract most common packages into a module
  home.packages = with pkgs; [
    wl-clipboard
    terraform # TODO: Move to project specific
    awscli2
    ssm-session-manager-plugin
    nodePackages.pnpm
    flyctl # TODO: Move to project specific
    supabase-cli # TODO: Move to project specific
    bitwarden
  ];

  # Enable the KDE Connect service
  services.kdeconnect = {
    enable = true;
    indicator = true;
  };
}
