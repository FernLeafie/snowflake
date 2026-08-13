{
  inputs,
  config,
  pkgs,
  ...
}:
{
  fonts.fontconfig.defaultFonts.emoji = [
    "Twitter Color Emoji"
  ];

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    # Fonts
    twemoji-color-font
  ];
}
