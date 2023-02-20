resolution: {pkgs, ...}:
let theme = "simplicity"; in {
  services.xserver.displayManager.sddm = {
    enable = true;
    inherit theme;
  };
  services.xserver.enable = true;

  environment.systemPackages = [
    (pkgs.callPackage ./common/packages/sddm-theme/${theme}.nix { inherit resolution; })
  ];
}
