{
  config.programs.vscode.globalSnippets = {
    fixme = {
      prefix = [ "fixme" ];
      body = [ "$LINE_COMMENT FIXME: $0" ];
      description = "Insert a FIXME remark";
    };
  };
}
