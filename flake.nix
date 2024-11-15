{
  description = "Bondzula's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hardware.url = "github:NixOS/nixos-hardware/master";

    devenv.url = "github:cachix/devenv";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    mac-app-util.url = "github:hraban/mac-app-util";
  };

  outputs = { self, nixpkgs, home-manager, mac-app-util, ... } @ inputs:
    let
      inherit (self) outputs;
      system = "aarch64-darwin";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      # Set project formatter
      formatter.${system} = pkgs.nixpkgs-fmt;

      # Reusable nixos modules
      nixosModules = import ./modules/nixos;
      # Reusable home manager modules
      hmModules = import ./modules/home-manager;

      # NixOS configurations
      nixosConfigurations = {
        "zeus" = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [ ./nixos/zeus ];
        };

        "apollo" = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [ ./nixos/apollo ];
        };
      };

      # Home Manager configurations
      homeConfigurations = {
        "bondzula" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [ ./home-manager/zeus.nix ];
        };

        "stefanbondzulic@hydrogen" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [
            mac-app-util.homeManagerModules.default
            inputs.devenv.flakeModule
            ./home-manager/macos.nix
          ];
        };
      };
    };
}
