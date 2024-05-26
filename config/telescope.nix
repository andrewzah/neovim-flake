{...}: {
  plugins.telescope = {
    enable = true;
    highlightTheme = "rose-pine";
    extensions.file_browser.enable = true;
    extensions.fzf-native.enable = true;

    keymaps = {
      "<leader>?" = {
        action = "oldfiles";
        desc = "[?] Find recently opened files";
      };
      "<leader>sf" = {
        action = "find_files";
        desc = "[s]earch [f]iles";
      };
    };
  };
}
