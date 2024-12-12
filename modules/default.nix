{ lib, ... }:
{
  imports = [
    ./autocmds.nix
    ./completion.nix
    ./config.nix
    ./keymaps.nix
    ./lint.nix
    ./lsp.nix
    ./style.nix
    ./telescope.nix
  ];

  options.programs.neovim-flake = {
    background = lib.mkOption {
      type = lib.types.str;
      default = "dark";
      description = "set the background to dark or light";
    };
  };
}
