{
  description = "You new nix config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hardware.url = "github:nixos/nixos-hardware";

    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Hyprland WM
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { nixpkgs, home-manager, hyprland, ... }@inputs:
    let
      forAllSystems = nixpkgs.lib.genAttrs [
        "aarch64-linux"
        "i686-linux"
        "x86_64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
    in rec {
      # Your custom packages and modifications
      overlays = { default = import ./overlay { inherit inputs; }; };

      # Reusable nixos modules you might want to export
      # These are usually stuff you would upstream into nixpkgs
      nixosModules = import ./modules/nixos;
      # Reusable home-manager modules you might want to export
      # These are usually stuff you would upstream into home-manager
      homeManagerModules = import ./modules/home-manager;

      # Devshell for bootstrapping
      # Acessible through 'nix develop' or 'nix-shell' (legacy)
      devShells = forAllSystems (system: {
        default = legacyPackages.${system}.callPackage ./shell.nix { };
      });

      # This instantiates nixpkgs for each system listed above
      # Allowing you to add overlays and configure it (e.g. allowUnfree)
      # Our configurations will use these instances
      # Your flake will also let you access your package set through nix build, shell, run, etc.
      legacyPackages = forAllSystems (system:
        import inputs.nixpkgs {
          inherit system;
          # This adds our overlays to pkgs
          overlays = builtins.attrValues overlays;
          config.allowUnfree = true;
        });

      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          pkgs = legacyPackages.x86_64-linux;
          specialArgs = { inherit inputs; }; # Pass flake inputs to our config
          modules = (builtins.attrValues nixosModules) ++ [
            ./nixos/configuration.nix
            hyprland.nixosModules.default
            { programs.hyprland.enable = true; }
          ];
        };
      };

      homeConfigurations = {
        "bondzula@nixos" = home-manager.lib.homeManagerConfiguration {
          pkgs = legacyPackages.x86_64-linux;
          extraSpecialArgs = {
            inherit inputs;
          }; # Pass flake inputs to our config
          modules = (builtins.attrValues homeManagerModules) ++ [
            # > Our main home-manager configuration file <
            ./home-manager/home.nix

            # Setup hyperland
            hyprland.homeManagerModules.default
            { wayland.windowManager.hyprland.enable = true; }
          ];
        };
        "bondzula@wsl" = home-manager.lib.homeManagerConfiguration {
          pkgs = legacyPackages.x86_64-linux;
          extraSpecialArgs = {
            inherit inputs;
          }; # Pass flake inputs to our config
          modules = (builtins.attrValues homeManagerModules) ++ [
            # > Our main home-manager configuration file <
            ./home-manager/wsl.nix
          ];
        };
      };
    };
}
