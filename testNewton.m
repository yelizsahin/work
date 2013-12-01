function testNewton( )
     sizex = 250;
     sizey = 250;
        im = ones(sizex,sizey) * 255;
    % image colors 
    im(5,4)=0; 
    im(5,6)=10;
    im(5,8)=20;
    im(5,10)=30;
    im(5,12)=40;
    im(5,14)=30;
    im(5,16)=50;
    im(5,18)=60;

    % p2.x > p1.x
    % yukardan aþaðýya olcak þekilde çizgi çizer
     k1 = [10,10];
     p1 = [20,10];
     p2 = [50,10];
     k2 = [60,10];

     im = newtonInt(im,p1,p2,k1,sizex,sizey);
     im(k1(1,1),k1(1,2)) = 60;  im(p1(1,1),p1(1,2)) = 40;   im(p2(1,1),p2(1,2)) = 40; % im(k2(1,1),k2(1,2))=  60 ;

     %p2.y > p2.y
     %soldan saða olcak þekilde çizgi çizer
     k1 = [25,50];
     p1 = [25,60];
     p2 = [25,90];
     k2 = [25,100];

     im = newtonInt(im,p1,p2,k1,sizex,sizey);
     im(k1(1,1),k1(1,2)) = 60;  im(p1(1,1),p1(1,2)) = 40;   im(p2(1,1),p2(1,2)) = 40; %im(k2(1,1),k2(1,2))=  60 ;



    % p1.x > p2.x
    % aþaðýdan yukarýya çizgi çizer
     k1 = [60,150];
     p1 = [50,150];
     p2 = [20,150];
     k2 = [10,150];

     im = newtonInt(im,p1,p2,k1,sizex,sizey);
     im(k1(1,1),k1(1,2)) = 60;  im(p1(1,1),p1(1,2)) = 40;   im(p2(1,1),p2(1,2)) = 40; %im(k2(1,1),k2(1,2))=  60 ;

     %p1.y > p2.y
     % saðdan sola çizgi çizer
     k1 = [25,240];
     p1 = [25,230];
     p2 = [25,200];
     k2 = [25,190];

     im = newtonInt(im,p1,p2,k1,sizex,sizey);
     im(k1(1,1),k1(1,2)) = 60;  im(p1(1,1),p1(1,2)) = 40;   im(p2(1,1),p2(1,2)) = 40; %im(k2(1,1),k2(1,2))=  60 ;

    % düz çizgi tamam
    % k1.x < p1.x < p2.x < k2.x
    % k1.y < p1.y = p2.y < k2.y  
    % yukarýdan aþaðýya doðru karar noktalarýna göre eðri çizer 
     k1 = [75,5];
     p1 = [80,20];
     p2 = [120,20];
     k2 = [125,35];

     im = newtonInt(im,p1,p2,k1,sizex,sizey);
     im(k1(1,1),k1(1,2)) = 60;  im(p1(1,1),p1(1,2)) = 40;   im(p2(1,1),p2(1,2)) = 40;% im(k2(1,1),k2(1,2))=  60 ;

    % k1.x < p1.x = p2.x < k2.x
    % k1.y < p1.y < p2.y < k2.y 
    % soldan saða doðru karar noktalarýna göre eðri çizer 
     k1 = [60,50];
     p1 = [90,55];
     p2 = [90,95];
     k2 = [120,100];

     im = newtonInt(im,p1,p2,k1,sizex,sizey);
     im(k1(1,1),k1(1,2)) = 60;  im(p1(1,1),p1(1,2)) = 40;   im(p2(1,1),p2(1,2)) = 40; %im(k2(1,1),k2(1,2))=  60 ;





    % k1.x > p1.x > p2.x > k2.x
    % k1.y > p1.y = p2.y > k2.y 
    % aþaðýdan yukarýya doðru karar noktalarýna göre eðri çizer  
     k1 = [125,165];
     p1 = [120,150];
     p2 = [80,150];
     k2 = [75,135];

     im = newtonInt(im,p1,p2,k1,sizex,sizey);
     im(k1(1,1),k1(1,2)) = 60;  im(p1(1,1),p1(1,2)) = 40;   im(p2(1,1),p2(1,2)) = 40; %im(k2(1,1),k2(1,2))=  60 ;


    % k1.x > p1.x = p2.x > k2.x
    % k1.y > p1.y > p2.y > k2.y 
    % saðdan sola doðru karar noktalarýna göre eðri çizer 
     k1 = [120,240];
     p1 = [90,235];
     p2 = [90,195];
     k2 = [60,190];

     im = newtonInt(im,p1,p2,k1,sizex,sizey);
     im(k1(1,1),k1(1,2)) = 60;  im(p1(1,1),p1(1,2)) = 40;   im(p2(1,1),p2(1,2)) = 40; %im(k2(1,1),k2(1,2))=  60 ;



     % k1.x < p1.x < p2.x < k2.x
     % k1.y > p1.y = p2.y > k2.y 
      % yukarýdan aþaðýya doðru karar noktalarýna göre eðri çizer 
     k1 = [165,35];
     p1 = [170,20];
     p2 = [210,20];
     k2 = [215,5];

     im = newtonInt(im,p1,p2,k1,sizex,sizey);
     im(k1(1,1),k1(1,2)) = 60;  im(p1(1,1),p1(1,2)) = 40;   im(p2(1,1),p2(1,2)) = 40; %im(k2(1,1),k2(1,2))=  60 ;

    % k1.x > p1.x = p2.x > k2.x
    % k1.y < p1.y < p2.y < k2.y 
    % soldan saða doðru karar noktalarýna göre eðri çizer 
     k1 = [210,50];
     p1 = [180,55];
     p2 = [180,95];
     k2 = [150,100];

     im = newtonInt(im,p1,p2,k1,sizex,sizey);
     im(k1(1,1),k1(1,2)) = 60;  im(p1(1,1),p1(1,2)) = 40;   im(p2(1,1),p2(1,2)) = 40; %im(k2(1,1),k2(1,2))=  60 ;


     % k1.x > p1.x > p2.x > k2.x
     % k1.y < p1.y = p2.y < k2.y 
     % aþaðýdan yukarýya doðru karar noktalarýna göre eðri çizer 
     k1 = [215,145]; 
     p1 = [210,160];
     p2 = [170,160]; 
     k2 = [165,175]; 

     im = newtonInt(im,p1,p2,k1,sizex,sizey);
     im(k1(1,1),k1(1,2)) = 60;  im(p1(1,1),p1(1,2)) = 40;   im(p2(1,1),p2(1,2)) = 40; %im(k2(1,1),k2(1,2))=  60 ;

    % k1.x < p1.x = p2.x < k2.x
    % k1.y > p1.y > p2.y > k2.y
    % saðdan sola doðru karar noktalarýna göre eðri çizer  
     k1 = [150,240];
     p1 = [180,235]; 
     p2 = [180,195]; 
     k2 = [210,190]; 

     im = newtonInt(im,p1,p2,k1,sizex,sizey);
     im(k1(1,1),k1(1,2)) = 60;  im(p1(1,1),p1(1,2)) = 40;   im(p2(1,1),p2(1,2)) = 40; %im(k2(1,1),k2(1,2))=  60 ;


     % eðriler tamam

    figure(1);
    image(im);
    
    axis image
    
end
