function meshDir = LoadLibMeshContour
currDir = cd;
meshDir = fileparts(which('libMeshContour.dll'));
if ~libisloaded('libMeshContour')
	cd(meshDir)
	try
		loadlibrary('libMeshContour','MeshContour.h')
	catch ME
		%print_lasterror(ME);
		meshDir = '';
	end
	cd(currDir);
end

