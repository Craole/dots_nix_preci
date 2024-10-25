{
  config.programs.vscode.keybindings = [
    {
      key = "ctrl+t ctrl+m";
      command = "workbench.action.toggleMaximizedPanel";
    }
    {
      key = "ctrl+shift+";
      command = "workbench.action.openSettingsJson";
    }
    {
      key = "ctrl+alt+";
      command = "workbench.action.openGlobalKeybindingsFile";
    }
    {
      key = "ctrl+c";
      command = "editor.action.clipboardCopyAction";
      when = "textInputFocus";
    }
  ];
}
