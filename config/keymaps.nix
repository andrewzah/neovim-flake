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
    {
      key = "<Leader>bd";
      mode = "n";
      action = "<cmd>set background=dark<CR>";
      options.silent = true;
      options.noremap = true;
    }
    {
      key = "<Leader>bl";
      mode = "n";
      action = "<cmd>set background=light<CR>";
      options.silent = true;
      options.noremap = true;
    }
  ];
}
