%{
Matlab write ini file
M.S. Angela Wong
14 Oct 2022
%}
function [result] = writeIniFile(FilePath,section,key,value)
 result = 1;
 if(exist(FilePath,'file') ~= 2)
     result = 0;
	 return;
 end
 fid = fopen(FilePath);
 isFindSection=0;
 isFound=0;
 WriteAllText = '';
 sectionKey = sprintf('[%s]',section);
 while ~feof(fid)
    findSection = 0;
 	tline = fgetl(fid);
 	if ~ischar(tline) || isempty(tline)
 		continue;
	end
	tline(find(isspace(tline))) = []; 
    sectionIndex = strfind(tline,'[');
    sectionKeyIndex = strfind(tline,sectionKey);
    keyIndex = strfind(tline, [key '=']);
    if ~isempty(sectionKeyIndex)
        isFindSection=1;
    elseif ~isempty(sectionIndex)
        isFindSection=0;
    elseif ((~isempty(keyIndex))&& (isFindSection==1))
        mytext = [key '=' value];
        tline=mytext;
		 isFound=1;
    end
	WriteAllText = sprintf('%s%s\r\n',WriteAllText,tline);
 end
 fclose(fid); 

 if (isFound == 0)
     result=0;
 end

 fid = fopen(FilePath,'w+');
 fprintf(fid,'%s',WriteAllText);
 fclose(fid);
end