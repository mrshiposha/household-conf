{ pkgs, ... }: with pkgs; {
  environment.systemPackages = [
    git
    curl
    pciutils
    nix-prefetch-git
    gcc
    glib
    glibc
    lshw
    # gnupg
    # pinentry
  ];

  programs = {
    # gnupg.agent = {
    #   enable = true;
    #   pinentryFlavor = "qt";
    # };

    ssh.askPassword = "";
  };

  services.dbus.enable = true;
}
