{ prefs, ... }:
let 
inherit (prefs) modifier terminal browser editor;
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = modifier;

      bind = [
        "${modifier},Return,exec,${terminal.primary}"
        "${modifier},Shift+Return,exec,${terminal.secondary}"
        "${modifier},b,exec,${browser.primary}"
        "${modifier},Shift+b,exec,${browser.secondary}"
        "${modifier},grave,exec,${TERMINAL}"
        "${modifier},Shift+grave,exec,${TERMINAL_SECONDARY}"
        "${modifier},c,exec,${VISUAL}"
        "${modifier},Shift+c,exec,${VISUAL_SECONDARY}"
        "${modifier},v,exec,${VISUAL}"
        "${modifier},Shift+v,exec,${VISUAL_SECONDARY}"
        "${modifier},w,exec,${editor.primary}"
        "${modifier},Shift+w,exec,${editor.secondary}"
      ];

      general = {
        gaps.inner = 10;
        gaps.outer = 10;
        gaps.top = 10;
        gaps.bottom = 10;
        gaps.left = 10;
        gaps.right = 10;
      };

      window = {
        titlebar = {
          use-system-font = false;
          center = "center";
          left = "left";
          right = "right";
          font = "JetBrainsMono Nerd Font:style=Bold:size=12";
        };
        border.size = 1;
        border.color = "#FF0000";
        border.rounding = 10;
        gaps.inner = 10;
        gaps.outer = 10;
        gaps.top = 10;
        gaps.bottom = 10;
        gaps.left = 10;
        gaps.right = 10;
        animations.enabled = true;
        animations.duration = 0.2;
        animations.easing = "in-out-quad";
        animations.window.duration = 0.2;
        animations.window.easing = "in-out-quad";
        animations.fade.duration = 0.2;
        animations.fade.easing = "in-out-quad";
      };
    };
  };
}
