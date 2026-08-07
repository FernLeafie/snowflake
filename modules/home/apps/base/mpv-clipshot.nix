# [FIXME] sitting here waiting to be fixed
{
  lib,
  fetchFromGitHub,
  unstableGitUpdater,
  buildLua,
}:

buildLua {
  pname = "mpv-clipshot";

  version = "0-unstable-2024-04-20";
  src = fetchFromGitHub {
    owner = "ObserverOfTime";
    repo = "mpv-scripts";
    rev = "881b04343da5b296222a28a52fb62fed49559929";
    hash = "sha256-TmRWBKgTlgOszOI1CLHveGMNH23UHSvbijz8wC4M/mM=";
  };
  scriptPath = "clipshot.lua";
  passthru.updateScript = unstableGitUpdater { };

  meta = {
    description = "Copy screenshot to clipboard for mpv";
    longDescription = ''
      mpv-scripts-clipshot is a script allowing screenshotting directly to the clipboard
    '';
    homepage = "https://github.com/ObserverOfTime/mpv-scripts";
    license = lib.licenses.bsd0;
    maintainers = with lib.maintainers; [ FernLeafie ];
  };
}
