resolution: {pkgs, ...}: {
  services.xserver.displayManager.sddm = {
    enable = true;
  };
  services.xserver.enable = true;

  environment.systemPackages = [
    (pkgs.callPackage ./common/packages/sddm-theme { inherit resolution; })
  ];
}
