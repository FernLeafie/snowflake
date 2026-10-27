{
  config,
  pkgs,
  lib,
  ...
}:
{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    enableTransience = true;
    presets = [ "nerd-font-symbols" ];
    settings = {
      format = lib.concatStrings [
        "($cmd_duration\n)"
        "([\\[exit: ](bold red)$status[\\]](bold red)\n)"
        "$os"
        "$username"
        "[@](text)"
        "$hostname"
        "$directory"
        "$vcs"
        "$nix_shell"
        "$dotnet"
        "$haskell"
        "$java"
        "$rust"
        "$typst"
        "$character"
      ];
      add_newline = false;

      cmd_duration = {
        format = "\\[elapsed: [$duration]($style)\\] ";
      };
      status = {
        format = "[$status]($style)"; # removes lil x
        pipestatus_format = "$pipestatus => [$common_meaning$signal_name$maybe_int]($style)";
        success_style = "bold green"; # make success not red
        disabled = false;
        pipestatus = true;
      };
      os.disabled = false;
      hostname = {
        ssh_only = false;
        style = "bold blue";
        format = "[$hostname]($style)( $ssh_symbol) ";
      };
      username = {
        show_always = true;
        style_root = "red bold";
        style_user = "teal bold";
        format = "[$user]($style)";
      };
      directory = {
        style = "yellow";
        truncation_symbol = ""; # possibly .. ../
        # fish_style_pwd_dir_length = 1;
      };
      character = {
        success_symbol = "[](bold text)";
        error_symbol = "[](bold red)";
        vimcmd_symbol = "[](bold blue)";
        vimcmd_replace_one_symbol = "[](bold yellow)";
        vimcmd_replace_symbol = "[](bold yellow)";
        vimcmd_visual_symbol = "[](bold mauve)";
      };

      # -- Version control --
      vcs = {
        order = [
          "jj"
          "git"
          "hg"
          "pijul"
          "fossil"
        ];
        git_modules = "$git_branch$git_state$git_status";
        jj_modules = "$jj_bookmark$jj_change$jj_status";
      };
      git_branch = {
        style = "bold mauve";
        format = "[$symbol$branch(:$remote_branch)]($style) ";
      };
      git_status.untracked = "";
      jj_bookmark = {
        style = "bold mauve";
        format = "[$symbol$bookmark(@$remote)$diverged( \\(+$overflow_count others\\))]($style) ";
      };
      jj_change.format = "[$change_prefix]($prefix_style) ";
      jj_metrics.disabled = true; # number of changed lines, useless
      jj_status.disabled = true; # only really shows if files have been changed or whatnot

      # -- Programming languages --
      dotnet = {
        format = "[$symbol($version )(󰓾 $tfm )]($style)";
        symbol = "󰪮 ";
        style = "bold mauve";
      };
      rust = {
        format = "[$symbol($version )]($style)";
        style = "bold peach";
      };
      java = {
        format = "[\${symbol}(\${version} )]($style)";
        style = "sapphire";
      };
      haskell = {
        format = "[$symbol($version )]($style)";
        style = "mauve";
      };
      nix_shell = {
        format = "[$symbol(\($name\))]($style) ";
      };
      typst = {
        format = "[$symbol($version )]($style)";
        style = "sky";
      };
    };
  };
  programs.fish = {
    functions = {
      starship_transient_prompt_func = {
        description = "Starship transient prompt";
        body = ''
          starship module os; starship module character
        '';
      };
    };
  };
}
