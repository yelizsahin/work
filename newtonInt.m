%iki noktay� ba�lamak i�in kullan�lan method
function arr = newtonInt( arr,p1,p2,k1,sizex,sizey )
drawtest = 2;
drawall = true;
% �imd normal �izimi test edek.


test = 0; %ee hangisi bea hi�biri :))
all = true;
if  abs(p2(1,2)-p1(1,2)) > abs(p1(1,1)-p2(1,1))
    %fprintf('yler fark� b�y�k');
    if  k1(1,1)== p1(1,1)
        k1(1,1)= k1(1,1)+1;
    end
    if  p1(1,1)== p2(1,1)
        p1(1,1)= p1(1,1)+1;
    end
    if  k1(1,2)== p1(1,2)
        k1(1,2)= k1(1,2)+1;
    end
    if  p1(1,2)== p2(1,2)
        p1(1,2)= p1(1,2)+1;
    end
 

    t1 =  k1(1,2);
    t2 =  p1(1,2); 
    t3 =  p2(1,2); 
    
    f_t1 =  k1(1,1); 
    f_t2 =  p1(1,1); 
    f_t3 =  p2(1,1); 
    
    f_t1_t2 = (f_t2 - f_t1) / (t2 - t1); % t2 ve t1 hi�bir zaman e�it olmamal� p1.x != k1.x
    f_t2_t3 = (f_t3 - f_t2) / (t3 - t2); %t3 ve t2 hi�bir zaman e�it olmamal� p1.x != p2.x
    f_t1_t2_t3 = (f_t2_t3 - f_t1_t2) / (t3 - t1); %t3 ve t1 hi�bir zaman e�it olmamal� p2.x != k1.x
    
    if  t2 > t3
        count=0; 
        pastx = 0;
        pasty = 0;
        
        t1 =  k1(1,2); %x0
        t2 =  p1(1,2); %x1
        t3 =  p2(1,2); %x2
        
        f_t1 =  k1(1,1); % f(x0)
        f_t2 =  p1(1,1); % f(x1)
        f_t3 =  p2(1,1); % f(x2)
               
        f_t3_t2 = (f_t3 - f_t2) / (t3 - t2); % t2 ve t1 hi�bir zaman e�it olmamal� p1.x != k1.x
        f_t2_t1 = (f_t2 - f_t1) / (t2 - t1); %t3 ve t2 hi�bir zaman e�it olmamal� p1.x != p2.x
        f_t3_t2_t1 = (f_t3_t2 - f_t2_t1) / (t3 - t1); %t3 ve t1 hi�bir zaman e�it olmamal� p2.x != k1.x
        
        connected = true;
        for t=t3:t2
            y = int32(f_t3 +f_t3_t2 * (t - t3) + f_t3_t2_t1 * (t - t3) * (t - t2));
            if y < sizey & y > 0
                
                if drawall==true | drawtest==1
                       arr(y,t) = 0;  % ilk hata nedeni
                       connected = connectedCheck(arr ,y , t);
                       if connected ~= true  & ~(y== p1(1,1) & t == p1(1,2) |  y == p2(1,1) & t == p2(1,2))
                           [pointx, pointy] = connectedPoint(arr ,pastx , pasty  );

                       innerk1(1,1) = pointx;
                       innerk1(1,2) = pointy;
                       innerp1(1,1)= pastx;
                       innerp1(1,2)=pasty;
                       innerp2(1,1) = y;
                       innerp2(1,2) = t;
                        if test == 1 | all == true
                            1
                            innerk1 
                           innerp1
                           innerp2
                           if ~(pointx == 0 & pointy == 0) %yukar�lara ekle ayn� �ey ama olsun.
                                 arr=newtonInt(arr,innerp1,innerp2,innerk1,sizex,sizey); % �imdi ilk sorunlar� ��zen k�sm� bul burdakileri
                                % bura m�?evet de�il gibi
                           end

                        end % bunu da ekle baride daha iyi test edek.yaa azc�k kar���k geldi nereye 
                  % nas�l? �imdilik?daha iyi ama karar noktas� s�k�nt�s�ndan dolay�
                  % b�yle tek bo�luk kald� sadece ayr�ca da??ne?
                       end
                end
               pastx = y;
               pasty = t; 
               count =  count+1;
            end
        end
    else
        count = 0;
        pastx = 0;
        pasty = 0;
        connected = true;
        for t=t2:t3 
            y = int32(f_t1 +f_t1_t2 * (t - t1) + f_t1_t2_t3 * (t - t1) * (t - t2)  );
            if y < sizey & y >0
                  if drawall==true | drawtest==2
                arr(y,t) = 0 ;
                connected = connectedCheck(arr ,y , t );
                if connected ~= true &  ~(y == p1(1,1) & (t == p1(1,2)) |  y == p2(1,1) & ( t == p2(1,2)))
                    [pointx, pointy] = connectedPoint(arr ,pastx , pasty  );
                 
                    
                     
               innerk1(1,1) = pointx;
               innerk1(1,2) = pointy;
               innerp1(1,1)= pastx;
               innerp1(1,2)=pasty;
               innerp2(1,1) = y;
               innerp2(1,2) = t;
                if test == 2 | all == true
                    2
                     innerk1 
                   innerp1
                   innerp2
                   if ~(pointx == 0 & pointy == 0) %yukar�lara ekle ayn� �ey ama olsun.
                         arr=newtonInt(arr,innerp1,innerp2,innerk1,sizex,sizey);
                   end
               
                end
                end% d�zelt
                  end
                pastx = y;
                pasty = t; 
                count = count+1;
            end
        end
    end
    
