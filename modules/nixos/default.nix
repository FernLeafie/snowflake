{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (lib.modules) mkIf;
  cfgprof = config.snow.profiles;
in 
{
  imports = [
    ./boot.nix
    ./packages.nix
    ./networking.nix
    ./niri.nix
    ./nix.nix
    ./noctalia.nix
    ./catppuccin.nix
    ./security.nix
    ./gaming
    ./services
    ./system
  ];

  # Services
  # Enable Bluetooth
  hardware.bluetooth.enable = true;

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Enable audio
  services.pipewire = mkIf cfgprof.graphical.enable {
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

  # [NOTE] fern pls figure out where to put this
  # idk how this works really, nixpkgs#390897
  virtualisation.vmVariant = {
    # needed for niri to work, made obsolete when nixpkgs#279009 is merged
    virtualisation.qemu.options = [
      "-device virtio-vga-gl"
      "-display gtk,gl=on"
      "-vga none"
    ];
  };

  # Nix options
  # Allow unfree packages
  nixpkgs = {
    config.allowUnfree = true;
    overlays = [
      inputs.nur.overlays.default
    ];
  };

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

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?
}
