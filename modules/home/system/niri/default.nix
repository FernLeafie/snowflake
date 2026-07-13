{ config, lib, ... }:
{
  # [HACK] Currently a bit hacky solution since the config field doesn't support line concatenation
  # hopefully the settings field will support all needed parameters in the future
  programs.niri = lib.mkMerge [
    (lib.mkIf (config.home.username != "fern-snowleafie") {
      config = builtins.readFile ./niri.kdl;
    })
    (lib.mkIf (config.home.username == "fern-snowleafie") {
      config = builtins.readFile ./niri.kdl + ''
        // Example: enable rounded corners for all windows.
        // (This example rule is commented out with a "/-" in front.)
        window-rule {
          geometry-corner-radius 10
          clip-to-geometry true
        }
      '';
    })
  ];
}
