{
  inputs,
  config,
  pkgs,
  ...
}:
{
  nix = {
    package = pkgs.lixPackageSets.latest.lix;
    # [NOTE] consider breaking out
    settings = {
      # Enable flakes and nix command
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      # always-allow-substitutes = true;

      # accepting nix configuration from a flake without asking, security risk
      accept-flake-config = false;

      # automatically optimises the store by replacing identical files with hardlinks
      auto-optimise-store = true;

      # unneeded as it mostly comes up when working on a flake
      warn-dirty = false;

      # sandboxing if platform is linux
      sandbox = pkgs.stdenv.hostPlatform.isLinux;

      # users or groups which are allowed to manage the nix store
      trusted-users = [ "@wheel" ];

      # put nix files such as nix-profile in under xdg directories
      use-xdg-base-directories = true;
    };

    # setting for nixd
    nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
  };
}
