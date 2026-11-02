{
  # schemastore integration for jsonls and yamlls
  plugins.schemastore = {
    enable = true;
    json.enable = true;
    yaml.enable = true;
  };
  lsp.servers = {
    jsonls.enable = true;
    yamlls.enable = true;
    tombi = {
      enable = true;
      config.settings.tombi = {
        # formatting rules directly from the lsp, instead of being called from conform
        format.rules = {
          array-bracket-space-width = 1; # default 0
          indent-sub-tables = true; # more visually clear, and common
          line-width = 100; # normally without limit 
          trailing-comment-alignment = true; # default false
        };
      };
    };
  };
}
