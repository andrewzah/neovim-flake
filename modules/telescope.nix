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

      "<C-p>" = {
        action = "find_files";
      };
    };
  };
}
