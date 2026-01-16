{ lib, ... }:
let
  sourceFiles = [
    "~/.config/op/plugins.sh"
  ];
in
{
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

    initContent = lib.concatMapStrings (f: ''
      [ -f ${f} ] && source ${f}
    '') sourceFiles;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "zoxide" "direnv" "docker" ];
      theme = "robbyrussell";
    };
  };
}
