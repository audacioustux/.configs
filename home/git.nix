{ primaryUser, ... }:
{
  programs.git = {
    enable = true;
    signing = {
      key = "3832734CA36A92B9"; # CHANGE: your GPG key (or remove signing block)
      signByDefault = true;
    };

    lfs.enable = true;

    ignores = [ "**/.DS_STORE" "**/.serena" ];

    settings = {
      user = {
        name = "Tanjim H."; # CHANGE: your name
        email = "contact@audacioustux.com"; # CHANGE: your email
      };
      github = {
        user = "audacioustux"; # CHANGE: your GitHub username
      };
      push = {
        autoSetupRemote = true;
      };
      init = {
        defaultBranch = "main";
      };
    };
  };
}
