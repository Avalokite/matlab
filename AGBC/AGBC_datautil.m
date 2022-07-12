files = dir('*.txt') ;   % you are in the folder of files 
N = length(files) ;
data = [];
% loop for each file 
for i = 1:N
    thisfile = files(i).name ;
    text = fileread(thisfile);

    first = files(i).name(1);
    first = str2num(first);
    resp1 = text(1);
    if resp1 == 'y'
        resp1 = 1;
    else
        resp1 = 0;
    end

    resp2 = text(2);
    if resp2 =='y'
        resp2 = 1;
    else
        resp2 = 0;
    end

    if first == 1
        data = [data; resp1 resp2 first];
    else
        data = [data; resp2 resp1 first];
    end

end