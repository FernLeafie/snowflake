{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./boot.nix
    ./packages.nix
    ./niri.nix
    ./noctalia.nix
    ./catppuccin.nix
    ./gaming
    ./services
    ./system
  ];

  # Services
  # Enable networking
  networking.networkmanager.enable = true;

  # Enable Bluetooth
  hardware.bluetooth.enable = true;

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Enable audio
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  # Select localisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";
  # i18n.extraLocaleSettings = {
  #   LC_ADDRESS = "en_GB.UTF-8";
  #   LC_IDENTIFICATION = "en_GB.UTF-8";
  #   LC_MEASUREMENT = "en_GB.UTF-8";
  #   LC_MONETARY = "en_GB.UTF-8";
  #   LC_NAME = "en_GB.UTF-8";
  #   LC_NUMERIC = "en_GB.UTF-8";
  #   LC_PAPER = "en_GB.UTF-8";
  #   LC_TELEPHONE = "en_GB.UTF-8";
  #   LC_TIME = "en_GB.UTF-8";
  # };

  # Configure keymap in X11
  services.xserver.xkb.layout = "gb";
  services.xserver.xkb.options = "eurosign:e,caps:escape_shifted_capslock";
  # Set tty to use X11 keymap
  console = {
    useXkbConfig = true; # use xkb.options in tty.
  };

  # # firewall exception
  # networking.firewall = rec {
  #   allowedTCPPortRanges = [
  #     {
  #       from = 1714;
  #       to = 1764;
  #     } # KDE Connect
  #   ];
  #   allowedUDPPortRanges = allowedTCPPortRanges;
  # };

  # Nix options
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # nix.gc = {
  #   automatic = true;
  #   options = "--delete-older-than 7d";
  #   dates = "weekly";
  # };

  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      extraArgs = "--keep-since 4d --keep 3";
      dates = "weekly";
    };
  };

  nix = {
    # Enable flakes and nix command
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
    # setting for nixd
    nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?
}
