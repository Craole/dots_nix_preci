{ nixosConfig, ... }:
let
  #| Variables
  config = nixosConfig.home-manager.users.craole;
  stateVersion = nixosConfig.system.stateVersion;

  prefs = {
    browser = {
      primary = "brave";
      secondary = "firefox";
    };
    editor = {
      primary = "hx";
      secondary = "zeditor";
    };
    modifier = "SUPER";
    launcher = {
      primary = {
        name = "rofi";
        cmd = "rofi -show drun";
      };
      secondary = {
        name = "anyrun";
        cmd = "anyrun";
      };
    };
    terminal = {
      primary = "footclient";
      secondary = "kitty";
    };
    visual = {
      primary = "code";
      secondary = "zeditor";
    };
  };

  #| Modules
  packages = import ../../packages;
in
{
  home = {
    inherit stateVersion;
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
  imports =
    [
      ./git.nix
      ./helix.nix
    ]
    ++ (with packages; [
      bat
      eza
      fd
      foot
      gh
      gitui
      git
      helix
      lsd
      ripgrep
      starship
    ]);
}
