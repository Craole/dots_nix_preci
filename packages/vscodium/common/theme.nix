{ userArgs, pkgs, ... }:
let
  app = "vscode";
  inherit (userArgs.theme) colors icons;
  inherit (icons.${app}) iconTheme productIconTheme;
  inherit (colors) mode;
  inherit (colors.${mode}) scheme palette;
  # inherit (deviations.${app}) statusBar;
  colorTheme = scheme.${app};
in
{
  programs.vscode = {
    extensions =
      with pkgs.vscode-extensions;
      [
        antfu.icons-carbon
        pkief.material-icon-theme
        pkief.material-product-icons
      ]
      ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "base16-tinted-themes";
          publisher = "TintedTheming";
          version = "0.5.0";
          sha256 = "sha256-OHrs5YTgbPQlAuWe7yXQj+ZQaQxJ2KXadW2YozK/9G0=";
        }
        # {
        #   name = "beardedtheme";
        #   publisher = "beardedbear";
        #   version = "8.3.2";
        #   sha256 = "sha256-TwHuoXme0o6EeciA1lxhs5vmhGlDvaWlH8tjVmuSQH8=";
        # }
        {
          name = "better-comments";
          publisher = "aaron-bond";
          version = "3.0.2";
          sha256 = "sha256-hQmA8PWjf2Nd60v5EAuqqD8LIEu7slrNs8luc3ePgZc=";
        }
        {
          name = "line-width-indicator";
          publisher = "lbragile";
          version = "0.0.7";
          sha256 = "sha256-hqkbuy/JvZBXRNYDZiYbCDYEtesN+MfAr2y1zegNB64=";
        }
      ];

    userSettings = {
      workbench = {
        inherit colorTheme iconTheme productIconTheme;
        preferredDarkColorTheme = "base24-espresso";
        preferredLightColorTheme = "base24-one-light";
        colorCustomizations = {
          statusBar.background = palette.base00;
        };
      };

      material-icon-theme = {
        activeIconPack = "react";
        files.associations = {
          "justfile" = "robot";
          ".justfile" = "robot";
          # ".envrc" = "Bun";
        };
        folders.associations = {
          "days" = "job";
          "macros" = "Hooks";
          "crates" = "Stack";
          "rust" = "Debug";
          "challenges" = "Cluster";
          "Advent-of-Code" = "Middleware";
        };
        hidesExplorerArrows = true;
      };

      better-comments.tags = [
        {
          tag = "@";
          color = "#b203d4";
          strikethrough = false;
          underline = false;
          backgroundColor = "#ec8dff2a";
          bold = true;
          italic = true;
        }
        {
          tag = ">";
          color = "#6bc300";
          strikethrough = false;
          underline = false;
          backgroundColor = "transparent";
          bold = true;
          italic = true;
        }
        {
          tag = "{";
          color = "#11cbc9";
          strikethrough = false;
          underline = false;
          backgroundColor = "#252526";
          bold = true;
          italic = true;
        }
        {
          tag = "|";
          color = "#2bff00";
          strikethrough = false;
          underline = false;
          backgroundColor = "#f6feff13";
          bold = true;
          italic = true;
        }
        {
          tag = "HELP";
          color = "#fed200";
          strikethrough = false;
          underline = false;
          backgroundColor = "transparent";
          bold = true;
          italic = true;
        }
        {
          tag = "!";
          color = "#ff0000";
          strikethrough = false;
          underline = false;
          backgroundColor = "transparent";
          bold = false;
          italic = false;
        }
        {
          tag = "shellcheck";
          color = "#d8482c";
          strikethrough = false;
          underline = false;
          backgroundColor = "transparent";
          bold = false;
          italic = false;
        }
        {
          tag = "DOC";
          color = "#3498DB";
          strikethrough = false;
          underline = false;
          backgroundColor = "transparent";
          bold = true;
          italic = false;
        }
        {
          tag = "//";
          color = "#ffffff33";
          strikethrough = true;
          underline = false;
          backgroundColor = "#FF8C00";
          bold = false;
          italic = false;
        }
        {
          tag = "todo";
          color = "#FF8C00";
          strikethrough = false;
          underline = false;
          backgroundColor = "transparent";
          bold = false;
          italic = false;
        }
        {
          tag = "=";
          color = "#FF8C00";
          strikethrough = false;
          underline = false;
          backgroundColor = "transparent";
          bold = false;
          italic = false;
        }
        {
          tag = "*";
          color = "#98C379";
          strikethrough = false;
          underline = false;
          backgroundColor = "transparent";
          bold = false;
          italic = false;
        }
      ];

      LWI = {
        style = {
          fontStyle = "italic";
          fontWeight = "100";
        };
        breakpoints = [
          {
            color = "rgb(0, 255, 0, 0.6)";
            column = 54;
          }
          {
            color = "rgb(255, 255, 0, 0.6)";
            column = 69;
          }
          {
            color = "rgb(255, 0, 0, 0.6)";
            column = 79;
          }
        ];
      };
    };
  };
}
