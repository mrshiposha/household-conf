{ resolution, stdenv, fetchFromGitLab }: stdenv.mkDerivation rec {
  pname = "simplicity-sddm-theme";
  version = "1.0";
  dontBuild = true;
  installPhase = let login-screen = ../images/${resolution}/login-screen.jpg; in ''
    mkdir -p $out/share/sddm/themes
    cp -a $src/simplicity $out/share/sddm/themes
    ls -la $out/share/sddm/themes/simplicity
    ls -la $out/share/sddm/themes/simplicity/images
    rm $out/share/sddm/themes/simplicity/images/background.jpg
    cp ${login-screen} $out/share/sddm/themes/simplicity/images/background.jpg
  '';
  src = fetchFromGitLab {
    owner = "isseigx";
    repo = pname;
    rev = version;
    sha256 = "1g528qqxjzgfj3w27csr3lqjxxwbj3h6rj45br0djrqgyirrp4kr";
  };
}
