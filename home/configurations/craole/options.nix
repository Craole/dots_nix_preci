{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
# with filesystem;
with types;
{
  options.DOTS = with config.DOTS; {
    sessionVariables = mkOption {
      default = with Applications; {
        EDITOR = editor.primary.command;
        EDITOR_SECONDARY = editor.secondary.command;
        VISUAL = visual.primary.command;
        VISUAL_SECONDARY = visual.secondary.command;
        BROWSER = browser.primary.command;
        BROWSER_SECONDARY = browser.secondary.command;
        TERMINAL = terminal.primary.command;
        TERMINAL_SECONDARY = terminal.secondary.command;
        LAUNCHER = launcher.primary.command;
        LAUNCHER_SECONDARY = launcher.secondary.command;
      };
      description = ''
        A set of environment variables used in the global environment.
        These variables will be set on shell initialisation (e.g. in /etc/profile).
        The value of each variable can be either a string or a list of
        strings.  The latter is concatenated, interspersed with colon
        characters.
      '';
      type = attrsOf (oneOf [
        (listOf (oneOf [
          float
          int
          str
        ]))
        float
        int
        str
        path
      ]);
      apply = mapAttrs (n: v: if isList v then concatMapStringsSep ":" toString v else toString v);
    };

    shellAliases = mkOption {
      default = {
        l = null;
        la = "eza --all";
        ll = "eza --long";
      };
      description = ''
        An attribute set that maps aliases (the top level attribute names in
        this option) to command strings or directly to build outputs. The
        aliases are added to all users' shells.
        Aliases mapped to `null` are ignored.
      '';
      type = attrsOf (nullOr (either str path));
    };

    Applications = with Applications; {
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

      # git = with git; {
      #   enable = mkEnableOption "Git" // {
      #     default =
      #       let
      #         isRequired =
      #           context != null
      #           && any (
      #             name:
      #             elem name [
      #               "development"
      #               # "productivity"
      #             ]
      #           ) context;
      #         isRequested = userName != null && userEmail != null;
      #       in
      #       isRequested;
      #     # isRequested || isRequired;
      #   };

      #   # enable = mkEnableOption "Git" // {
      #   #   default = userName != null && userEmail != null ;
      #   # };

      #   name = mkOption {
      #     description = "Git username";
      #     default = null;
      #     type = nullOr str;
      #   };

      #   email = mkOption {
      #     description = "Git enail";
      #     default = null;
      #     type = nullOr str;
      #   };

      #   sshKey = mkOption {
      #     description = "Git ssh key";
      #     default = null;
      #     type = nullOr str;
      #   };

      #   aliases = mkOption { default = { }; };
      #   attributes = mkOption { default = [ ]; };
      #   delta = mkOption { default = { }; };
      #   diff-so-fancy = mkOption { default = { }; };
      #   difftastic = mkOption { default = { }; };
      #   extraConfig = mkOption { default = { }; };
      #   hooks = mkOption { default = { }; };
      #   ignores = mkOption { default = [ ]; };
      #   includes = mkOption { default = [ ]; };
      #   iniContent = mkOption { default = { }; };
      #   lfs.enable = mkOption { default = enable; };
      #   package = mkPackageOption pkgs "gitFull" { };
      #   signing = null;
      #   userEmail = mkOption { default = email; };
      #   userName = mkOption { default = name; };

      #   export = mkOption {
      #     default =
      #       if git.enable then
      #         {
      #           inherit (git)
      #             aliases
      #             attributes
      #             delta
      #             diff-so-fancy
      #             difftastic
      #             enable
      #             extraConfig
      #             hooks
      #             ignores
      #             includes
      #             iniContent
      #             lfs
      #             package
      #             signing
      #             userName
      #             userEmail
      #             ;
      #         }
      #       else
      #         { };
      #   };
      # };

      # helix = {
      #   enable = mkEnableOption "Helix Text Editor" // {
      #     default =
      #       context != null
      #       && any (
      #         name:
      #         elem name [
      #           "minimal"
      #           "development"
      #         ]
      #       ) context;
      #   };

      #   defaultEditor = mkEnableOption "set as the default editor" // {
      #     default = helix.enable;
      #   };

      #   bindings = mkOption {
      #     default = {
      #       normal = {
      #         space = {
      #           space = "file_picker_in_current_directory";
      #         };
      #         "C-]" = "indent";
      #         C-s = ":write";
      #         C-S-esc = "extend_line";
      #         # C-S-o = ":config-open";
      #         # C-S-r = ":config-reload";
      #         # a = "move_char_left";
      #         # w = "move_line_up";
      #         A-j = [
      #           "extend_to_line_bounds"
      #           "delete_selection"
      #           "paste_after"
      #         ];
      #         A-k = [
      #           "extend_to_line_bounds"
      #           "delete_selection"
      #           "move_line_up"
      #           "paste_before"
      #         ];
      #         ret = [
      #           "open_below"
      #           "normal_mode"
      #         ];
      #         g.u = ":lsp-restart";
      #         esc = [
      #           "collapse_selection"
      #           "keep_primary_selection"
      #         ];
      #         A-e = [
      #           "collapse_selection"
      #           "keep_primary_selection"
      #         ];
      #         A-w = [
      #           "collapse_selection"
      #           "keep_primary_selection"
      #           ":write"
      #         ];
      #         A-q = ":quit";
      #       };

      #       select = {
      #         A-e = [
      #           "collapse_selection"
      #           "keep_primary_selection"
      #           "normal_mode"
      #         ];
      #         A-w = [
      #           "collapse_selection"
      #           "keep_primary_selection"
      #           "normal_mode"
      #           ":write"
      #         ];
      #         A-q = [
      #           "normal_mode"
      #           ":quit"
      #         ];
      #       };

      #       insert = {
      #         A-space = "normal_mode";
      #         A-e = "normal_mode";
      #         A-w = [
      #           "normal_mode"
      #           ":write"
      #         ];
      #         A-q = [
      #           "normal_mode"
      #           ":quit"
      #         ];
      #       };
      #     };
      #   };

      #   languages = mkOption {
      #     default = [
      #       {
      #         name = "nix";
      #         language-servers = [ "nil" ];
      #         formatter.command = "nixfmt";
      #         auto-format = true;
      #       }
      #       {
      #         name = "bash";
      #         indent = {
      #           tab-width = 2;
      #           unit = "	";
      #         };
      #         formatter = {
      #           command = "shfmt";
      #           arguments = "--posix --apply-ignore --case-indent --space-redirects --write";
      #         };
      #         auto-format = true;
      #       }
      #       {
      #         name = "rust";
      #         language-servers = [ "rust-analyzer" ];
      #         auto-format = true;
      #       }
      #       {
      #         name = "ruby";
      #         language-servers = [
      #           "rubocop"
      #           "solargraph"
      #         ];
      #         formatter = {
      #           command = "bundle";
      #           args = [
      #             "exec"
      #             "stree"
      #             "format"
      #           ];

      #           #   command = "rubocop";
      #           #   args = [
      #           #     "--stdin"
      #           #     "foo.rb"
      #           #     "-a"
      #           #     "--stderr"
      #           #     "--fail-level"
      #           #     "fatal"
      #           #   ];
      #           #   timeout = 3;
      #         };
      #         auto-format = true;
      #       }
      #       {
      #         name = "python";
      #         formatter = {
      #           command = "black";
      #           args = [
      #             "-"
      #             "-q"
      #           ];
      #         };
      #         auto-format = true;
      #       }
      #       {
      #         name = "sql";
      #         formatter = {
      #           command = "sqlformat";
      #           args = [
      #             "--reindent"
      #             "--indent_width"
      #             "2"
      #             "--keywords"
      #             "upper"
      #             "--identifiers"
      #             "lower"
      #             "-"
      #           ];
      #         };
      #       }
      #       {
      #         name = "toml";
      #         formatter = {
      #           command = "taplo";
      #           args = [
      #             "format"
      #             "-"
      #           ];
      #         };
      #         auto-format = true;
      #       }
      #       {
      #         name = "json";
      #         formatter = {
      #           command = "deno";
      #           args = [
      #             "fmt"
      #             "-"
      #             "--ext"
      #             "json"
      #           ];
      #         };
      #         auto-format = true;
      #       }
      #       {
      #         name = "markdown";
      #         formatter = {
      #           command = "deno";
      #           args = [
      #             "fmt"
      #             "-"
      #             "--ext"
      #             "md"
      #           ];
      #         };
      #         auto-format = true;
      #       }
      #       {
      #         name = "typescript";
      #         formatter = {
      #           command = "deno";
      #           args = [
      #             "fmt"
      #             "-"
      #             "--ext"
      #             "ts"
      #           ];
      #         };
      #         auto-format = true;
      #       }
      #       {
      #         name = "tsx";
      #         formatter = {
      #           command = "deno";
      #           args = [
      #             "fmt"
      #             "-"
      #             "--ext"
      #             "tsx"
      #           ];
      #         };
      #         auto-format = true;
      #       }
      #       {
      #         name = "javascript";
      #         formatter = {
      #           command = "deno";
      #           args = [
      #             "fmt"
      #             "-"
      #             "--ext"
      #             "js"
      #           ];
      #         };
      #         auto-format = true;
      #       }
      #       {
      #         name = "jsx";
      #         formatter = {
      #           command = "deno";
      #           args = [
      #             "fmt"
      #             "-"
      #             "--ext"
      #             "jsx"
      #           ];
      #         };
      #         auto-format = true;
      #       }
      #     ];
      #   };

      #   settings = mkOption {
      #     default = {
      #       auto-save = true;
      #       auto-format = true;
      #       bufferline = "never";
      #       cursorline = true;
      #       cursor-shape = {
      #         insert = "bar";
      #         normal = "block";
      #         select = "underline";
      #       };
      #       statusline = {
      #         left = [
      #           "mode"
      #           "spinner"
      #           "spacer"
      #           "file-modification-indicator"
      #         ];
      #         center = [ "file-name" ];
      #         right = [
      #           "diagnostics"
      #           "version-control"
      #           "selections"
      #           "position"
      #           "file-encoding"
      #         ];
      #         mode = {
      #           normal = "NORMAL";
      #           insert = "INSERT";
      #           select = "SELECT";
      #         };
      #         separator = "│";
      #       };
      #       idle-timeout = 50;
      #       line-number = "relative";
      #       lsp = {
      #         auto-signature-help = true;
      #         display-inlay-hints = true;
      #         display-messages = true;
      #         display-signature-help-docs = true;
      #         snippets = true;
      #       };
      #       indent-guides = {
      #         render = true;
      #         character = "╎"; # "▏", "╎", "┆", "┊", "⸽"
      #         skip-levels = 1;
      #         rainbow-option = "normal";
      #       };
      #       mouse = false;
      #       soft-wrap = {
      #         enable = true;
      #         wrap-at-text-width = true;
      #       };
      #       text-width = 120;
      #     };
      #   };

      #   export = mkOption {
      #     default =
      #       if helix.enable then
      #         {
      #           inherit (helix) enable defaultEditor;
      #           languages.language = helix.languages;
      #           settings = {
      #             editor = helix.settings;
      #             keys = helix.bindings;
      #           };
      #         }
      #       else
      #         { };
      #   };
      # };

      # hyprland = {
      #   enable = mkEnableOption "Hyprland wayland compositor" // {
      #     default = desktop.manager == "hyprland";
      #   };

      #   package = mkPackageOption pkgs "hyprland" { };

      #   plugins = mkOption {
      #     description = "The Hyprland plugins to use";
      #     default = [ ];
      #     type = listOf (either package path);
      #   };

      #   settings = mkOption {
      #     description = "The Hyprland settings to use";
      #     default = { };
      #     type = attrs;
      #   };

      #   systemd = mkOption {
      #     description = "The Hyprland settings to use";
      #     default = { };
      #     type = attrs;
      #   };

      #   bindings = mkOption {
      #     default = {
      #       "k" = "kitty";
      #       "w" = "firefox";
      #     };
      #     type = attrs;
      #   };

      #   workspaces = mkOption {
      #     default = [
      #       "1"
      #       "2"
      #       "3"
      #       "4"
      #       "5"
      #       "6"
      #       "7"
      #       "8"
      #       "9"
      #       "F1"
      #       "F2"
      #       "F3"
      #       "F4"
      #       "F5"
      #       "F6"
      #       "F7"
      #       "F8"
      #       "F9"
      #       "F10"
      #       "F11"
      #       "F12"
      #     ];
      #     type = listOf str;
      #   };

      #   directions = mkOption {
      #     default = {
      #       # Map keys (arrows and hjkl) to hyprland directions (l, r, u, d)
      #       left = "l";
      #       right = "r";
      #       up = "u";
      #       down = "d";
      #       h = "l";
      #       l = "r";
      #       k = "u";
      #       j = "d";
      #     };
      #   };

      #   variables = mkOption {
      #     default = with host.processor; [
      #       "WLR_RENDERER_ALLOW_SOFTWARE, ${if gpu == "nvidia" || cpu == "vm" then "1" else "0"}"
      #       "WLR_NO_HARDWARE_CURSORS, ${if gpu == "nvidia" || cpu == "vm" then "1" else "0"}"
      #       "NIXPKGS_ALLOW_UNFREE, ${if allowUnfree then "1" else "0"}"

      #       "XDG_CURRENT_DESKTOP,Hyprland"
      #       "XDG_SESSION_TYPE,wayland"
      #       "XDG_SESSION_DESKTOP,Hyprland"

      #       "SDL_VIDEODRIVER,wayland" # Known to be problematic
      #       "CLUTTER_BACKEND, wayland"
      #       "GDK_BACKEND,wayland,x11"

      #       "QT_QPA_PLATFORM,wayland;xcb"
      #       "QT_WAYLAND_DISABLE_WINDOWDECORATION, 1"
      #       "QT_AUTO_SCREEN_SCALE_FACTOR, 1"

      #       "NIXOS_OZONE_WL,1"
      #       "MOZ_ENABLE_WAYLAND, 1"

      #       # "GTK_THEME=Adwaita-dark"
      #       # "XCURSOR_SIZE, 16"
      #       # "XCURSOR_THEME, Bibata-Modern-Ice"
      #       # "GTK_THEME=${gtk.name}"
      #       # "XCURSOR_SIZE,32"
      #       # "XCURSOR_SIZE,${(toString cursor.size)}"
      #       # "XCURSOR_THEME,${cursor.name}"
      #     ];
      #   };

      #   export = mkOption {
      #     default =
      #       if hyprland.enable then
      #         {
      #           inherit (hyprland) enable package plugins;
      #           settings = {
      #             env = hyprland.variables;
      #           };
      #         }
      #       else
      #         { };
      #   };
      # };
    };
  };
}

# prefs = {
#   browser = {
#     primary = "brave";
#     secondary = "firefox";
#   };
#   editor = {
#     primary = "hx";
#     secondary = "zeditor";
#   };
#   modifier = "SUPER";
#   launcher = {
#     primary = {
#       name = "rofi";
#       cmd = "rofi -show drun";
#     };
#     secondary = {
#       name = "anyrun";
#       cmd = "anyrun";
#     };
#   };
#   terminal = {
#     primary = "footclient";
#     secondary = "kitty";
#   };
#   visual = {
#     primary = "code";
#     secondary = "zeditor";
#   };
# };
