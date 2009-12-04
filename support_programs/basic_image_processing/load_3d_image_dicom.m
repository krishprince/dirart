function [im3d,info,zs,instances] = load_3d_image_dicom(filenamefilter)
%
% [im3d,info,zs,instances] = load_3d_image_dicom(filenamefilter)
%
%{
Copyrighted by:

Deshan Yang, dyang@radonc.wustl.edu
10/10/2007
Department of radiation oncology
Washington University in Saint Louis
%}

n=1;
curdir = pwd;
pathname = curdir;
filename = [];
instances = [];
im3d = [];
info = [];
zs = [];
instances = [];

if ~exist('filenamefilter','var')
	filenamefilter = [];
end

if isempty(filenamefilter)
	while 1
		cd(pathname);
		if isempty(filename)
			[filename, pathname] = uigetfile({'*.IMA;*.dcm','DICOM image files';'*.*','All files (*.*)'},...
				sprintf('Loading images'), 'MultiSelect', 'on');
		else
			filename = sortn(filename);
			[filename, pathname] = uigetfile({'*.IMA;*.dcm','DICOM image files';'*.*','All files (*.*)'},...
				sprintf('Loading images, last file was %s',filename{end}), 'MultiSelect', 'on');
		end

		cd(curdir);

		if( length(filename) == 1 & filename == 0 )
			break;
		end

		%H = waitbar(0,'Loading ...');
		fprintf('\n');
		for k = 1:length(filename)
			fprintf('.');
			%waitbar((k-1)/length(filename),H,sprintf('Loading %s ...',filename{k}));
			info = dicominfo([pathname,filename{k}]);
			position(:,n) = info.ImagePositionPatient;
			instances = [instances info.InstanceNumber];
			im3d2(:,:,n) = dicomread([pathname,filename{k}]);
			n = n+1;
		end
		fprintf('\n');
		%close(H);
	end
else
	filename = dir(filenamefilter);
	pathstr = fileparts(filenamefilter);
	if length(pathstr) > 0
		pathstr = [pathstr filesep];
	end
	
	%H = waitbar(0,'Loading ...');
	fprintf('\n');

% 	im3dtemp = dicomread([pathstr filename(end).name]);
% 	dim = size(im3dtemp);
% 	im3d2 = zeros([dim(1) dim(2) length(filename)],class(im3dtemp));
	
	for k = 1:length(filename)
		fprintf('.');
		%waitbar((k-1)/length(filename),H,sprintf('Loading %s ...',filename(k).name));
		if isdir([pathstr filename(k).name])
			continue;
		end
		try
			info1 = dicominfo([pathstr filename(k).name]);
			if ~isfield(info1,'PatientPosition')
				continue;
			end
			info = info1;
			
			position(:,n) = info.ImagePositionPatient;
			instances = [instances info.InstanceNumber];
			im3d2(:,:,n) = dicomread([pathstr filename(k).name]);
			n = n+1;
		catch
			fprintf('ERROR: %s\n',lasterr);
			return;
		end
	end
	fprintf('\n');
	%close(H);
end

pos1 = position(3,:);
[pos2,idx] = unique(pos1);
if strcmpi(info.PatientPosition ,'HFS')
	pos2 = flipud(pos2);
	idx = fliplr(idx);
end

im3d = im3d2(:,:,idx);
instances = instances(idx);
zs = pos2;

% [pos3,idx3] = sort(instances);
% 
% im3d = im3d2(:,:,idx);
% zs = pos2;
% 
% % Checking for duplicated z values
% [zs,idx4] = unique(zs);
% % zs = -zs;	% Flip the z values
% im3d = im3d(:,:,idx4);
% 
% %im3d = im3d2(:,:,idx3);
% instances = instances(idx3);[pos3,idx3] = sort(instances);
% 
% im3d = im3d2(:,:,idx);
% zs = pos2;
% 
% % Checking for duplicated z values
% [zs,idx4] = unique(zs);
% % zs = -zs;	% Flip the z values
% im3d = im3d(:,:,idx4);
% 
%im3d = im3d2(:,:,idx3);
% instances = instances(idx3);


