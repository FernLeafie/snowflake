{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/nixos
    ./../../modules/shared
  ];

  environment.systemPackages = with pkgs; [
    wine64
    keychron-udev-rules
  ];

  # PURGE THE HELL SOFTWARE
  programs.nano.enable = false;

  snow = {
    profiles.laptop.enable = true;

    programs.firefox.extraExtensions = with pkgs.nur.repos.rycee.firefox-addons; [
      scriptcat
    ];
    user-services = {
      proton-vpn.enable = true;
    };
    tooling = {
      # Waifi Loves it <3
      typst.enable = true;

      # Its a nix system tf did u expect.
      nix.enable = true;

      # Actually good language.
      rust.enable = true;

      # MC-Mods
      java.enable = true;

      # Uni-Langs
      c-sharp.enable = true;
      python.enable = true;

    };
    gaming = {
      enable = true;
      steam.millennium.enable = false;
      star-citizen.enable = true;
      osu-lazer.enable = true;
      emulation.enable = true;
    };
    gamedev.enable = true;
    content-creation.enable = true;
    graphical.enable = true;
  };

  # Define your hostname and location
  networking.hostName = "apollo";
  time.timeZone = "Europe/London";

  # Define a user account. Don't forget to set a password with ‘passwd’
  users.users.lily-snowleafie = {
    isNormalUser = true;
    description = "Lily Snowleafie";
    extraGroups = [
      "wheel"
      "networkmanager"
    ]; # Enable ‘sudo’ for the user.
    shell = pkgs.fish;

    # should this be a secret? mayhaps, but it's not like it will be used outside build-vm either way
    initialHashedPassword = "$6$r7QyEAiR$LJe8XE2OfbpS8lJ.qGSSuQbjomvN8RLz/JovUpqmi77bd/29o3vMkYEMBd94mi2VWLKbtkbXcM96sbh0r/eKt1";
  };
  
  # [NOTE] fixes weird framework bluetooth issues
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        # Shows battery charge of connected devices on supported
        # Bluetooth adapters. Defaults to 'false'.
        Experimental = true;
        # When enabled other devices can connect faster to us, however
        # the tradeoff is increased power consumption. Defaults to
        # 'false'.
        FastConnectable = true;
      };
      Policy = {
        # Enable all controllers when they are found. This includes
        # adapters present on start as well as adapters that are plugged
        # in later on. Defaults to 'true'.
        AutoEnable = true;
      };
    };
  };
}
