{ config, lib, ... }:
with lib;
# with filesystem;
with types;
{
  options.DOTS.Defaults = {
    sessionVariables = mkOption {
      default = {
        EDITOR = "hx";
        VISUAL = "code";
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

    applications = with applications; {
      launcher = {
        modifier = mkOption {
          description = "Modifier key for window managers";
          default = "SUPER";
          type = str;
        };
        primary = {
          name = mkOption {
            type = str;
            default = "rofi";
            description = "Launcher name";
          };
          command = mkOption {
            type = str;
            default = "rofi -show-icons -show drun";
            description = "Launcher command";
          };
        };
        secondary = {
          name = mkOption {
            type = str;
            default = "anyrun";
            description = "SeconLauncher name";
          };
          command = mkOption {
            type = str;
            default = "anyrun";
            description = "Launcher command";
          };
        };
      };

      terminal = {
        primary = mkOption {
          default = "foot";
          description = "Primary terminal emulator";
          type = str;
        };
        secondary = mkOption {
          default = "wezterm";
          description = "Secondary terminal emulator";
          type = str;
        };
        tertiary = mkOption {
          default = "kitty";
          description = "Teritiary terminal emulator";
          type = str;
        };
      };

      editor = {
        primary = mkOption {
          description = "The primary code editor";
          default = "hx";
          type = str;
        };
        secondary = mkOption {
          description = "The secondare code editor";
          default = "code";
          type = str;
        };
      };

      visual = {
        primary = mkOption {
          description = "The primary Integred Development Environment";
          default = "code";
          type = str;
        };
        secondary = mkOption {
          description = "The secondary Integred Development Environment";
          default = "zed";
          type = str;
        };
      };

      browser = {
        primary = {
          name = mkOption {
            type = str;
            default = "brave";
            description = "Primary browser name";
          };
          command = mkOption {
            type = str;
            default = "brave";
            description = "Primary browser command";
          };
        };
        secondary = {
          name = mkOption {
            type = str;
            default = "Microsoft Edge";
            description = "Secondary browser name";
          };
          command = mkOption {
            type = str;
            default = "microsoft-edge-dev";
            description = "Secondary browser command";
          };
        };
      };

      bat = {
        enable = mkEnableOption "bat";
        package = mkPackageOption pkgs "bat" { };
        config = mkOption { default = { }; };
        themes = mkOption { default = { }; };
        syntaxes = mkOption { default = { }; };

        export = mkOption {
          default = {
            inherit (bat)
              enable
              package
              config
              themes
              ;
          };
        };
      };

      btop = {
        enable = mkEnableOption "btop";
        package = mkPackageOption pkgs "btop" { };
        export = mkOption { default = if btop.enable then { inherit (btop) enable package; } else { }; };
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
