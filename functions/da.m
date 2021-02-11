function[ti,y]=da(ti,y)
    x=size(ti,4);
    for i=1:x
        im=ti(:,:,:,i);
        k=size(ti,4);
        %applico blur
        ti(:,:,:,k+1)=blur(im);y(k+1)=y(i);
        %applico noise
        [ti(:,:,:,k+2),ti(:,:,:,k+3)]=noise(im);y(k+2)=y(i);y(k+3)=y(i);
        %applico saturation
        ti(:,:,:,k+4)=saturation(im);y(k+4)=y(i);
        %applico contrast
        [ti(:,:,:,k+5),ti(:,:,:,k+6),ti(:,:,:,k+7)]=contrast(im);y(k+5)=y(i);y(k+6)=y(i);y(k+7)=y(i);
        %applico tre varianti sull'utilizzo di dct
        ti(:,:,:,k+8)=method1(im);y(k+8)=y(i);
        ti(:,:,:,k+9)=method2(im);y(k+9)=y(i);
        %cerco i cinque esempi per il terzo metodo
        c=0;
        for j=1:x
            if y(j)==y(i)
                c=c+1;
                samples(:,:,:,c)=ti(:,:,:,i);
            end
            if size(samples,4)==5
                break
            end
        end
        ti(:,:,:,k+10)=method3(im,samples);y(k+10)=y(i);
    end
end