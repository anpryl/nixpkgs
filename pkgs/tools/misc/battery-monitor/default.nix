{ lib, pkgs }:
with lib;
with pkgs;
with pkgs.python3Packages;
buildPythonPackage rec {
  pname = "battery-monitor";
  version = "0.6";

  src = fetchFromGitHub {
    owner = "maateen";
    repo = "${pname}";
    rev = "8754ddf05332ad255d15a5274e4e42084cde6183";
    sha256 = "16sm2hsrwfjh7idw8r7w7xcvzq6pffmkhihb4mjn9frwvic12am9";
  };

  buildInputs = [
    wrapGAppsHook
  ];

  doCheck = false;

  propagatedBuildInputs = [
    acpi
    libnotify
    libappindicator
    pygobject3
    gobject-introspection
    gtk3
  ];

  meta = with lib; {
    homepage = "http://battery-monitor.maateen.me/";
    description = "Battery Monitor is a utility tool developed on Python3 and PyGtk3. It will notify user about charging, discharging, not charging and critically low battery state of the battery on Linux (Surely if battery is present).";
    license = licenses.gpl3;
  };
}
