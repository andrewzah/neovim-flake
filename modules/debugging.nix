{pkgs, ...}: {
  config.vim = {
    #plugins.dap.enable = true;

    debugger.nvim-dap = {
      enable = true;
      ui.enable = true;
    };
  };
}
