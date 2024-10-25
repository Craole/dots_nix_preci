{
  programs.vscode.userSettings = {
    files.associations = {
      "*rust-toolchain*" = "toml";
    };
    rust-analyzer = {
      check.command = "clippy";
      cargo.features = "all";
      showUnlinkedFileNotification = false;
    };
    "[rust]" = {
      editor = {
        defaultFormatter = "rust-lang.rust-analyzer";
        formatOnSave = true;
        inlayHints.enabled = "offUnlessPressed";
      };
    };
  };
}
