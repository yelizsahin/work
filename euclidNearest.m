%Resimde s�f�r olan noktalar�n birbirine g�re durumlar� bulunur.
%��lemler info array i �zerinden s�rd�r�l�r.
%��nk� s�f�r noktalar�na ait bilgiler info array inde tutulmaktad�r.
function [info, p1,p2] = euclidNearest(info, size)
if info(1,3) == 0
    info(1,3) = 1; 
    info(1,4) = 1; 
end

findzero=false;
for i=1:size
    if info(i,3)==0
        findzero = true;
        break;
    end
end

if findzero == false
    for i=1:size
        if info(i,3)==1
            p1 = [info(i,1),info(i,2)];
            info(i,3)=-1; 
            p2 = [info(1,1),info(1,2)];
            break;
        end
    end
else
    % 1 olan yere en yak�n 0 durumundaki yer buluncak.
    [x,y, index]= euclid(info, size);
    % Bizim bir olan noktam�za en yak�n noktam�z�n koordinatlar�
    for i=1:size
        if info(i,3)==1
            info(i,3)=-1;
            p1 = [info(i,1),info(i,2)];
            p2 = [x,y];
        end
    end
    if index ~= 1
        info(index,3) = 1;
        max = 0;
        for i=1:size
            if max < info (i,4)
                max= info(i,4);
            end
        end
        info(index,4) = max + 1;
    end
end
end
