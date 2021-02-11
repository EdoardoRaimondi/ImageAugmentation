function[image]=blur(im)
[y,x,z]=size(im);
%creo filtro blur
B=zeros(5,5);
f=.1;
nor=0;
for i=1:5
    for j=1:5
        B(i,j)=exp(-(i^2+j^2)/2*f^2)/2*pi*f^2;
        nor=nor+B(i,j);
    end
end
%normalizzazione del filtro
B=B/nor;
%creo immagine con bordi
temp=zeros(y+4,x+4,z);
temp(3:end-2,3:end-2,:)=im;
%applico filtro blur ad immagine con bordi
image=zeros(y,x,z);
c=0;
for d=1:z
    for h=3:y+2
        for w=3:x+2
            for i=-2:2
                for j=-2:2
                    c=c+temp(h+i,w+i,d)*B(i+3,j+3);
                end
            end
            image(h-2,w-2,d)=c;
            c=0;
        end
    end
end
%converto in formato immagine
image=uint8(image);
end