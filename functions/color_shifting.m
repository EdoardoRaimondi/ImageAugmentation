function [img_shiftcolor]=color_shifting(img, shift_red, shift_green, shift_blue)
    img_shiftcolor = img;
    img_shiftcolor(:,:,1)=img_shiftcolor(:,:,1)+shift_red;
    img_shiftcolor(:,:,2)=img_shiftcolor(:,:,2)+shift_green;
    img_shiftcolor(:,:,3)=img_shiftcolor(:,:,3)+shift_blue;
    
end