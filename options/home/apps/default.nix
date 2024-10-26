{
  nixosConfig,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with types;
{
  options.DOTS.Applications = with config.DOTS.Applications; {
    launcher = {
      modifier = mkOption {
        description = "Modifier key for window managers";
        default = "SUPER";
        type = str;
      };
      primary = {
        name = mkOption {
          default = pkgs.rofi;
          description = "Launcher name";
          type = either (either package path) str;
        };
        command = mkOption {
          description = "Launcher command";
          default = "rofi -show-icons -show drun";
          type = either (either package path) str;
        };
      };
      secondary = {
        name = mkOption {
          default = pkgs.anyrun;
          description = "SeconLauncher name";
          type = either (either package path) str;
        };
        command = mkOption {
          default = pkgs.anyrun;
          description = "Launcher command";
          type = either (either package path) str;
        };
      };
    };
    terminal = {
      primary = {
        name = mkOption {
          default = "Foot";
          description = "The primary terminal emulator name";
          type = either (either package path) str;
        };
        path = mkOption {
          default = pkgs.foot;
          description = "The primary terminal emulator path";
          type = either (either package path) str;
        };
        command = mkOption {
          default = "footclient";
          description = "The primary terminal emulator command";
          type = either (either package path) str;
        };
      };
      secondary = {
        name = mkOption {
          default = "Wezterm";
          description = "The secondary terminal emulator name";
          type = either (either package path) str;
        };
        path = mkOption {
          default = pkgs.wezterm;
          description = "The secondary terminal emulator path";
          type = either (either package path) str;
        };
        command = mkOption {
          default = terminal.secondary.path;
          description = "The secondary terminal emulator command";
          type = either (either package path) str;
        };
      };
    };
    editor = {
      primary = {
        name = mkOption {
          default = "Helix Editor";
          description = "The primary code ediitor";
          type = either (either package path) str;
        };
        path = mkOption {
          default = pkgs.helix;
          description = "The primary code editor path";
          type = either (either package path) str;
        };
        command = mkOption {
          default = editor.primary.path;
          description = "The primary code editor command";
          type = either (either package path) str;
        };
      };
      secondary = {
        name = mkOption {
          default = "Nano";
          description = "The secondary code ediitor";
          type = either (either package path) str;
        };
        path = mkOption {
          default = pkgs.nano;
          description = "The secondary code ediitor";
          type = either (either package path) str;
        };
        command = mkOption {
          default = editor.secondary.path;
          description = "The secondary code ediitor";
          type = either (either package path) str;
        };
      };
    };
    visual = {
      primary = {
        name = mkOption {
          default = "Visual Studio Code";
          description = "The primary gui code editor name";
          type = either (either package path) str;
        };
        path = mkOption {
          default = pkgs.vscode-fhs;
          description = "The primary gui code editor path";
          type = either (either package path) str;
        };
        command = mkOption {
          default = visual.secondary.path;
          description = "The primary gui code editor command";
          type = either (either package path) str;
        };
      };
      secondary = {
        name = mkOption {
          default = "Zed Editor";
          description = "The secondary Integred Development Environment";
        };
        path = mkOption {
          default = pkgs.zed-editor;
          description = "Secondary browser name";
          type = either (either package path) str;
        };
        command = mkOption {
          default = visual.secondary.path;
          description = "The secondary IDE command";
          type = either (either package path) str;
        };
      };
    };
    browser = {
      primary = {
        name = mkOption {
          default = "Brave";
          description = "Secondary browser title";
          type = str;
        };
        path = mkOption {
          default = pkgs.brave;
          description = "Secondary browser name";
          type = either (either package path) str;
        };
        command = mkOption {
          default = browser.secondary.path;
          description = "Secondary browser command";
          type = either (either package path) str;
        };
      };
      secondary = {
        name = mkOption {
          default = "Microsoft Edge";
          description = "Secondary browser title";
          type = str;
        };
        path = mkOption {
          default = pkgs.microsoft-edge-beta;
          # default = pkgs.microsoft-edge-dev;
          description = "Secondary browser name";
          type = either (either package path) str;
        };
        command = mkOption {
          default = browser.secondary.path;
          description = "Secondary browser command";
          type = either (either package path) str;
        };
      };
    };
    git = {
      user = mkOption {
        default = "craole-cc";
        description = "Git user name";
        type = str;
      };
      email = mkOption {
        default = nixosConfig.DOTS.Libraries.fetchers.githubEmail {
          user = git.user;
          sha256 = "";
        };
        description = "Git user email";
        type = str;
      };
    };
  };
}
