{ pkgs, ... }: with pkgs; {
  environment.systemPackages = [
    git
    curl
    pciutils
    nix-prefetch-git
  ];
}
