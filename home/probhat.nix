{ lib, pkgs, ... }:

{
  home.activation.copyProbhat = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    $DRY_RUN_CMD ${pkgs.rsync}/bin/rsync -a --chmod=D755,F644 ${./assets/probhat}/ "$HOME/Library/Keyboard Layouts/"
  '';
}
