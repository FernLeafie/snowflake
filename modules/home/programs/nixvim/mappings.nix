{
  config,
  lib,
  pkgs,
  ...
}:
{
  keymaps = [
    # move block
    {
      mode = [ "v" ];
      key = "J";
      action = ":m '>+1<CR>gv=gv";
      options.desc = "Move visual block up";
    }
    {
      mode = [ "v" ];
      key = "K";
      action = ":m '<-2<CR>gv=gv";
      options.desc = "Move visual block up";
    }
    # Not sure what this does differently from usual
    {
      mode = [ "n" ];
      key = "J";
      action = "mzJ`z";
      options.desc = "Append following line";
    }
    # Paste without overwriting register
    {
      mode = [ "x" ];
      key = "<leader>p";
      action = "'_dP";
      options.desc = "Paste while perserving clipboard";
    }
    # Replace word under cursor across the entire buffer
    {
      mode = [ "n" ];
      key = "<leader>s";
      action = ":%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>";
      options.desc = "Replace word under cursor";
    }
    # move easier between splits
    {
      mode = [ "n" ];
      key = "<C-h>";
      action = "<C-w>h";
    }
    {
      mode = [ "n" ];
      key = "<C-j>";
      action = "<C-w>j";
    }
    {
      mode = [ "n" ];
      key = "<C-k>";
      action = "<C-w>k";
    }
    {
      mode = [ "n" ];
      key = "<C-l>";
      action = "<C-w>l";
    }
  ];
}
