%{
M.S. Angela Wong
Operation:read ini file
Date:14Oct2022
%}
function [value] = readIniFile(FilePath,section,key)
 value = ' ' ;
 if(exist(FilePath,'file') ~= 2)
	 return;
 end
 fid = fopen(FilePath);
 isFindSection=0;
 sectionKey = sprintf('[%s]',section);
 while ~feof(fid)
 	 tline = fgetl(fid);
 	 if ~ischar(tline) || isempty(tline)
 		continue;  
     end
      sectionIndex = strfind(tline,'[');
      sectionKeyIndex = strfind(tline,sectionKey);
	  Index = strfind(tline, [key '=']);
      if ~isempty(sectionKeyIndex)
        isFindSection=1;
      elseif ~isempty(sectionIndex)
        isFindSection=0;
      elseif ((~isempty(Index))&& (isFindSection==1))
		ParamName = strsplit(tline, '=');
		value = ParamName {2};
		break;
      end 
 end
 fclose(fid); 
end