function[im_imadjust,im_histeq,im_adapthisteq]=contrast(im)
%rgb -> lab
im_lab = rgb2lab(im);
%lightness  normalization to [0,1]
max_luminosity = 100;
L = im_lab(:,:,1)/max_luminosity;

%Adjust image intensity
im_imadjust = im_lab;
im_imadjust(:,:,1) = imadjust(L)*max_luminosity;
im_imadjust = uint8(lab2rgb(im_imadjust)*255);

%histogram equalization 
im_histeq = im_lab;
im_histeq(:,:,1) = histeq(L)*max_luminosity;
im_histeq = uint8(lab2rgb(im_histeq)*255);

%Adaptive Histogram Equalization
im_adapthisteq = im_lab;
im_adapthisteq(:,:,1) = adapthisteq(L)*max_luminosity;
im_adapthisteq = uint8(lab2rgb(im_adapthisteq)*255);
end