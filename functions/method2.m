function[im_dct] = method2(im)
[y,x,z]=size(im);

%eseguo deviazione standard per ciascuno dei 3 livelli 
sigma2 = std(double(im));
sigma1 = std(sigma2);
sigma = std(sigma1)/2;

for channel=1:z
    %proiezione
    DCTim = dct2(im(:,:,channel));
    for riga = 1:y
        for colonna = 1:x
            %DTC(1,1) non può essere modificato
            if riga==1 && colonna==1
                %non eseguo nulla
            else
            %calcolo un numero_z random nell'intervallo (-0.5,0.5)
            random_z = rand();
            while random_z > 1/2
                random_z = rand();
            end
            prob = rand();
            if prob > 1/2
                random_z = random_z * 1;
            else
                random_z = random_z * -1;
            end
            %perturbo DTC
            DCTim(riga, colonna)= DCTim(riga, colonna) + sigma*random_z;
            end
        end
     end
    %retroproiezione
    im_dct(:,:,channel) = idct2(DCTim);
end
    im_dct = uint8(im_dct);
end
