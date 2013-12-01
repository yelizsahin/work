%Array satýr satýr taranarak sýfýr olan yerlerin koordinatlarý bulunur.
function info = infoZero(im) 
    count=1;
    sizes=size(im);
    sizex=sizes(1);
    sizey=sizes(2);
    for i=1 : sizex
        for j=1 : sizey
            if im(i,j) == 0
                info(count,1) = i;
                info(count,2) = j;
                info(count,3) = 0;
                info(count,4) = 0;
                count= count + 1; 
            end
        end
    end
end