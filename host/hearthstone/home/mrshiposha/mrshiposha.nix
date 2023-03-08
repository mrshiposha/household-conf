{
  common,
  username,
  person,
  stateVersion,
  ...
}:
{ pkgs, ... }: with pkgs; {
  imports = [
    (import "${common}/home/base.nix" { inherit common username stateVersion; })
    (import "${common}/home/git.nix" { name = person; email = "${username}@gmail.com"; })
    (import "${common}/functions/home-file.nix" {
      name = "sway-common";
      source-root = "${common}/home";
      path = ".config/sway/config";
    })
    (import "${common}/functions/home-file.nix" {
      name = "eww-common";
      source-root = "${common}/home";
      path = ".config/eww";
    })
    "${common}/home/dev.nix"
    "${common}/home/launcher.nix"
    (import "${common}/home/terminal.nix" { inherit common; })
    "${common}/home/vscode.nix"
    "${common}/home/firefox.nix"
    "${common}/home/telegram.nix"
    "${common}/home/image-view.nix"
    "${common}/home/vlc.nix"
  ];
}
