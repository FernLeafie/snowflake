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

  snow = {
    gaming.enable = true;
    graphical.enable = true;
    tooling = {
      typst.enable = true;
      nix.enable = true;
      rust.enable = false;
    };
    user-services.enable = true;
  };

  # Define your hostname and location
  networking.hostName = "aphrodite";
  time.timeZone = "Europe/Stockholm";

  # Define a user account. Don't forget to set a password with ‘passwd’
  users.users.fern-snowleafie = {
    isNormalUser = true;
    description = "Fern Snowleafie";
    extraGroups = [
      "wheel"
      "networkmanager"
    ]; # Enable ‘sudo’ for the user.
    shell = pkgs.fish;
  };
}
