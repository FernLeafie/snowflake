{ pkgs, ... }:
{
  imports = [
    ./firefox
    ./dolphin.nix
    ./media.nix
    ./rmpc.nix
  ];
  programs.thunderbird = {
    enable = true;
    languagePacks = [ "en-GB" ];

    profiles.default = {
      isDefault = true;
      extensions = with pkgs.nur.repos.rycee.thunderbird-addons; [
        provider-for-google-calendar
      ];
    };
  };
  catppuccin.thunderbird.profile = "default";
}
