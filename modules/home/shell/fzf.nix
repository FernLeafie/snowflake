{
  config,
  pkgs,
  lib,
  ...
}:
let
  fzf-preview =
    let
      src = pkgs.fetchurl {
        url = "https://raw.githubusercontent.com/junegunn/fzf/master/bin/fzf-preview.sh";
        hash = "sha256-DkoKSJtUfap13Y7u/WtShgZ3QBsrd1T938txoYZdRVI="; # [NOTE] Needs to be updated with upstream changes, sorry
        executable = true;
      };
    in
    pkgs.writeShellScriptBin "fzf-preview.sh" ''
      export PATH="${
        lib.makeBinPath [
          pkgs.bat
          pkgs.file
          pkgs.chafa
          pkgs.coreutils
        ]
      }:$PATH"
      exec ${src} "$@"
    '';
in
{
  # Preferably make this as dependencies on fzf
  home.packages = with pkgs; [
    tree
  ];
  programs = {
    # because for some reason this isn't covered by home managed 3:<
    # [NOTE] pls turn this into a global option or something that the terminal or niri processes, so it isn't as dependent on the current config
    kitty.environment = {
      "FZF_COMPLETION_OPTS" = "--border=rounded --border-label='Completion' --border-label-pos=3";
    };
    fish.shellAliases = {
      fzd = "fzf --preview '${lib.getExe fzf-preview} {}'";
    };
    fzf = {
      enable = true;
      # [NOTE] Works but requires building fzf
      # package = pkgs.fzf.overrideAttrs (oldAttrs: {
      #   postInstall = oldAttrs.postInstall + ''
      #     install bin/fzf-preview.sh $out/bin
      #   '';
      # });
      defaultOptions = [ "--border" ];
      # Equivalent to FZF_ALT_C_OPTS
      changeDirWidget.fish.options = [
        "--border=rounded"
        "--border-label='Change Directory'"
        "--border-label-pos=3"
        "--preview 'tree -C {}'"
        "--bind '?:toggle-preview'"
      ];
      # Equivalent to FZF_CTRL_T_OPTS
      fileWidget.fish.options = [
        "--border=rounded"
        "--border-label='Select File'"
        "--border-label-pos=3"
        "--preview '${lib.getExe fzf-preview} {}'"
        "--bind '?:toggle-preview'"
      ];
      # Equivalent to FZF_CTRL_R_OPTS
      historyWidget.fish.options = [
        "--border=rounded"
        "--border-label=History"
        "--border-label-pos=3"
        "--layout='reverse'"
      ];
    };
  };
}
