{pkgs, ...}: {
  config.vim = {
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

    # highlights colors + color picker
    # https://github.com/uga-rosa/ccc.nvim
    utility.ccc.enable = true;

    # show the name of the current block at the end
    # https://github.com/code-biscuits/nvim-biscuits
    utility.nvim-biscuits.enable = false;
    utility.nvim-biscuits.setupOpts = {
      min_length = 20;
      cursor_line_only = true;
      toggle_keybind = "<leader>vb";
      show_on_start = true;
    };

    mini.pairs.enable = true;
    mini.files.enable = true;
  };
}
