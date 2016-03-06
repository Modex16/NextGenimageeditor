% Get all PDF files in the current folder
files = dir('*.jpg');
% Loop through each
for id = 1:length(files)
    % Get the file name (minus the extension)
    [~, f] = fileparts(files(id).name);
      % Convert to number
     % num = str2double(f);
    % fprintf(f);
     %fprintf('\n');
    % files(id) = im2bw(files(id));
     newname = strcat(f,'.png');
%       if ~isnan(num)
%           % If numeric, rename
           movefile(files(id).name, newname);
%       end
end