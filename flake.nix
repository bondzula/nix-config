{
  inputs = {
    # Nixpkgs
    nixpkgs = { url = "github:nixos/nixpkgs/nixos-unstable"; };
    nixpkgs-stable = { url = "github:nixos/nixpkgs/nixos-22.11"; };

    # Load hardware config for laptop
    hardware = { url = "github:NixOS/nixos-hardware/master"; };

    flake-parts = { url = "github:hercules-ci/flake-parts"; };

    nur = { url = "github:nix-community/NUR"; };
    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
    };

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    devenv = { url = "github:cachix/devenv/latest"; };
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = inputs@{ nixpkgs, flake-parts, home-manager, nur, ... }:

    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-darwin" ];

      flake = {
        nixosConfigurations = {
          nixos = nixpkgs.lib.nixosSystem {
            modules = [ ./modules/nixos ];
            specialArgs = { inherit inputs; };
          };
        };

        homeConfigurations = {
          "bondzula@nixos" = home-manager.lib.homeManagerConfiguration {
            pkgs = import nixpkgs {
              system = "x86_64-linux";
              overlays = [ nur.overlay inputs.neovim-nightly-overlay.overlay ];
              config.allowUnfree = true;
            };
            extraSpecialArgs = { inherit inputs; };
            modules = [ ./modules/home-manager ];
          };
        };
      };
    };
}
