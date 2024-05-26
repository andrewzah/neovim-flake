{
  description = "Andrews nixvim configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixvim.url = "github:nix-community/nixvim/9f7c78852f37126244b43e71e5158cdc3d70ad0a";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };
  #inputs.nixpkgs.follows = "nixpkgs";

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

      perSystem = {
        pkgs,
        system,
        ...
      }: let
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
          packages = with pkgs; [
            nvim
          ];
        };
      };
    };
}
