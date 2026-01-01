{ primaryUser, ... }:
{
  programs.git = {
    enable = true;
    userName = "Tanjim H.";
    userEmail = "contact@audacioustux.com";

    signing = {
      key = "3832734CA36A92B9";
      signByDefault = true;
    };

    lfs.enable = true;

    ignores = [ "**/.DS_STORE" ];

    extraConfig = {
      github = {
        user = "audacioustux";
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
