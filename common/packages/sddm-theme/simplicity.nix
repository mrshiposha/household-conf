{ resolution, stdenv, fetchFromGitLab, rsync }: stdenv.mkDerivation rec {
  pname = "simplicity-sddm-theme";
  version = "1.0";
  dontBuild = true;
  buildInputs = [ rsync ];
  installPhase = let login-screen = ../../images/${resolution}/login-screen.jpg; in ''
    mkdir -p $out/share/sddm/themes
    mkdir -p $out/share/sddm/themes/simplicity/images
    cp ${login-screen} $out/share/sddm/themes/simplicity/images/background.jpg
    rsync -av $src/simplicity $out/share/sddm/themes --exclude images/background.jpg
  '';
  src = fetchFromGitLab {
    owner = "isseigx";
    repo = pname;
    rev = version;
    sha256 = "1g528qqxjzgfj3w27csr3lqjxxwbj3h6rj45br0djrqgyirrp4kr";
  };
}
