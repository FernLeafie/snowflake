{
  pkgs,
  inputs,
  config,
  ...
}:
{
  imports = [
    inputs.noctalia-greeter.nixosModules.default
  ];

  environment.systemPackages = with pkgs; [
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    ddcutil
  ];
  hardware.i2c.enable = true; # needed for ferns monitors

  programs.noctalia-greeter = {
    enable = true;

    settings = {
      idle.timeout = 300;
      appearance = {
        hide_logo = true;
      };
      cursor = {
        theme = "breeze_cursors";
        size = 24;
        path = "${pkgs.kdePackages.breeze}/share/icons";
      };
      keyboard = {
        layout = "${config.services.xserver.xkb.layout}";
        options = "${config.services.xserver.xkb.options}";
      };
    };
  };
  nix.settings = {
    substituters = [ "https://noctalia.cachix.org" ];
    trusted-public-keys = [
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
    ];
  };
}
