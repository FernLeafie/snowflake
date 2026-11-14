{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (lib.modules) mkIf;
  cfg = config.snow.user-services.proton-vpn;
in
{
  config = mkIf cfg.enable {
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
