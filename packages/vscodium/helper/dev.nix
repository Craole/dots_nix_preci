{ pkgs, ... }:
{
  programs.vscode = {
    extensions =
      with pkgs.vscode-extensions;
      [ codezombiech.gitignore ]
      ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "test-adapter-converter";
          publisher = "ms-vscode";
          version = "0.1.9";
          sha256 = "sha256-M53jhAVawk2yCeSrLkWrUit3xbDc0zgCK2snbK+BaSs=";
        }
        {
          name = "vscode-test-explorer";
          publisher = "hbenl";
          version = "2.21.1";
          sha256 = "sha256-fHyePd8fYPt7zPHBGiVmd8fRx+IM3/cSBCyiI/C0VAg=";
        }
        {
          name = "code-runner";
          publisher = "formulahendry";
          version = "0.12.1";
          sha256 = "sha256-DrMq4+juqJ+ilgmu2VwTtf3hIhgmuws7tM0Xwt+U9h8=";
        }
      ];
    keybindings = [ ];
    userSettings = { };
  };
}
