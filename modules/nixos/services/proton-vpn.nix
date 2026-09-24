{
  config,
  lib,
  pkgs,
  ...
}:
{
  config = lib.mkIf config.snow.user-services.proton-vpn.enable {
    environment.systemPackages = with pkgs; [
      proton-vpn
      (makeAutostartItem {
        name = "proton.vpn.app.gtk";
        package = pkgs.proton-vpn;
        appendExtraArgs = [ "--start-minimized" ];
      })
    ];
  };
}
