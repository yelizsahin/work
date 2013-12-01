%matris oluþturup deðer atama
sizex = 12;
sizey = 12;
zeroCount = 4
im = ones(sizex,sizey)*255;
zeroInfo = zeros(zeroCount,3)

 for i = 1 : zeroCount
   x = ceil(rand()*sizex);
   y = ceil(rand()*sizey);
    while im(x,y) == 0
     x = ceil(rand()*sizex);
     y = ceil(rand()*sizey);
  %   fprintf('ayni geldi');
    end
 %  fprintf('farklý geldi\n');
   im(x,y) = 0; 
 end
 
%ilk noktayý bulma

first = false;
second=false;

    for i=1 : sizex
        for j=1 : sizey
            if im(i,j)== 0
                if first == false  
                     im(i,j) = 1;
                          ilki=i;
                          ilkj=j;
                      first = true; 
                else
                  fprintf('%d %d -> %d %d -->   %f\n',i , j ,ilki, ilkj, sqrt((i-ilki)^2 + (j-ilkj)^2) ); 
                    if second == false 
                      minDist = sqrt((i-ilki)^2 + (j-ilkj)^2);
                      minPointX= i;
                      minPointY= j;% eðer en yakýn nokta 2. ise 2 diyelim minPointimize.     
                      im(i,j) = 2;  
                      second= true;
                    else                                                                                                            
                         if sqrt((i-ilki)^2 + (j-ilkj)^2) < minDist 
                                  minDist =sqrt((i-ilki)^2 + (j-ilkj)^2);
                                  minPointX= i;
                                  minPointY= j;
                                 im(i,j) = 500; 
                         end % end if
                    end   % end elseif
                end%end elseif
            end%end if
        end%end for
    end%end for
   im(minPointX,minPointY)=-555;        
    findFirstZero(3,5); %%
im