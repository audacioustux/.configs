{ primaryUser, ... }:
{
  imports = [
    ./packages.nix
    ./git.nix
    ./shell.nix
    ./gpg.nix
    ./wezterm.nix
    ./helix.nix
    ./probhat.nix
  ];

  home = {
    username = primaryUser;
    stateVersion = "25.11";
  };
}
