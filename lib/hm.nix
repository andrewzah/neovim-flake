{ config, pkgs, lib ? pkgs.lib, ... }:
let
  cfg = config.programs.neovim-flake;
in {
  options.programs.neovim-flake = {
    enable = lib.mkEnableOption "Andrew's NeoVim flake";

    background = lib.mkOption {
      type = lib.types.str;
      default = "dark";
      description = "set the background to dark or light";
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ cfg.package ];
  };
}
