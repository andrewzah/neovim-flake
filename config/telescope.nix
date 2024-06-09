{...}: {
  plugins.telescope = {
    enable = true;
    highlightTheme = "gruvbox";
    extensions.file-browser.enable = true;
    extensions.fzf-native.enable = true;

    keymaps = {
      "<leader>?" = {
        action = "oldfiles";
        options.desc = "[?] Find recently opened files";
      };

      "<leader>sf" = {
        action = "find_files";
        options.desc = "[s]earch [f]iles";
      };
    };
  };
}
