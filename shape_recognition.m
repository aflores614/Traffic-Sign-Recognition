function x = shape_recognition(color_img) 

color_image_resize = imresize(color_img,[500,500]);
img_gray = rgb2gray(color_img);
img = imbilatfilt(img_gray);
img_s = imgaussfilt(img,2);
img = imresize(img_s,[500,500]);
sigma = 0.2;
alpha = 0.3;
img_e = locallapfilt(img, sigma, alpha);
BW = im2bw(img_e);
%% 

BW_I = ~BW;
BW2 = imfill(BW_I,'holes');
BW3 = imfill(BW,'holes');
BW4 = BW2 & BW3;
BW5 = BW4 & BW2;
BW5 = bwareafilt(BW5,1,'largest');
SE = strel("diamond",10);
BW5 = imerode(BW5,SE);
BW5 = imdilate(BW5,SE);
%% 

x = BW5;
Diamond = 'Diamond Shape';
STOP_Sign = 'Hexagonal Shape';
Traingle = 'Triangle Shape';
Sqaure = 'Square';
%% 

[B,L] = bwboundaries(BW5, 'noholes');
 s = regionprops(L,'all');
 %% 
 
shape_dect = imcrop(BW5,s.BoundingBox);
extent_value = pixel_count(shape_dect);
name = shape_name(extent_value);
%% 

sign_dect = imcrop(BW,s.BoundingBox);
sign_dect = imresize(sign_dect, [180,180]);
SED = strel("diamond",4);
sign_dect = imdilate(sign_dect,SED);
sign_dect = imerode(sign_dect,SED);

%% 

if strcmp(name, Diamond)
    name_sign = diamond_sign(sign_dect);

elseif strcmp(name, STOP_Sign)
    name_sign = 'STOP SIGN';
elseif strcmp(name, Sqaure)
 name_sign = square_sign(sign_dect);

elseif strcmp(name, Traingle)
    name_sign = 'Yield Sign';
else
       name_sign ='Still working'

end
%% 


figure,
imshow(color_image_resize),
title('Results Logical');
 text(25,25 , name, 'Color','green','FontSize',25);
 text(25,70 , name_sign, 'Color','green','FontSize',25);

hold on
for k = 1 : length(s)
  thisBB = s(k).BoundingBox;
  rectangle('Position', [thisBB(1),thisBB(2),thisBB(3),thisBB(4)],...
  'EdgeColor','g','LineWidth',3 )
end

hold off


end
