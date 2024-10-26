{
  programs.vscode.userSettings = {
    "[ruby]" = {
      editor = {
        defaultFormatter = "Shopify.ruby-lsp";
        formatOnSave = true;
        formatOnType = true;
        tabSize = 2;
        insertSpaces = true;
        rulers = [ 120 ];
        semanticHighlighting.enabled = true;
      };
      # >>> FILE MANAGEMENT
      files = {
        associations = { };
        exclude = {
          "**/.bundle" = true;
        };
        insertFinalNewline = true;
        trimFinalNewlines = true;
        trimTrailingWhitespace = true;
      };
    };
    sorbet.enabled = true;
    #TODO This is not great
    rubyLsp.rubyExecutablePath = /nix/store/7zz339lyjqkmygwcq7ybxvv0yikx5ks5-ruby-3.3.0/bin;
  };
}
