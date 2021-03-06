{ stdenv, fetchurl, pkgconfig, glib, libxml2, libxslt, getopt, nixUnstable, dysnomia, libintlOrEmpty, libiconv }:

stdenv.mkDerivation {
  name = "disnix-0.7.2";
  
  src = fetchurl {
    url = https://github.com/svanderburg/disnix/releases/download/disnix-0.7.2/disnix-0.7.2.tar.gz;
    sha256 = "1cgf7hgqrwsqgyc77sis0hr7cwgk3vx8cd4msgq11qbwywi3b6id";
  };
  
  buildInputs = [ pkgconfig glib libxml2 libxslt getopt nixUnstable libintlOrEmpty libiconv dysnomia ];

  meta = {
    description = "A Nix-based distributed service deployment tool";
    license = stdenv.lib.licenses.lgpl21Plus;
    maintainers = [ stdenv.lib.maintainers.sander ];
    platforms = stdenv.lib.platforms.unix;
  };
}
