function meshDir = LoadLibMeshContour
currDir = cd;
meshDir = fileparts(which('libMeshContour.dll'));
if ~libisloaded('libMeshContour')
	cd(meshDir)
	loadlibrary('libMeshContour','MeshContour.h')
	cd(currDir);
end

