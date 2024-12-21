function all_images = LoadImages(source_path, imagetype, range)
if nargin==1
    imagetype = 'uint16';
end
try
    source_path
    imges = dir(append(source_path ,'*.tif'));
    imge_num = length(imges);
    shapes = size(imread(append(imges(1).folder, '/' ,imges(1).name)));
    if nargin==2
        range = [1 imge_num];
    end  
    
    all_images = zeros(range(2)-range(1)+1, shapes(1), shapes(2),imagetype);

    for i = range(1):range(2)
        img = imread(append(imges(i).folder, '/' ,imges(i).name));
        all_images(i-range(1)+1,:,:) = img;
    end
    
catch
    source_path;
    info = imfinfo(source_path);
    num_images = numel(info);
    if nargin==2
        range = [1 num_images];
    end
    all_images = zeros(range(2)-range(1)+1, info(1).Height, info(1).Width); 
    
    for k = range(1):range(2)
        img = imread(source_path, k);
        all_images(k-range(1)+1,:,:) = img;
        % ... Do something with image A ...
    end
end
end