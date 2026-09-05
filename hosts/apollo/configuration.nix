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

  environment.systemPackages = [
    pkgs.proton-vpn
    pkgs.wine64
    pkgs.keychron-udev-rules
  ];

  snow = {
    programs.firefox.extraExtensions = with pkgs.nur.repos.rycee.firefox-addons; [
      scriptcat
    ];
    tooling = {
      typst.enable = true;
      nix.enable = true;
      rust.enable = false;
      java.enable = true;
    };
    gaming = {
      enable = true;
      steam.millennium.enable = false;
      star-citizen.enable = true;
      osu-lazer.enable = true;
    };
    gamedev.enable = true;
    content-creation.enable = true;
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
  };
}
