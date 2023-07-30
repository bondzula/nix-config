{
  inputs = {
    # Nixpkgs
    nixpkgs = { url = "github:nixos/nixpkgs/nixos-unstable"; };
    nixpkgs-stable = { url = "github:nixos/nixpkgs/nixos-22.11"; };

    # Load hardware config for laptop
    hardware = { url = "github:NixOS/nixos-hardware/master"; };

    # Flake helpers
    flake-parts = { url = "github:hercules-ci/flake-parts"; };

    # For now only used for firefox plugins
    nur = { url = "github:nix-community/NUR"; };

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    devenv = { url = "github:cachix/devenv/latest"; };

    neovim-nightly-overlay = { url = "github:nix-community/neovim-nightly-overlay"; };
  };

  outputs = inputs@{ nixpkgs, flake-parts, home-manager, nur, neovim-nightly-overlay, ... }:

    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-darwin" ];

      flake = {
        nixosConfigurations = {
          "G14" = nixpkgs.lib.nixosSystem {
            modules = [ ./nixos/G14 ];
            specialArgs = { inherit inputs; };
          };
        };

        homeConfigurations = {
          "bondzula" = home-manager.lib.homeManagerConfiguration {
            pkgs = import nixpkgs {
              system = "x86_64-linux";
              overlays = [ nur.overlay neovim-nightly-overlay.overlay ];
              config.allowUnfree = true;
            };
            extraSpecialArgs = { inherit inputs; };
            modules = [ ./home-manager/g14.nix ];
          };
        };
      };
    };
}
