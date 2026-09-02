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

  environment.systemPackages = [ pkgs.proton-vpn pkgs.wine64 pkgs.keychron-udev-rules ];

  snow = {
    programs.firefox.extraExtensions = with pkgs.nur.repos.rycee.firefox-addons; [
      scriptcat
    ];
    gaming.enable = true;
    graphical.enable = true;
    writing.enable = true;
    tooling = {
      typst.enable = true;
      nix.enable = true;
      rust.enable = false;
      java.enable = true;
    };
    user-services.enable = true;
    gaming.star-citizen.enable = true;
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