else
%fprintf('xler fark� b�y�k');
if k1(1,1) == p1(1,1)
    k1(1,1) = k1(1,1)+1;
end
if p1(1,1) == p2(1,1)
    p1(1,1) = p1(1,1)+1;
end
if k1(1,2) == p1(1,2)
    k1(1,2) = k1(1,2)+1;
end
if p1(1,2)== p2(1,2)
    p1(1,2) = p1(1,2)+1;
end

t1 =  k1(1,1); %x0
t2 =  p1(1,1); %x1
t3 =  p2(1,1); %x2

f_t1 =  k1(1,2); % f(x0)
f_t2 =  p1(1,2); % f(x1)
f_t3 =  p2(1,2); % f(x2)

f_t1_t2 = (f_t2 - f_t1) / (t2 - t1); % t2 ve t1 hi�bir zaman e�it olmamal� p1.x != k1.x
f_t2_t3 = (f_t3 - f_t2) / (t3 - t2); %t3 ve t2 hi�bir zaman e�it olmamal� p1.x != p2.x
f_t1_t2_t3 = (f_t2_t3 - f_t1_t2) / (t3 - t1); %t3 ve t1 hi�bir zaman e�it olmamal� p2.x != k1.x

if  t2 > t3
  
    t1 =  k1(1,1); %x0
    t2 =  p1(1,1); %x1
    t3 =  p2(1,1); %x2
    
    f_t3_t2 = (f_t3 - f_t2) / (t3 - t2); % t2 ve t1 hi�bir zaman e�it olmamal� p1.x != k1.x
    f_t2_t1 = (f_t2 - f_t1) / (t2 - t1); %t3 ve t2 hi�bir zaman e�it olmamal� p1.x != p2.x
    f_t3_t2_t1 = (f_t3_t2 - f_t2_t1) / (t3 - t1); %t3 ve t1 hi�bir zaman e�it olmamal� p2.x != k1.x
    
    count=0; 
    pastx = 0;
    pasty = 0;
    
    for t=t3:t2
        y = int32(f_t3 + f_t3_t2 * (t - t3) + f_t3_t2_t1 * (t - t3) * (t - t2)); % demekki bu yanl��.nas�l d�zeltcez.backward newton a bak tekrar netten.
        if y < sizex & y>0
              if drawall==true | drawtest==3
            arr(t,y) = 0; % ikinci hata nedeni
            connected = connectedCheck(arr ,t , y );
            
            if connected ~= true & ~(t == p1(1,1) & y == p1(1,2) |  t == p2(1,1) & y == p2(1,2))
                [pointx, pointy]= connectedPoint(arr ,pastx , pasty  ) ;
                  pointx
                    pointy
               innerk1(1,1) = pointx;
               innerk1(1,2) = pointy;
               innerp1(1,1)= pastx;
               innerp1(1,2)= pasty;
               innerp2(1,1) = t;
               innerp2(1,2) = y;
                if test == 3 | all == true
                   
                    3
                     innerk1 
                    innerp1
                  innerp2                         %a�k�m biz yar�n ka�ta bulu�caz 12.3 iyi mi..evet iyi san�r�m ama �imdi �ok yoruldum art�k ben.tmm burda b�rakal�m zaten benm de yar�n i�in ha.z.�.rlanmam laz�m..h�mm. buarada kodda onlar yanl�� �iziyor onlarda ��z�l�rse ilk k�s�m gibi �izerler biraz d���nmek laz�m hmm sence �ok i�i var m� a�k�m. yok bence ama i�te.�ar�amba 2 tane i� i�e �ember g�t�rmem laz�m okula:) ka��da �iz g�t�r sende ooooooo komik.yapar�z o zamana kadar belki dur bakal�m. en az�ndan i� i�e k�sm�n� hallederiz.ok a�k�m sen �yle dedikten sonra ben sana g�veniyorum ki yar�n ne giycem bilion mu.hauy�r.tmm yarn g�r�rs�n .had bakal�m.sen napcan �imdi.az dinleniyim ya ka� g�nd�r hayat�m�n en yo�un g
                 %%g�nleriydi.tamam can�m belki sen de yar�n benm i�in
                 %%s�slenirsin.ya yorgunum �uan. aman tamam yaa hadi dinlen
                 %%iyi geceler.sa�ol can�m sana da kpss ya bakcam az
                    if ~(pointx == 0 & pointy == 0) %yukar�lara ekle ayn� �ey ama olsun.
                    arr=newtonInt(arr,innerp1,innerp2,innerk1,sizex,sizey);
                   end
                end
            end
            end % yazd�r bi pointx ve y yi

            count = count +1;
            pastx = t;
            pasty = y; 
        end
    end
    
