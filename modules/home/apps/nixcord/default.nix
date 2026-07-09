{ inputs, config, pkgs, ... }:
let
  theme-catppuccin = ./mocha-theme.css;
in
{
  imports = [
    inputs.nixcord.homeModules.nixcord
  ];
  programs.nixcord = {
    enable = true;

    discord = {
      vencord.enable = true;
      openASAR.enable = true;
    };

    # Theming
    quickCss = "/* css goes here */";
    config = {
      disableMinSize = true;
      frameless = true;

      useQuickCss = true;
      themeLinks = [
        # "https://raw.githubusercontent.com/link/to/some/theme.css"
        "https://catppuccin.github.io/discord/dist/catppuccin-${config.catppuccin.flavor}-${config.catppuccin.accent}.theme.css"
      ];
      # themes = {
      #   mocha-theme = "${theme-catppuccin}";
      # };
      # enabledThemes = [
      #   "mocha-theme.css"
      # ];

      plugins = {
        biggerStreamPreview.enable = true;
        callTimer.enable = true;
        clearUrls.enable = true;
        dearrow.enable = true;
        disableCallIdle.enable = true;
        fakeNitro.enable = true;
        fakeProfileThemes.enable = true;
        favoriteGifSearch.enable = true;
        fixCodeblockGap.enable = true;
        fixYoutubeEmbeds.enable = true;
        # friendsSince.enable = true; # seemingly a removed plugin
        gameActivityToggle.enable = true;
        gifPaste.enable = true;
        imageFilename.enable = true;
        imageZoom = {
          enable = true;
          nearestNeighbour = true;
          square = true;
        };
        memberCount.enable = true;
        messageLinkEmbeds.enable = true;
        messageLogger.enable = true;
        noReplyMention.enable = true;
        permissionsViewer.enable = true;
        pictureInPicture.enable = true;
        pinDms.enable = true;
        platformIndicators = {
          enable = true;
          list = false;
          messages = false;
        };
        quickMention.enable = true;
        quickReply.enable = true;
        relationshipNotifier.enable = true;
        reviewDb.enable = true;
        roleColorEverywhere.enable = true;
        serverInfo.enable = true;
        shikiCodeblocks = {
          enable = true;
          theme = "https://raw.githubusercontent.com/shikijs/textmate-grammars-themes/bc5436518111d87ea58eb56d97b3f9bec30e6b83/packages/tm-themes/themes/catppuccin-mocha.json";
        };
        showHiddenThings.enable = true;
        spotifyCrack.enable = true;
        textReplace = {
          enable = true;
          stringRules = [
            { find = "://tiktok.com/"; replace = "://tnktok.com/"; }
            { find = "://vm.tiktok.com/"; replace = "://vm.tnktok.com/"; }
            { find = "://www.tiktok.com/"; replace = "://www.tnktok.com/"; }
            { find = "://twitter.com/"; replace = "://vxtwitter.com/"; }
            { find = "://instagram.com/"; replace = "://vxinstagram.com/"; }
            { find = "://www.instagram.com/"; replace = "://vxinstagram.com/"; }
            { find = "://reddit.com/"; replace = "://vxreddit.com/"; }
            { find = "://www.reddit.com/"; replace = "://vxreddit.com/"; }
            { find = "://x.com/"; replace = "://girlcock.com/"; }
          ];
        };
        translate.enable = true;
        unlockedAvatarZoom.enable = true;
        userVoiceShow.enable = true;
        usrbg.enable = true;
        userMessagesPronouns.enable = true;
        validUser.enable = true;
        viewIcons.enable = true;
        voiceDownload.enable = true;
        voiceMessages.enable = true;
        volumeBooster.enable = true;
        youtubeAdblock.enable = true;
      };
    };
  };
}
