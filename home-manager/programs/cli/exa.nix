# User configuration for exa

{ pkgs, ... }:

{
  # Install exa
  home.packages = [ pkgs.exa ];

  # Aliases
  programs.zsh.initExtra = ''
    alias ls="exa --all --group-directories-first --across"
    alias ll="exa --all --group-directories-first --long"
  '';
}
