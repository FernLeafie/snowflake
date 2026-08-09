{
  config,
  lib,
  pkgs,
  osConfig,
  ...
}:
{
  catppuccin.firefox.force = true;
  programs.firefox = {
    enable = true;

    languagePacks = [ "en-GB" ];
    policies = {
      SearchEngines.Remove = [
        "Bing"
        "Ecosia"
        "eBay"
        "Perplexity"
      ];
      GenerativeAI = {
        Enabled = false;
        Locked = true;
      };
    };

    profiles.default = {
      id = 0;
      name = "default";
      isDefault = true;
      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "widget.use-xdg-desktop-portal" = true;
        "extensions.autoDisableScopes" = 0;

        "browser.updensity" = 1;
        "browser.compactmode.show" = true;
        "browser.tabs.inTitlebar" = 0; # disables window controls
        "sidebar.verticalTabs" = true;
        "sidebar.visibility" = "always-show";
      };

      extensions.packages =
        (with pkgs.nur.repos.rycee.firefox-addons; [
          adnauseam
          sponsorblock
          return-youtube-dislikes
          consent-o-matic
          bitwarden
          startpage-private-search

          plasma-integration
          facebook-container
          private-grammar-checker-harper
          shinigami-eyes

          mal-sync
          indie-wiki-buddy
          modrinthify

          catppuccin-web-file-icons
          firefox-color
          stylus
          tablissng
        ])
        ++ osConfig.snow.programs.firefox.extraExtensions;

      # "3rdparty".Extensions = {
      #   "adnauseam@rednoise.org" = {
      #     enabled = true;
      #     firstInstall = false;
      #     hidingAds = true;
      #     clickingAds = true;
      #     blockingMalware = true;
      #     adminSettings = {
      #       userSettings = rec {
      #         uiTheme = "dark";
      #         uiAccentCustom = true;
      #         uiAccentCustom0 = "#8300ff";
      #         importedLists = [
      #           "https://filters.adtidy.org/extension/ublock/filters/3.txt"
      #           "https://github.com/DandelionSprout/adfilt/raw/master/LegitimateURLShortener.txt"
      #         ];
      #         externalLists = lib.concatStringsSep "\n" importedLists;
      #       };
      #       selectedFilterLists = [
      #         "user-filters"
      #         "adnauseam-filters"
      #         "eff-dnt-whitelist"
      #         "ublock-filters"
      #         "ublock-badware"
      #         "ublock-privacy"
      #         "ublock-unbreak"
      #         "ublock-quick-fixes"
      #         "easylist"
      #         "easyprivacy"
      #         "urlhaus-1"
      #       ];
      #     };
      #   };
      # };
      extensions.settings = {
        "uBlock0@raymondhill.net" = {
          force = true;
          settings = {
            selectedFilterLists = [
              "ublock-filters"
              "ublock-badware"
              "ublock-privacy"
              "ublock-unbreak"
              "ublock-quick-fixes"
            ];
          };
        };
        # "adnauseam@rednoise.org" = {
        #   force = true;
        #   settings = {
        #     userSettings = rec {
        #       firstInstall = false;
        #       hidingAds = true;
        #       clickingAds = true;
        #       blockingMalware = true;
        #       importedLists = [
        #         "https://filters.adtidy.org/extension/ublock/filters/3.txt"
        #         "https://gitflic.ru/project/magnolia1234/bypass-paywalls-clean-filters/blob/raw?file=bpc-paywall-filter.txt"
        #         "https://raw.githubusercontent.com/DandelionSprout/adfilt/master/ClearURLs%20for%20uBo/clear_urls_uboified.txt"
        #         "https://raw.githubusercontent.com/DandelionSprout/adfilt/master/LegitimateURLShortener.txt"
        #         "https://raw.githubusercontent.com/Stevoisiak/Stevos-GenAI-Blocklist/refs/heads/main/GenAI-Blocklist.txt"
        #         "https://raw.githubusercontent.com/liamengland1/miscfilters/refs/heads/master/antipaywall.txt"
        #         "https://raw.githubusercontent.com/squabbled/FandomFixed/refs/heads/main/uBlock.txt"
        #       ];
        #       externalLists = lib.concatStringsSep "\n" importedLists;
        #     };
        #     selectedFilterLists = [
        #       "user-filters"
        #       "adnauseam-filters"
        #       "eff-dnt-whitelist"
        #       "ublock-filters"
        #       "ublock-badware"
        #       "ublock-privacy"
        #       "ublock-quick-fixes"
        #       "ublock-unbreak"
        #       "easylist"
        #       "easyprivacy"
        #       "urlhaus-1"
        #       "plowe-0"
        #       "fanboy-ai-suggestions"
        #       "easylist-chat"
        #       "easylist-newsletters"
        #       "easylist-notifications"
        #       "easylist-annoyances"
        #       "https://raw.githubusercontent.com/DandelionSprout/adfilt/master/LegitimateURLShortener.txt"
        #       "https://filters.adtidy.org/extension/ublock/filters/3.txt"
        #       "https://raw.githubusercontent.com/DandelionSprout/adfilt/master/ClearURLs%20for%20uBo/clear_urls_uboified.txt"
        #       "https://raw.githubusercontent.com/squabbled/FandomFixed/refs/heads/main/uBlock.txt"
        #       "https://raw.githubusercontent.com/Stevoisiak/Stevos-GenAI-Blocklist/refs/heads/main/GenAI-Blocklist.txt"
        #       "https://gitflic.ru/project/magnolia1234/bypass-paywalls-clean-filters/blob/raw?file=bpc-paywall-filter.txt"
        #       "https://raw.githubusercontent.com/liamengland1/miscfilters/refs/heads/master/antipaywall.txt"
        #     ];
        #   };
        # };
        # "{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}" = {
        #   force = true;
        #   settings = {
        #     dbInChromeStorage = true; # required for Stylus
        #   };
        # };
      };

      search = {
        force = true;
        default = "Startpage";
        privateDefault = "ddg";

        engines = {
          "Startpage" = {
            name = "Startpage";
            urls = [
              {
                template = "https://www.startpage.com/sp/search";
                params = [
                  {
                    name = "q";
                    value = "{searchTerms}";
                  }
                ];
              }
              {
                template = "https://www.startpage.com/osuggestions";
                params = [
                  {
                    name = "q";
                    value = "{searchTerms}";
                  }
                ];
                type = "application/x-suggestions+json";
              }
            ];
            iconMapObj."16" = "https://www.startpage.com/favicon.ico";
            definedAliases = [
              "@sp"
              "@startpage"
            ];
          };

          "Youtube" = {
            name = "Youtube";
            urls = [ { template = "https://www.youtube.com/results?search_query={searchTerms}"; } ];
            iconMapObj."16" = "https://www.youtube.com/favicon.ico";
            definedAliases = [ "@yt" ];
          };

          "Anilist Anime" = {
            name = "Anilist Anime";
            urls = [ { template = "https://anilist.co/search/anime?search={searchTerms}"; } ];
            iconMapObj."16" = "https://anilist.co/favicon.ico";
            definedAliases = [ "@ala" ];
          };

          "Anilist Manga" = {
            name = "Anilist Manga";
            urls = [ { template = "https://anilist.co/search/manga?search={searchTerms}"; } ];
            iconMapObj."16" = "https://anilist.co/favicon.ico";
            definedAliases = [ "@alm" ];
          };

          "Hardcover" = {
            name = "Hardcover";
            urls = [ { template = "https://hardcover.app/search?q={searchTerms}"; } ];
            iconMapObj."16" = "https://assets.hardcover.app/static/favicon.ico";
            definedAliases = [ "@hc" ];
          };

          "Modrinth Mods" = {
            name = "Modrinth Mods";
            urls = [ { template = "https://modrinth.com/discover/mods?q={searchTerms}"; } ];
            iconMapObj."16" = "https://modrinth.com/favicon.ico";
            definedAliases = [ "@mrm" ];
          };

          "Modrinth Resource Packs" = {
            name = "Modrinth Resource Packs";
            urls = [ { template = "https://modrinth.com/discover/resourcepacks?q={searchTerms}"; } ];
            iconMapObj."16" = "https://modrinth.com/favicon.ico";
            definedAliases = [ "@mrr" ];
          };

          "Curseforge Search" = {
            name = "Curseforge Search";
            urls = [ { template = "https://superstormer.github.io/cf-search/?searchFilter={searchTerms}"; } ];
            iconMapObj."16" = "https://www.curseforge.com/favicon.ico";
            definedAliases = [ "@cfs" ];
          };

          "ArchWiki" = {
            name = "ArchWiki";
            urls = [
              {
                template = "https://wiki.archlinux.org/index.php?search={searchTerms}&title=Special%3ASearch&wprov=acrw1_-1";
              }
            ];
            iconMapObj."16" = "https://archlinux.org/favicon.ico";
            definedAliases = [ "@aw" ];
          };

          "Firefox Add-ons" = {
            name = "Firefox Add-ons";
            urls = [ { template = "https://addons.mozilla.org/en-US/firefox/search/?q={searchTerms}"; } ];
            iconMapObj."16" = "https://addons.mozilla.org/favicon.ico?v=3";
            definedAliases = [ "@amo" ];
          };

          "MDN Web Docs" = {
            name = "MDN Web Docs";
            urls = [ { template = "https://developer.mozilla.org/en-US/search?q={searchTerms}"; } ];
            iconMapObj."16" = "https://developer.mozilla.org/favicon.ico";
            definedAliases = [ "@mdn" ];
          };

          "GitHub" = {
            name = "GitHub";
            urls = [
              { template = "https://github.com/search?q={searchTerms}&ref=opensearch&type=repositories"; }
            ];
            iconMapObj."16" = "https://github.com/favicon.ico";
            definedAliases = [ "@gh" ];
          };

          "Catppuccin Ports" = {
            name = "Catppuccin Ports";
            urls = [ { template = "https://catppuccin.com/ports/?q={searchTerms}"; } ];
            iconMapObj."16" = "https://catppuccin.com/favicon.png";
            definedAliases = [ "@ctp" ];
          };

          "SteamGridDB" = {
            name = "SteamGridDB";
            urls = [ { template = "https://www.steamgriddb.com/search/grids?term={searchTerms}"; } ];
            iconMapObj."16" = "https://www.steamgriddb.com/static/favicon/16.png";
            definedAliases = [ "@sgdb" ];
          };

          # Game wikis
          "Minecraft Wiki" = {
            name = "Minecraft Wiki";
            urls = [ { template = "https://minecraft.wiki/w/Special:Search?search={searchTerms}"; } ];
            iconMapObj."16" = "https://minecraft.wiki/favicon.ico";
            definedAliases = [ "@mw" ];
          };
          "Stardew Valley Wiki" = {
            name = "Stardew Valley Wiki";
            urls = [
              {
                template = "https://stardewvalleywiki.com/mediawiki/index.php?title=Special:Search&search={searchTerms}";
              }
            ];
            iconMapObj."16" =
              "https://stardewvalleywiki.com/mediawiki/extensions/StardewValley/images/favicon.png";
            definedAliases = [ "@sv" ];
          };

          "Searchix Combined" = {
            urls = [ { template = "https://searchix.ovh/?query={searchTerms}"; } ];
            iconMapObj."16" = "https://searchix.ovh/favicon.ico";
            definedAliases = [ "@ns" ];
          };

          "Nix Packages" = {
            urls = [
              {
                template = "https://search.nixos.org/packages";
                params = [
                  {
                    name = "channel";
                    value = "unstable";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@np" ];
          };

          # "Nix Options" = {
          #   urls = [
          #     {
          #       template = "https://search.nixos.org/options";
          #       params = [
          #         {
          #           name = "channel";
          #           value = "unstable";
          #         }
          #         {
          #           name = "query";
          #           value = "{searchTerms}";
          #         }
          #       ];
          #     }
          #   ];
          #   icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          #   definedAliases = [ "@no" ];
          # };

          "NixOS Wiki" = {
            urls = [
              {
                template = "https://wiki.nixos.org/w/index.php";
                params = [
                  {
                    name = "search";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@nw" ];
          };
          "Noogle" = {
            urls = [ { template = "https://noogle.dev/q/?term={searchTerms}"; } ];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@no" ];
          };

          bing.metaData.hidden = true;
          ecosia.metaData.hidden = true;
          perplexity.metaData.hidden = true;
          ebay.metaData.hidden = true;
        };
      };
      userChrome = builtins.readFile ./firefox-userChrome.css;
    };
  };
}
