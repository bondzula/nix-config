{
  inputs = {
    # Nixpkgs
    nixpkgs = { url = "github:nixos/nixpkgs/nixos-unstable"; };

    flake-parts = { url = "github:hercules-ci/flake-parts"; };

    nur = { url = "github:nix-community/NUR"; };

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
              overlays = [ nur.overlay ];
              config.allowUnfree = true;
            };
            extraSpecialArgs = { inherit inputs; };
            modules = [ ./modules/home-manager ];
          };
        };
      };
    };
}
