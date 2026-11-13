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
    writing.enable = true;
    tooling = {
      c.enable = true;
      latex.enable = true;
      nix.enable = true;
      rust.enable = true;
      typst.enable = true;
    };
    user-services.enable = true;
    services.tailscale.enable = true;
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

    # should this be a secret? mayhaps, but it's not like it will be used outside build-vm either way
    initialHashedPassword = "$6$r7QyEAiR$LJe8XE2OfbpS8lJ.qGSSuQbjomvN8RLz/JovUpqmi77bd/29o3vMkYEMBd94mi2VWLKbtkbXcM96sbh0r/eKt1";
  };
  # Device specific settings
  environment.systemPackages = with pkgs; [
    geogebra6
  ];
  fonts.packages = with pkgs; [
    vollkorn
  ];
}
