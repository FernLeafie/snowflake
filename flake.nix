{
  description = "Snowflake for two Snowleafies";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri-flake = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia/cachix";
      # inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixcord.url = "github:4evy/nixcord";

    millennium.url = "github:SteamClientHomebrew/Millennium?dir=packages/nix";

    nix-gaming.url = "github:fufexan/nix-gaming";
    nix-citizen = {
      url = "github:LovingMelody/nix-citizen";
      inputs.nix-gaming.follows = "nix-gaming";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      # [NOTE] Saves space but might introduce bugs
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  nixConfig = {
    extra-substituters = [
      "https://noctalia.cachix.org"
      "https://nix-citizen.cachix.org"
    ];
    extra-trusted-public-keys = [
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
      "nix-citizen.cachix.org-1:lPMkWc2X8XD4/7YPEEwXKKBg+SVbYTVrAaLA2wQTKCo="
    ];
  };

  outputs = inputs@{ self, nixpkgs, home-manager, noctalia, niri-flake, catppuccin, ... }: {
    nixosConfigurations.aphrodite = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/aphrodite/configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs =
              { inherit self inputs; };
            sharedModules = [
              ./modules/home/home.nix
            ];
            users.fern-snowleafie = import ./modules/home/fern.nix;
            backupFileExtension = "backup";
          };
        }
      ];
    };
    nixosConfigurations.artemis = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/artemis/configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs =
              { inherit self inputs; };
            sharedModules = [
              ./modules/home/home.nix
            ];
            users.fern-snowleafie = import ./modules/home/fern.nix;
            backupFileExtension = "backup";
          };
        }
      ];
    };

  };
}
