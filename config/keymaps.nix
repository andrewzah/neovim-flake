{...}: {
  keymaps = [
    {
      key = "<C-d>";
      mode = "n";
      action = "<C-d>zz"; # keep cursor in middle
      options.silent = true;
      options.noremap = true;
    }
    {
      key = "<C-u>";
      mode = "n";
      action = "<C-u>zz"; # keep cursor in middle
      options.silent = true;
      options.noremap = true;
    }
  ];
}
