{
  description = "nvf neovim flake";

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    ...
  } @ inputs: let
    systems = ["x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin"];
    forEachSystem = f:
      builtins.listToAttrs (map (system: {
          name = system;
          value = f system;
        })
        systems);
  in {
    apps = forEachSystem (system: let
      pkgs = import nixpkgs {inherit system;};

      nvim =
        (inputs.nvf.lib.neovimConfiguration {
          inherit pkgs;
          modules = [
            ./modules/default.nix
          ];
        }).neovim;
    in {
      default = {
        type = "app";
        program = "${nvim}/bin/nvim";
      };
    });

    packages = forEachSystem (system: let
      pkgs = import nixpkgs {inherit system;};

      nvim =
        (inputs.nvf.lib.neovimConfiguration {
          inherit pkgs;
          modules = [
            ./modules/default.nix
          ];
        }).neovim;
    in {
      default = nvim;
    });

    devShells = forEachSystem (system: let
      pkgs = import nixpkgs {inherit system;};
      nvim =
        (inputs.nvf.lib.neovimConfiguration {
          inherit pkgs;
          modules = [
            ./modules/default.nix
          ];
        }).neovim;
    in {
      default = pkgs.mkShellNoCC {
        shellHook = ''
          alias vv='${nvim}/bin/nvim'
          echo 'devshell for testing nvf neovim loaded.'
        '';
        packages = [nvim];
      };
    });
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nvf.url = "github:notashelf/nvf";
  };
}
