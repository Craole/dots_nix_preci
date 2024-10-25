{ nixosConfig, ... }:
let
  #| Variables
  config = nixosConfig.home-manager.users.craole;
  stateVersion = nixosConfig.system.stateVersion;

  prefs = {
    modifier = "SUPER";
    browser = {
      primary = "brave";
      secondary = "firefox";
    };
    terminal = {
      primary = "footclient";
      secondary = "kitty";
    };
    editor = {
      primary = "hx";
      secondary = "zeditor";
    };
    visual = {
      primary = "code";
      secondary = "zeditor";
    };
  };

  #| Modules
  # services = import ./services { inherit nixosConfig config prefs; };
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
  imports = [
    ./programs
    # services
    # custom
    packages.git
    # ../../packages/freetube
    # ../../packages/helix
    # ../../packages/git
    # ../../packages/starship
    # ../../packages/lsd
    # ../../packages/eza
    # ../../packages/foot
    # # ../../packages/bat
    # ../../packages/fd
    # ../../packages/ripgrep

  ];
}
