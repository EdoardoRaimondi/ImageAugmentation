function[im_noise,im_noise2]=noise(im)
im_noise=double(im);
[y,x,z]=size(im_noise);

%random noise
noise=randi(75,y,x,z);

%noise on the blue channel
BL(:,:)=im_noise(:,:,3);
noiseBL(:,:)=noise(:,:,3);
for step=1:3
    BL(find(BL~=255))=BL(find(BL~=255))+noiseBL(find(BL~=255));
end
im_noise(:,:,3)=BL;
im_noise=uint8(im_noise);

%add noise in all the bands
im_noise2=uint8(double(im)+noise);
end