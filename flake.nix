{
  description = "nvf neovim flake";

  outputs = {nixpkgs, ...} @ inputs: let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;

    nvim =
      (inputs.nvf.lib.neovimConfiguration {
        inherit pkgs;
        modules = [
          ./modules/default.nix
        ];
      }).neovim;
  in {
    apps.x86_64-linux.default = {
      type = "app";
      program = "${nvim}/bin/nvim";
    };

    packages.x86_64-linux.default = nvim;

    devShells.x86_64-linux.default = pkgs.mkShellNoCC {
      shellHook = ''
        alias vv='${nvim}/bin/nvim'
        echo 'devshell for testing nvf neovim loaded.'
      '';
      packages = [nvim];
    };
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nvf.url = "github:notashelf/nvf";
    #nvf.url = "git+file:///home/dragon/opt/nvf";
  };
}
