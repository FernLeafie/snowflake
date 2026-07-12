{
  config,
  lib,
  pkgs,
  ...
}:
{
  options = {
    snow.debugging = lib.mkEnableOption "neovim debugging";
  };
  config = lib.mkIf config.snow.debugging {
    plugins = {
      dap = {
        enable = true;
        signs = {
          dapBreakpoint = {
            text = "";
            texthl = "DapBreakpoint";
          };
          dapBreakpointCondition = {
            text = "";
            texthl = "DapBreakpointCondition";
          };
          dapLogPoint = {
            text = "";
            texthl = "DapLogPoint";
          };
        };
      };
      dap-view = {
        enable = true;
        settings = {
          icons = {
            collapsed = " ";
            disabled = "";
            disconnect = "";
            enabled = "";
            expanded = " ";
            filter = "";
            negate = " ";
            pause = "";
            play = "";
            run_last = "";
            step_back = "";
            step_into = "";
            step_out = "";
            step_over = "";
            terminate = "";
          };
          help = {
            border = "rounded";
          };
        };
      };
    };
    keymaps = [
      {
        mode = [ "n" ];
        key = "<leader>dv";
        action = "<Cmd>DapViewToggle<CR>";
        options.desc = "Debug view";
      }
      {
        mode = [ "n" ];
        key = "<leader>db";
        action = "<Cmd>DapToggleBreakpoint<CR>";
        options.desc = "Debug breakpoint";
      }
      {
        mode = [ "n" ];
        key = "<leader>dc";
        action = "<Cmd>DapContinue<CR>";
        options.desc = "Debug continue";
      }
      {
        mode = [ "n" ];
        key = "<leader>dx";
        action = "<Cmd>DapTerminate<CR>";
        options.desc = "Debug terminate";
      }
      {
        mode = [ "n" ];
        key = "<leader>do";
        action = "<Cmd>DapStepOver<CR>";
        options.desc = "Debug step over";
      }
    ];
  };
}