else
    count = 0;
    pastx = 0;
    pasty = 0; % �u past x pasty yap�s�n� di�erlerine de yap aim ya bi k
    for t=t2:t3
        y = int32(f_t1 +f_t1_t2 * (t - t1) + f_t1_t2_t3 * (t - t1) * (t - t2));
        if y < sizex & y>0
              if drawall==true | drawtest==4
           arr(t,y) = 0;
            connected = connectedCheck(arr ,t , y ); 
             
            if connected ~= true & ~(t == p1(1,1) & y == p1(1,2) |  t == p2(1,1) & y == p2(1,2))
                  [pointx, pointy] = connectedPoint(arr ,pastx , pasty );
                  
                    pointx
                    pointy
               innerk1(1,1) = pointx;
               innerk1(1,2) = pointy;
               innerp1(1,1)= pastx;
               innerp1(1,2)=pasty;
               innerp2(1,1) = t;
               innerp2(1,2) = y;
                %  di�erlerine de yap ayn�s�n� return den �nce ama t ve y
                if test == 4 | all ==true
                   4
                  innerk1 
                   innerp1 
                   innerp2
                    if ~(pointx == 0 & pointy == 0) %yukar�lara ekle ayn� �ey ama olsun.
                        arr=newtonInt(arr,innerp1,innerp2,innerk1,sizex,sizey);
                   end
                  
                end
                  
            end
              end
            pastx = t;
            pasty = y;  
            count = count +1;
        end
    end
end
end
end

function check = connectedCheck ( arr, t ,y )
    check = false;
    if   arr( t-1 ,y-1) == 0 | arr( t ,y-1) == 0 | arr( t+1 ,y-1) == 0 | arr( t+1 ,y) == 0 | arr( t+1 ,y+1) == 0 | arr( t ,y+1) == 0 | arr( t-1 ,y+1) == 0 |arr( t-1 ,y) == 0
        check = true ;   
    end
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










