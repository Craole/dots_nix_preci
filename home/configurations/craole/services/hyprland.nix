{ prefs, ... }:
let
  inherit (prefs)
    modifier
    terminal
    browser
    editor
    ;
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = modifier;

      bind = [
        "${modifier},Return,exec,${terminal.primary}"
        "${modifier},Shift+Return,exec,${terminal.secondary}"
        "${modifier},grave,exec,$TERMINAL"
        "${modifier},Shift+grave,exec,$TERMINAL_SECONDARY"
        "${modifier},b,exec,${browser.primary}"
        "${modifier},Shift+b,exec,${browser.secondary}"
        "${modifier},v,exec,$VISUAL"
        "${modifier},Shift+v,exec,$VISUAL_SECONDARY"
        "${modifier},c,exec,${editor.primary}"
        "${modifier},Shift+c,exec,${editor.secondary}"
      ];

    };
  };
}
