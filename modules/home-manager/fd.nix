# User configuration for fd

{ pkgs, ... }:

{
  # Install fd
  home.packages = [ pkgs.fd ];

  # Default options
  programs.zsh.shellAliases = { fd = "fd --hidden"; };
}
