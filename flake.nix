{
  description = "Andrews nixvim configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixvim.url = "github:nix-community/nixvim";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = {
    self,
    nixpkgs,
    nixvim,
    flake-parts,
    ...
  } @ inputs: let
    config = import ./config;
  in
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem = { system, ... }: let
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
      in {
        checks = {
          default = nixvimLib.check.mkTestDerivationFromNvim {
            inherit nvim;
            name = "Andrews nixvim configuration";
          };
        };

        packages = {
          default = nvim;
        };

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
      };
    };
}
