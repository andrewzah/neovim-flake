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
}
