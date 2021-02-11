function[image] = method3(im,samples)
%calcolo DCT dell'immagine originale per ogni dimensione 
for i=1:3
    DCT = dct2(im(:,:,i));
    %ciclo sugli elementi dell'array(ognuno occupa 3 dimensioni)
    for j=1:5
        %prendo uno alla volta le immagini samples e calcolo la DCT su
        %ognuna
        sample=samples(:,:,:,j);
        sampleDCT = dct2(sample(:,:,i));
        [x,y] = size(DCT);
        %ciclo su tutte le righe e colonne della matrice DCT dell'immagine
        %originale
        for r=1:x
            for c=1:y
                %prendo un coefficiente random, se è maggiore di 0.95(quindi
                %con probabilità 0.05) cambio l'elemento (r,c) della DCT
                %originale con quella calcolata per samples
                coeff = rand();
                if coeff>=0.95
                    DCT(r,c)=sampleDCT(r,c);
                end
            end
        end
    end
    image(:,:,i) = idct2(DCT);
end
image=uint8(image);                 
                

end

