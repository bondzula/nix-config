# User configuration for starship
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      # Disable AWS module
      aws = { disabled = true; };

      # Enable nix_shell
      nix_shell = {
        symbol = "❄️";
        format = "via [$symbol $state](bold blue)";
      };

      # Disable git modules
      git_branch = { disabled = true; };
      git_commit = { disabled = true; };
      git_state = { disabled = true; };
      git_status = { disabled = true; };
    };
  };
}
