%10 piksel geriye gidilecek;
function [pastx,pasty] = goBack(arr, x ,y, backSize) 
sizes = size(arr);
sizex = sizes(1);
sizey = sizes(2);
 
back  = 0; % �imdi x y noktas�nday�z ve geri gitmemiz laz�m.
count = 0;
defaultx = x;
defaulty = y;

%�imdi burda x ,y nin kom�usunu bul point x point y �eklinde a�k�m o
%fonksiyon yok var.ama �yle �ok uzun olmad� m� neyse.olmad� kom�u bulcan
%a�a��daki iflerin ayn�s�.




pastx=x;
pasty=y;
figureCount = 1400;

while back < backSize % test edek:)
 if pastx - 1 < 1 | pasty-1 < 1 |pastx >= sizex | pasty >= sizey % yaa geriye ne g�zel gidio o .noldu ki?�ok ho�uma gitti.:)
        break
    end


    [pointx, pointy ] = connectedPoint( arr ,pastx,pasty); 

   % figure( figureCount ),imshow(arr)
    
    arr(pastx,pasty) = 1;  
    if   pointx== 0 & pointy == 0
        return
    end
    pastx = pointx;
    pasty = pointy;
    back = back +1 ;

end

 

return;
while back < 10 % �imdi goback e biraz �eki d�zen veriyorum.ok
    if x-1 < 1 | y-1 < 1 |x >= sizex | y >= sizey % Resim d���na ta�ma varsa d�ng�den ��kar
        break
    end
    if arr(x - 1, y - 1) == 0
        arr(x - 1, y - 1) = 1;
        %fprintf(' ->  %d -> ', 1 );
        %arr(x, y ) = 1;
        x = x - 1;
        y = y - 1;
    
    elseif arr(x , y - 1) == 0 
        arr(x , y - 1) = 1;
        %fprintf(' ->  %d -> ', 2 );
        %arr(x, y ) = 1;
        y = y - 1;
    
    elseif arr(x+1 , y - 1) == 0 
        arr(x+1 , y - 1) = 1;
        %fprintf(' ->  %d -> ', 3 );
        %arr(x, y ) = 1;
        y = y - 1;
        x=x+1;
    
    elseif arr(x-1 , y ) == 0 
        arr(x-1 , y ) = 1;
        %fprintf(' ->  %d -> ', 4 );
        %arr(x, y ) = 1;
        x = x - 1;
        
    elseif arr(x , y ) == 0 
        arr(x , y ) = 1;
        %fprintf(' ->  %d -> ', 4 );
    
    elseif arr(x+1 , y ) == 0 
        arr(x+1 , y ) = 1;
        %fprintf(' ->  %d -> ', 5 );
        %arr(x, y ) = 1;
        x = x + 1;
    
    elseif arr(x - 1, y + 1) == 0
        arr(x - 1, y + 1) = 1;
        %fprintf(' ->  %d -> ', 6 );
        %arr(x, y ) = 1;
        x = x - 1;
        y = y + 1;
    
    elseif arr(x , y +1) == 0 
        arr(x , y + 1) = 1;
        %fprintf(' ->  %d -> ', 7 );
        %arr(x, y ) = 1;
        y = y + 1;
    
    elseif arr(x + 1, y + 1) == 0 
        arr(x + 1, y + 1) = 1;
        %fprintf(' ->  %d -> ', 8 );
        %arr(x, y ) = 1;
        x = x + 1;
        y = y + 1;
    end
    back = back + 1;
end 

%fprintf('%d  %d  %d  %d\n', x , y ,defaultx, defaulty);
%fprintf(' sonn\n ');
end
 
 
function [pointx, pointy] = connectedPoint ( arr, t ,y )  %yaaa eskisi nde daha yiyi �iziodu..sen bi ��zde �u ters d�nmesini
             pointx = 0;
             pointy=0; 
        if t==0 | y==0
            t
            y
        return
        end
    if   arr( t-1 ,y-1) == 0 
        pointx = t-1;
        pointy = y-1;
    end
    if arr( t ,y-1) == 0
        pointx=t;
        pointy=y-1;
    end
    if arr( t+1 ,y-1) == 0
            pointx=t+1; %ilk �izeni ar�oz demi...hay�r yanl�� �izenleri tmm ilk de var
            pointy=y-1;
    end
    if arr( t+1 ,y) == 0
        pointx=t+1;
        pointy=y;
    end
    if arr( t+1 ,y+1) == 0
        pointx=t+1;
        pointy=y+1;
    end
    if  arr( t ,y+1) == 0
        pointx=t;
        pointy=y+1;
    end
    if arr( t-1 ,y+1) == 0 
        pointx=t-1;
        pointy=y+1;
    end
    if arr( t-1 ,y) == 0
     pointx = t-1;
     pointy = y;
    end
    
end

