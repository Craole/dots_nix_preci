{
  programs.vscode.userSettings = {
    rust-analyzer = {
      check.command = "clippy";
      showUnlinkedFileNotification = false;
    };
    "[rust]" = {
      editor.defaultFormatter = "rust-lang.rust-analyzer";
    };
  };
}
