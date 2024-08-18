{
  description = "NeoVim flake by Andrew Zah";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixvim.url = "github:nix-community/nixvim";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, nixvim, flake-utils, ... } @ inputs:
  let
    config = import ./modules;
  in
  flake-utils.lib.eachDefaultSystem(system:
    let
      nixpkgsWithConfig = import nixpkgs {
        config = {
          allowUnfree = true;
        };
        inherit system;
      };
      pkgs = nixpkgsWithConfig;
      nixvimLib = nixvim.lib.${system};
      nvim = nixvim.legacyPackages.${system}.makeNixvimWithModule {
        inherit pkgs;
        module = config;
      };
      in rec {
        apps = {
          nvim = {
            type = "app";
            program = "${packages.default}/bin/nvim";
          };

          default = nvim;
        };

        checks = {
          default = nixvimLib.check.mkTestDerivationFromNvim {
            inherit nvim;
            name = "Andrews nixvim configuration";
          };
        };

        packages = {
          default = nvim;
        };

        homeManagerModules.default = {
          imports = [ ./lib/hm.nix ];
        };
        nixosModules.hm =
          pkgs.lib.warn "nixosModules.hm is deprecated; use HomeManagerModules.default instead." homeManagerModules.default;

        devShells.default = pkgs.mkShellNoCC {
          shellHook = ''
            echo Welcome to a Neovim dev environment powered by Nixvim -- https://github.com/nix-community/nixvim
            PS1="Nixvim: \\w \$ "
            alias vim='nvim'
          '';
          packages = [
            nvim
          ];
        };
      });
}
