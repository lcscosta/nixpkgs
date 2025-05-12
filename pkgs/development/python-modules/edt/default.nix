{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  wheel,
  gcc,
  cython,
  pbr,
  python,
  numpy,
}:

let
  pname = "edt";
  version = "3.0.0";
in
buildPythonPackage {
  inherit pname version;

  pyproject = true;

  build-system = [
    setuptools
    wheel
    gcc
    cython
    pbr
  ];

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-1lAEyiG96s1xaAcKm1gf2cRJ6QYzl1QMIrxamq7Dh04=";
  };

  dependencies = [ numpy ];

  meta = with lib; {
    homepage = "https://github.com/seung-lab/euclidean-distance-transform-3d";
    description = "Euclidean distance & signed distance transform for multi-label 3D anisotropic images using marching parabolas.";
    changelog = "https://github.com/seung-lab/euclidean-distance-transform-3d/blob/master/ChangeLog";
    license = licenses.lgpl3Only;
    maintainers = with maintainers; [ lcscosta ];
  };
}
