{ pkgs, pkgsMaster, ... }:
{
  home = {
    packages = with pkgs; [
      # dev tools
      curl
      neovim
      helix
      zellij
      btop
      tree
      ripgrep
      gh
      zoxide
      direnv
      docker-client

      # devops tools
      awscli2
      aws-iam-authenticator
      k9s

      # LLM CLIs
      pkgsMaster.opencode
      pkgsMaster.gemini-cli

      # languages runtimes
      uv
      rustup
      nodejs_22
      bun

      # fonts
      nerd-fonts.monaspace
    ];
  };
}