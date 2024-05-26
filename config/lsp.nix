{
  pkgs,
  lib,
  ...
}: {
  plugins.rust-tools.enable = true;
  plugins.lsp = {
    servers = {
      ansiblels.enable = true;
      ansiblels.filetypes = ["yaml" "yaml.ansible" "ansible"];
      bashls.enable = true;
      cmake.enable = true;
      gopls.enable = true;
      jsonls.enable = true;
      lua-ls.enable = true;
      lua-ls.settings.telemetry.enable = false;
      nixd.enable = true;
      ruff-lsp.enable = true;
      rust-analyzer = {
        enable = true;
        installCargo = true;
        installRustc = true;
      };
      tsserver.enable = true;
      yamlls.enable = true;
    };
  };

  extraPlugins = with pkgs.vimPlugins; [
    nvim-lspconfig
    typescript-tools-nvim
  ];
}
