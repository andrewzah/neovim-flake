{ lib, ... }:
{
  imports = [
    ./autocmds.nix
    ./keymaps.nix
    ./completion.nix
    ./lint.nix
    ./lsp.nix
    ./style.nix
    ./telescope.nix
    ./config.nix
  ];

  options.programs.neovim-flake = {
    background = lib.mkOption {
      type = lib.types.str;
      default = "dark";
      description = "set the background to dark or light";
    };
  };
}
