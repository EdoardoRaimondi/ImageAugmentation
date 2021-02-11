function [image]=method1(im)
for i=1:3
    %calcolo DCT dell'immagine originale per ogni dimensione
    DCT=dct2(im(:,:,i));
    d=DCT;
    %in modo randomico setto 0 alcuni pixel
    DCT(randi([0 1], size(DCT,1),size(DCT,2))==0)=0;
    % pixel in posizione (1,1) non lo modifico
    DCT(1,1)=d(1,1);
    %retroproiezione
    image(:,:,i)=idct2(DCT);
end
image=uint8(image);
    
end