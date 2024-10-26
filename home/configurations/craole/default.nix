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
    inherit (config.DOTS) sessionVariables;
    # sessionVariables = with config.DOTS.Applications; {
    #   EDITOR = editor.primary;
    #   EDITOR_SECONDARY = editor.secondary;
    #   VISUAL = visual.primary;
    #   VISUAL_SECONDARY = visual.secondary;
    #   BROWSER = browser.primary;
    #   BROWSER_SECONDARY = browser.secondary;
    #   TERMINAL = terminal.primary;
    #   TERMINAL_SECONDARY = terminal.secondary;
    # };
  };
  imports =
    [
      ./options.nix
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
      lf
      lsd
      mpv
      nix
      ripgrep
      starship
    ]);
}
