{pkgs, ...}: {
  config.vim = {
    autopairs.nvim-autopairs.enable = true;

    telescope = {
      enable = true;
      extensions = [
        {
          name = "fzf";
          packages = [pkgs.vimPlugins.telescope-fzf-native-nvim];
          setup = {fzf = {fuzzy = true;};};
        }
      ];
      mappings.findFiles = "<C-p>";
    };

    utility.preview.markdownPreview = {
      enable = true;
      lazyRefresh = true;
    };

    utility.ccc.enable = true;
  };
}
