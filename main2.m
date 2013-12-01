% matris oluþturup deðer atama 
% matris ler oluþturuldu
% sizex X sizeY den oluþan 'deðeri olmayan alanlar'
% ve daha sonra rastgele yerleþtirilecek olan 0 larýn yerleri ve
% üzerlerinde yapýlmýþ iþlemlerin bilgisini tutmak için zeroInfo arrayi
% oluþturuldu. 

clear all;
clc;
%DEFINITIONS

sizex = 128;
sizey = 128;
zeroCount = 25;
im = ones(sizex,sizey) *255;

% þimdi elinmizde n tane 0 olan harita var bize 0 olan yerler hakkýnda
% bilgi verilmiþ bizde bu noktalarý kullanarak ara deðer felan
% hesaplayacaz.
 im = randZero(im, sizex, sizey, zeroCount);

% im(30,30)=0;
% im(100,30)=0;
% im(100,100)=0;
% im(30,100)=0;

 
 info  = infoZero(im, sizex, sizey, zeroCount);
% im
% info
for i = 1:zeroCount
  
        [info,p1,p2]=euclidNearest(info,zeroCount);
        [k1(1,1),k1(1,2)]=goBack(im,sizex,sizey,p1(1,1),p1(1,2));
        [k2(1,1),k2(1,2)]=goBack(im,sizex,sizey,p2(1,1),p2(1,2));
        im = cubicInt(im,p1,p2,k1,k2,sizex,sizey);
      %  fprintf('%d baglandi',i);
% im=transpose(im);
% image(im);
% %axis image
% colormap(gray(256))
end
image(im);
%axis image
colormap(gray(256))
