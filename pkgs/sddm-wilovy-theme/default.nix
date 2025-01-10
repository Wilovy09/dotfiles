{
  pkgs,
  stdenvNoCC,
}: let
  basePath = "$out/share/sddm/themes/sddm-wilovy-theme";
in
  stdenvNoCC.mkDerivation {
    pname = "sddm-wilovy-theme";
    version = "1.0";
    src = ./.;

    dontWrapQtApps = true;
    propagatedBuildInputs = with pkgs.kdePackages; [qt5compat qtsvg];

    installPhase = ''
      mkdir -p ${basePath}
      cp -r $src/* ${basePath}
    '';
  }
