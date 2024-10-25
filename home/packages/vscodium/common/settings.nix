{
  programs.vscode.userSettings = {
    # >>> EDITOR
    editor = {
      formatOnSave = true;
      fontFamily = "'monospace',monospace";
      fontLigatures = true;
      fontSize = 18;
      fontWeight = "400";
      guidesbracketPairs = "active";
      inlayHints.enabled = "offUnlessPressed";
      letterSpacing = 0.5;
      lineHeight = 1.5;
      linkedEditing = true;
      minimapsize = "fill";
      mouseWheelZoom = true;
      tabSize = 2;
      wordWrap = "on";
    };

    extensions = {
      autoCheckUpdates = false;
      autoUpdate = false;
    };

    # >>> TERMINAL
    terminal.integrated = {
      cursorBlinking = true;
      cursorStyle = "line";
      cursorWidth = 1.8;
      fontSize = 18;
      fontWeight = "400";
      fontLigatures = true;
      lineHeight = 1.2;
      letterSpacing = 1.2;
      rightClickBehavior = "copyPaste";
    };

    # >>> FILE MANAGEMENT
    files = {
      associations = {
        ".env" = "dotenv";
        ".envrc" = "shellscript";
      };
      autoSave = "afterDelay";
      exclude = {
        "**/.classpath" = true;
        "**/.factorypath" = true;
        "**/.direnv" = true;
        "**/.git" = false;
        "**/.project" = true;
        "**/.settings" = true;
      };
      trimFinalNewlines = true;
      trimTrailingWhitespace = true;
    };

    # >>> EXPLORER
    explorer = {
      confirmDelete = false;
      incrementalNaming = "smart";
      compactFolders = false;
      excludeGitIgnore = true;
    };

    # >>> GIT
    git = {
      autofetch = true;
      confirmSync = false;
      enableSmartCommit = true;
    };

    # >>> WORKBENCH
    workbench = {
      commandPalette.preserveInput = true;
      editor.revealIfOpen = true;
      quickOpen.preserveInput = true;
      panel.defaultLocation = "right";
      settings.openDefaultKeybindings = true;
      startupEditor = "none";
    };

    window = {
      autoDetectColorScheme = true;
      menuBarVisibility = "toggle";
      zoomLevel = 0;
    };
  };
}
