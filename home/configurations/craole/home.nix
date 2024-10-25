{ nixosConfig, prefs, ... }:
{
  home = {
    inherit (nixosConfig.system) stateVersion;
    sessionVariables = {
      EDITOR = prefs.editor.primary;
      EDITOR_SECONDARY = prefs.editor.secondary;
      VISUAL = prefs.visual.primary;
      VISUAL_SECONDARY = prefs.visual.secondary;
      BROWSER = prefs.browser.primary;
      BROWSER_SECONDARY = prefs.browser.secondary;
      TERMINAL = prefs.terminal.primary;
      TERMINAL_SECONDARY = prefs.terminal.secondary;
    };
  };
}
