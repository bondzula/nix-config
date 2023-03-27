# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)

{ inputs, lib, config, pkgs, ... }: {

  imports = [
    # Load Asus hardware module
    inputs.hardware.nixosModules.asus-zephyrus-ga402

    # Import your generated (nixos-generate-config) hardware configuration
    ./hardware-configuration.nix
  ];

  nix = {
    # This will add each flake input as a registry
    # To make nix3 commands consistent with your flake
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

    # This will additionally add your inputs to the system's legacy channels
    # Making legacy nix commands consistent as well, awesome!
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}")
      config.nix.registry;
  };

  nix = {
    settings = {
      # Enable flakes and new 'nix' command
      experimental-features = "nix-command flakes";
      # Deduplicate and optimize nix store
      auto-optimise-store = true;
    };
  };

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  # Setup keyfile
  boot.initrd.secrets = { "/crypto_keyfile.bin" = null; };

  # Enable swap on luks
  boot.initrd.luks.devices."luks-f15bc937-a47e-464e-abbb-b2debd276abb".device =
    "/dev/disk/by-uuid/f15bc937-a47e-464e-abbb-b2debd276abb";
  boot.initrd.luks.devices."luks-f15bc937-a47e-464e-abbb-b2debd276abb".keyFile =
    "/crypto_keyfile.bin";

  # Custom kernel version
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_6_2;

  # Hostname
  networking.hostName = "nixos";

  # Enable networking
  networking.networkmanager.enable = true;

  networking.firewall = {
    enable = true;
    allowedTCPPortRanges = [{
      from = 1714;
      to = 1764;
    } # KDE Connect
      ];
    allowedUDPPortRanges = [{
      from = 1714;
      to = 1764;
    } # KDE Connect
      ];
  };

  # Enable Bluetooth
  hardware.bluetooth.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Belgrade";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.utf8";

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.dpi = 1;

  # Enable the KDE Plasma Desktop Environment.
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.displayManager.defaultSession = "plasmawayland";
  services.xserver.displayManager.autoLogin.user = "bondzula";

  services.xserver.desktopManager.plasma5 = {
    enable = true;
  };
  environment.plasma5.excludePackages = with pkgs.libsForQt5; [ konsole ];

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing = {
    enable = true;
    drivers = with pkgs; [ brlaser ];
    cups-pdf.enable = true;
  };

  # Enable sound with pipewire.
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  # The portal interfaces include APIs for file access, opening URIs,
  # printing and others.
  services.dbus.enable = true;
  xdg.portal = {
    enable = true;

    # gtk portal needed to make gtk apps happy
    extraPortals =
      [ pkgs.xdg-desktop-portal-gtk pkgs.libsForQt5.xdg-desktop-portal-kde ];
  };

  # Enable zsh
  programs.zsh.enable = true;

  # Install Docker
  virtualisation.docker.enable = true;

  # Users config
  users.users = {
    bondzula = {
      isNormalUser = true;
      openssh.authorizedKeys.keys = [ ];
      extraGroups = [ "wheel" "networkmanager" "docker" ];
      shell = pkgs.zsh;
    };
  };

  # Fix the issue of password not working
  security.pam.services.swaylock = { };

  # This setups a SSH server. Very important if you're setting up a headless system.
  # Feel free to remove if you don't need it.
  services.openssh = {
    enable = true;
    # Forbid root login through SSH.
    settings.PermitRootLogin = "no";
    # Use keys only. Remove if you want to SSH using password (not recommended)
    settings.PasswordAuthentication = false;
  };

  # Disable power-profiles-daemon
  services.power-profiles-daemon.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?
}
