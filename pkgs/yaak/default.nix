{
  appimageTools,
  hostPlatform,
  fetchurl,
  lib,
}: let
  pname = "yaak";
  version = "2024.12.1";

  source =
    {
      x86_64-linux = {
        name = "${pname}_${version}_amd64";
        hash = "sha256-clFRDwj9IacrWGb7hP7U2rxhIs5iJiZkm83U9Mztc1s=";
      };
    }
    .${hostPlatform.system}
    or (throw "${hostPlatform.system} is unsupported.");
in
  appimageTools.wrapType2 rec {
    inherit pname version;

    src = fetchurl {
      url = "https://github.com/mountain-loop/yaak/releases/download/v${version}/${source.name}.AppImage";
      inherit (source) hash;
    };

    contents = appimageTools.extract {
      inherit pname version src;
      postExtract = ''
        substituteInPlace $out/yaak.desktop --replace-fail 'yaak-app' 'yaak'
      '';
    };

    extraInstallCommands = ''
      install -Dm444 ${contents}/yaak.desktop $out/share/applications/yaak.desktop

      for size in "32x32" "128x128" "256x256@2"; do
        install -Dm444 ${contents}/usr/share/icons/hicolor/$size/apps/yaak-app.png $out/share/icons/hicolor/$size/apps/yaak.png
      done
    '';

    meta = {
      description = "Desktop API client for organizing and executing REST, GraphQL, and gRPC requests";
      homepage = "https://yaak.app/";
      license = with lib.licenses; [mit];
      maintainers = with lib.maintainers; [syedahkam];
      mainProgram = "yaak";
      platforms = ["x86_64-linux"];
      sourceProvenance = with lib.sourceTypes; [binaryNativeCode];
    };
  }
