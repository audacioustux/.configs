{ pkgsMaster, ... }:
{
  home.sessionPath = [ "$HOME/.local/bin" ];

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    package = pkgsMaster.direnv;
    nix-direnv.enable = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    sessionVariables = {
      AWS_PAGER = "";
    };


    shellAliases = {
      la = "ls -la";
      ".." = "cd ..";
      "nix-switch" = "sudo darwin-rebuild switch --flake ~/.config/nix";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "docker" "1password" ];
      theme = "robbyrussell";
    };
  };
}
