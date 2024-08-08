{ ... }:
{
  autoCmd = [
    {
      event = [
        "BufRead"
        "BufEnter"
      ];
      pattern = "*";
      callback = {
        __raw = ''
          function()
            local firstLine = vim.api.nvim_buf_get_lines(0, 0, 1, false)[1]

            if firstLine == "#!/command/with-contenv bash" then
              vim.cmd("set syntax=bash")
            elseif firstLine == "#!/command/with-contenv sh" then
              vim.cmd("set syntax=sh")
            end
          end
        '';
      };
    }
  ];
}
