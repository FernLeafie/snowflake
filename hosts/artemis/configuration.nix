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
    programs.firefox.extraExtensions = with pkgs.nur.repos.rycee.firefox-addons; [
      scriptcat
    ];
    gamedev.enable = true;
    gaming = {
      enable = true;
      star-citizen.enable = true;
    };
    graphical.enable = true;
    writing.enable = true;
    tooling = {
      typst.enable = true;
      nix.enable = true;
      rust.enable = false;
    };
    user-services.enable = true;
  };

  # Define your hostname and location
  networking.hostName = "artemis";
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

  # Device specific settings
  hardware.ckb-next.enable = true; # Corsair keyboard driver
  environment.systemPackages = with pkgs; [
    (makeAutostartItem {
      name = "ckb-next";
      package = pkgs.ckb-next;
      appendExtraArgs = [ "--background" ];
    }) # also starts ckb-next, since without it lights dont apply
  ];
  fonts.packages = with pkgs; [
    vollkorn
  ];
}
