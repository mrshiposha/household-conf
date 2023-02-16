{ config, pkgs, ... }: let root = ./..; in {
  imports = [
    <home-manager/nixos>
    "${root}/bootloader.nix"
    "${root}/system.nix"
    "${root}/timezone.nix"
    "${root}/shell.nix"
    "${root}/dev-related.nix"
    "${root}/users/users.nix"
  ];

  networking.hostName = "hearthstone";
  users.mutableUsers = false;
}
