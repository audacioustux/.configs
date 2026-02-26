{
  description = "My system configuration";
  inputs = {
    # monorepo w/ recipes ("derivations")
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixpkgs-master.url = "github:nixos/nixpkgs/master";

    # manages configs
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # system-level software and settings (macOS)
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    # declarative homebrew management
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";

    # probhat keyboard layout for macOS
    probhat-macos.url = "github:audacioustux/probhat-macos";
  };

  outputs =
    {
      self,
      darwin,
      nixpkgs,
      home-manager,
      nix-homebrew,
      ...
    }@inputs:
    let
      primaryUser = "tanijimhossain"; # CHANGE: your macOS username
      hostName = "audacioustux-fn"; # CHANGE: your hostname (run `hostname` to get it)
    in
    {
      # build darwin flake using:
      # $ darwin-rebuild build --flake .#<name>
      darwinConfigurations."${hostName}" = darwin.lib.darwinSystem {
        system = "aarch64-darwin"; # CHANGE: use "x86_64-darwin" for Intel Macs
        modules = [
          ./darwin
          ./hosts/audacioustux-fn/configuration.nix # CHANGE: match your hostname
        ];
        specialArgs = { inherit inputs self primaryUser hostName; };
      };

    };
}
