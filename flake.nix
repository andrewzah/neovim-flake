{
  description = "nvf neovim flake";

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    ...
  } @ inputs:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {inherit system;};

      nvim =
        (inputs.nvf.lib.neovimConfiguration {
          inherit pkgs;
          modules = [
            ./modules/default.nix
          ];
        }).neovim;
    in {
      apps.default = {
        type = "app";
        program = "${nvim}/bin/nvim";
      };
      packages.default = nvim;
      devShells.default = pkgs.mkShellNoCC {
        shellHook = ''
          alias vv='${nvim}/bin/nvim'
          echo 'devshell for testing nvf neovim loaded.'
        '';
        packages = [nvim];
      };
    });

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nvf.url = "github:notashelf/nvf";
    flake-utils.url = "github:numtide/flake-utils";
    #nvf.url = "git+file:///home/dragon/opt/nvf";
  };
}
