clear all;
clc;

im=imread('test.bmp');
figure,imshow(im);
sizes=size(im);
sizex=sizes(1);
sizey=sizes(2);
backCount= 10;
% ilk karar noktas� ? bi�ey se�medik �zel olarak . ne versin ilk olarak
% �izerken. 4 birim eksik alal�m yine
%DEFINITIONS
% sizex =512;
% sizey =  512;
% zeroCount = 4;   
% backCount= 10;    
% im = ones(sizex,sizey) *1;
% im = randZero(im, sizex, sizey, zeroCount, backCount); 

%[info,min] = search(info);
ilknokta = 1;

info  = infoZero(im);
info
%info daki ilk elemanlar al�n�r 
firstX=info(1,1);
firstY=info(1,2);
firstPoint(1,1)=firstX;
firstPoint(1,2)=firstY;

info=average(info); 
 
sizeinfo=size(info);
zeroCount=sizeinfo(1);

for i=1:zeroCount-1
        if info(i,1)== firstPoint(1,1) & info(i,2)== firstPoint(1,2) 
           first = i;
        end
end
figure(1000),imshow(im)
for k = 0 : zeroCount-1
 
     if zeroCount - first+1 < 1
         zeroCount= zeroCount+zeroCount;
     end
     result1 = zeroCount-first+1 ;

     if result1-1 < 1
         result2 = zeroCount;
     else
         result2 = result1-1;
     end

      first = first+1;
 
        p1(1,1)=info(result1,1);
        p1(1,2)=info(result1,2);
        p2(1,1)=info(result2,1);
        p2(1,2)=info(result2,2);
        k1(1,1)=(p1(1,1)+p2(1,1))/2 ;
        k1(1,2)=(p1(1,2)+p2(1,2))/2 ;  
        k1
        p1
        p2
        if ilknokta == 1
                 k1(1,1)=p1(1,1)-10 ;
                 k1(1,2)= p1(1,2)-10; 
                 ilknokta = 2;
        else 
            %goback i �a��r.
                % goback sonucu a�er k1 p1 ve p2 aras�nda ise k1 in p1 e
                % g�re simetri�ini almal�y�z. ama bi d���n�y�m bi saniye.
            [k1(1,1),k1(1,2) ] =  goBack ( im , p1(1,1) ,p1(1,2));
            
         if p1(1,1) <= p2 (1,1)  %  p1.x   ---~~  p2.x  s�ras�nda
              if (k1(1,1) <= p2(1,1) &  k1(1,1)>= p1(1,1))  %  p1---~~k1      k1---~~p2     p1---k1---~~p2 s�ras�nda
                    k1(1,1) = (2 * p1(1,1) - k1(1,1));   
                    k1(1,2) = (2 * p1(1,2) - k1(1,2));  
                    
                 
                    
                    
                    im(k1(1,1),k1( 1,2)) = 0;
                    figure(5001),imshow(im) % i�imiz bununlaym��
                    return;
              end
         
          else  %  p2.x   ---  p1.x  s�ras�nda
              if (k1(1,1) >= p2(1,1) &  k1(1,1)<= p1(1,1))  %  p2---~~k1     k1---~~p1     p2---k1---p1 s�ras�nda
                    k1(1,1) = (2 * p1(1,1) - k1(1,1));  %%%% bu arada sonu�ta hi� bir de�i�iklikte olmaya bilir.:) ama bi bakal�m.denemekten zarar gelmez
                    k1(1,2) = (2 * p1(1,2) - k1(1,2)); %bak dene.
                      im(k1(1,1),k1(1,2)) = 0;
                   % figure(5002),imshow(im)
                    return;
              end
         end  

         if p1(1,2) <= p2 (1,2)  %  p1.x   ---~~  p2.x  s�ras�nda
                 if (k1(1,2) <= p2(1,2) &  k1(1,2)>= p1(1,2))  %  p1---~~k1      k1---~~p2     p1---k1---~~p2 s�ras�nda
                    k1(1,1) = (2 * p1(1,1) - k1(1,1));   
                    k1(1,2) = (2 * p1(1,2) - k1(1,2)); 
                      im(k1(1,1),k1(1,2)) = 0;
                    %figure(5003),imshow(im)
                    return;
                 end
             % bide buna bak:)
         else  %  p2.x   ---  p1.x  s�ras�nda
               if (k1(1,2) >= p2(1,2) &  k1(1,2)<= p1(1,2))  %  p2---~~k1     k1---~~p1     p2---k1---p1 s�ras�nda
                    k1(1,1) = (2 * p1(1,1) - k1(1,1));  %%%% bu arada sonu�ta hi� bir de�i�iklikte olmaya bilir.:) ama bi bakal�m.denemekten zarar gelmez
                    k1(1,2) = (2 * p1(1,2) - k1(1,2)); %bak dene.
                      im(k1(1,1),k1(1,2)) = 0;
                   % figure(5004),imshow(im)
                    return;
               end
         end 
        end
        im=newtonInt(im,p1,p2,k1,sizex,sizey); % bu s�ra do�ru mu?sanki.bana niye yanl�� geldi karar noktas� ilk de�i�ken de�il miydi?hangisi a�k�m anlamad�m
       
    figure(k+1),imshow(im)
end


 

