%{
Test ini operation
Date:14 Oct 2022
test read write operation of ini
%}
clc;clear all;close all;
filename = "test.ini";
[user1Name] = readIniFile(filename,'user3','name');
if (user1Name==' ')
    fprintf("Read fail=>cannot found file or keyword!\n");
else 
    fprintf("Read success!\n");
end
ret = writeIniFile(filename,'user2','name','DaisyWong');
if ret==1
    fprintf("Write success!\n");
else 
     fprintf("Write fail=>cannot found file or keyword!\n");
end
[user2Name] = readIniFile(filename,'user2','name');
if (user2Name==' ')
    fprintf("Read fail=>cannot found file or keyword!\n");
else 
    fprintf("Read success!\n");
end

