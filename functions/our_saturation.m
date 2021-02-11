function[im_hsv]=OurSaturation(im)
%rgb -> hsv
im_hsv = rgb2hsv(im);
%add saturation 
im_hsv(:, :, 2) = im_hsv(:, :, 2) * 1.2;
im_hsv(im_hsv > 1) = 1;  
%hsv -> rgb 
im_hsv = hsv2rgb(im_hsv);
im_hsv=uint8(im_hsv*255);
end