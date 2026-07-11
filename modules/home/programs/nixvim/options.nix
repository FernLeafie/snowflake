{ config, lib, pkgs, ... }:
{
  opts = {
    showmode = false;
    clipboard = "unnamedplus";
    ttyfast = true;
    smoothscroll = true;
    scrolloff = 8;

    number = true; # line numbers
    relativenumber = true;
    cursorline = true;

    expandtab = true;
    tabstop = 2;
    softtabstop = 2;
    shiftwidth = 2;

    autoindent = true;
    smartindent = true;

    foldmethod = "indent";
    foldenable = true;
    foldlevel = 99;
    foldlevelstart = 99;
    fillchars = {
      eob = " ";
      fold = " ";
      foldsep = " ";
      foldinner = " ";
      foldopen = "";
      foldclose = "";
    };
    foldcolumn = "1";

    completeopt = [
      "menuone"
      "noselect"
    ];
  };
  # diagnostic.settings = {
  #   signs = false;
  # };
}
