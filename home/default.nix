{ primaryUser, ... }:
{
  imports = [
    ./packages.nix
    ./git.nix
    ./shell.nix
    ./gpg.nix
    ./wezterm.nix
    ./helix.nix
  ];

  home = {
    username = primaryUser;
    stateVersion = "25.11";
  };

  # WezTerm is Nix-managed so its store path changes with each generation,
  # causing TCC to lose track of the signing identity. Disable the check to
  # avoid a false "permission denied" block on every activation.
  targets.darwin.copyApps.enableChecks = false;
}
