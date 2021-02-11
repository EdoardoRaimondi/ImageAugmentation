function[im_hsv]=saturation(im)
%converto immagine in hsv
im_hsv = rgb2hsv(im);
% 20% di saturazione in più
im_hsv(:, :, 2) = im_hsv(:, :, 2) * 1.2;
% oppure
% im_hsv(:, :, 2) = im_hsv(:, :, 2) + 0.2;
im_hsv(im_hsv > 1) = 1;  %valore limite
%converto in rgb
im_hsv = hsv2rgb(im_hsv);
%converto in uint8
im_hsv=uint8(im_hsv*255);
end