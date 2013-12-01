%info içinde bölge aramasý yapacaz
function [info, min] = search(info)
sizeInfo = size(info);
if info(1,3) == 0   %ilk baþlangýç
      n =  1;  info(1,4) = 1; info(1,3) = -1;
      
else
    %p1 noktasý seçilmiþ olarak gelcek zaten
    
    
    
end

 found = 0;
 first = 1;
 for i=1:sizeInfo(1)  %Tüm satýrlar boyunca gezilerek
     if info(i,1) < info(n,1) & info(i,2)> info(n,2) %x-leri küçük y-ler büyük olan satýr bulunduðunda 
         if info(i,3) == 0   %Daha önceden bu noktaya gelinmemiþ ise 
             found= 1;                            %istenen bölgede nokta bulundu
             if first == 1                        %Eðer ilk nokta ise
                 first = 0;                       %first 0 yapýlýr
                 p1(1,1)=info(n,1);               %ilk noktanýn koordinatlarý verilir
                 p1(1,2)=info(n,2);
                 p2(1,1)=info(i,1);               %Bulunan noktanýn koordinatlarý verilir
                 p2(1,2)=info(i,2);
                 mindist = euclid(p1,p2);         %Aralarýndaki öklid mesafesi hesaplanýr
                 min =  i;                        %hangi sýrada bulunduðu iþaretlenir
                 info(min,4)=i;
             else
                 p1(1,1)=info(n,1);               %Ayný bölgede birden fazla nokta varsa öklid mesafeleri karþýlaþtýrýlýr ve en kýsa olan alýnýr.
                 p1(1,2)=info(n,2);
                 p2(1,1)=info(i,1);
                 p2(1,2)=info(i,2);
                 if euclid(p1,p2) < mindist 
                     mindist = euclid(p1,p2);
                     min =  i;
                      info(min,4)=i;
                 end
             end
         end
     end
 end
 if found == 0
     for i=1:sizeInfo(1)
         if info(i,1)>= info(n,1) & info(i,2)>= info(n,2)
             if info(i,3) == 0  
                 found= 1; 
                 if first == 1
                     first = 0;
                     p1(1,1)=info(n,1);
                     p1(1,2)=info(n,2);
                     p2(1,1)=info(i,1);
                     p2(1,2)=info(i,2);
                     mindist = euclid(p1,p2);
                     min =  i;
                      info(min,4)=i;
                 else
                     p1(1,1)=info(n,1);
                     p1(1,2)=info(n,2);
                     p2(1,1)=info(i,1);
                     p2(1,2)=info(i,2);
                     if euclid(p1,p2) < mindist 
                         mindist = euclid(p1,p2);
                         min = i;
                          info(min,4)=i;
                     end
                 end
             end
         end
     end
 end
 if found==0
     for i=1:sizeInfo(1)
         if info(i,1)> info(n,1) & info(i,2)< info(n,2)
             if info(i,3) == 0  
                 found= 1; 
                 if first == 1
                     first = 0;
                     p1(1,1)=info(n,1);
                     p1(1,2)=info(n,2);
                     p2(1,1)=info(i,1);
                     p2(1,2)=info(i,2);
                     mindist = euclid(p1,p2);
                     min =  i;
                     info(min,4)=i;
                 else
                     p1(1,1)=info(n,1);
                     p1(1,2)=info(n,2);
                     p2(1,1)=info(i,1);
                     p2(1,2)=info(i,2);
                     if euclid(p1,p2) < mindist 
                         mindist = euclid(p1,p2);
                         min =  i;
                         info(min,4)=i;
                     end
                 end
             end
         end
    end
 end
 if found == 0
     for i=1:sizeInfo(1)
         if info(i,1)<= info(n,1) & info(i,2)<=info(n,2)
             if info(i,3) == 0  
                 found= 1; 
                 if first == 1
                     first = 0;
                     p1(1,1)=info(n,1);
                     p1(1,2)=info(n,2);
                     p2(1,1)=info(i,1);
                     p2(1,2)=info(i,2);
                     mindist = euclid(p1,p2);
                     min =  i;
                     info(min,4)=i;
                 else
                     p1(1,1)=info(n,1);
                     p1(1,2)=info(n,2);
                     p2(1,1)=info(i,1);
                     p2(1,2)=info(i,2);
                     if euclid(p1,p2) < mindist 
                         mindist = euclid(p1,p2);
                         min =  i;
                         info(min,4)=i;
                     end
                 end
             end
         end
     end
 end
 p1
 p2
 info (min, 1)
 info (min, 2)
 mindist
 end
 
 
 
 
