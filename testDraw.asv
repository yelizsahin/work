function im = testDraw(p1,p2,k1,im,sizex,sizey)
        im_copy = im ;
                t1 =  k1(1,2); %x0
                t2 =  p1(1,2); %x1
                t3 =  p2(1,2); %x2
           
                f_t1 =  k1(1,1); % f(x0)
                f_t2 =  p1(1,1); % f(x1)
                f_t3 =  p2(1,1); % f(x2)
              
                f_t1_t2 = (f_t2 - f_t1) / (t2 - t1); % t2 ve t1 hiçbir zaman eþit olmamalý p1.x != k1.x
                f_t2_t3 = (f_t3 - f_t2) / (t3 - t2); %t3 ve t2 hiçbir zaman eþit olmamalý p1.x != p2.x
                f_t1_t2_t3 = (f_t2_t3 - f_t1_t2) / (t3 - t1); %t3 ve t1 hiçbir zaman eþit olmamalý p2.x != k1.x

                count = 1;

back = p1;



          for t=t2:t3 
              y = int32(f_t1 +f_t1_t2 * (t - t1) + f_t1_t2_t3 * (t - t1) * (t - t2));
              if y < sizey & y > 0
                if  y == p2(1,1) & t==p2(1,2)
                    break;
                end
                 
                  im_copy (y,t) =  0 ;% mavi çizer
                     if( testborder(im_copy ,y,t,sizex,sizey)== 0 & count>1)      
       


             
                    t1 =   back(1,2)+1; %x0
                    t2 =  back(1,2) ; %x1
                    t3 =  p2(1,1); %x2

                    f_t1 =  back(1,1)+1  ; % f(x0)

                    f_t2 =  back (1,1); % f(x1)
                    f_t3 =  p2(1,2); % f(x2)


              if t1==t2
                    continue;
              end
                f_t1_t2 = (f_t2 - f_t1) / (t2 - t1); % t2 ve t1 hiçbir zaman eþit olmamalý p1.x != k1.x
                f_t2_t3 = (f_t3 - f_t2) / (t3 - t2); %t3 ve t2 hiçbir zaman eþit olmamalý p1.x != p2.x
                f_t1_t2_t3 = (f_t2_t3 - f_t1_t2) / (t3 - t1); %t3 ve t1 hiçbir zaman eþit olmamalý p2.x != k1.x

                count = 1; 
                                    for t=t2+1:t3 
                                      y = int32(f_t1 +f_t1_t2 * (t - t1) + f_t1_t2_t3 * (t - t1) * (t - t2));
                                      if y < sizey & y > 0
                                        %if  y == p2(1,1) & t==p2(1,2)
                                          %  break;
                                        %end
                                          im_copy (t,y) =  0 ;% mavi çizer
                                             if( testborder(im_copy ,t,y,sizex,sizey)== 0 & count>1)      

                                                % break;
                                               end
                                            im = im_copy ;
                                            figure(count);
                                            image(im);
                                            axis image
                                          count =  count+1;
                                      end
                                  end
                         break;
                     end
                    back = [t,y];
                    im = im_copy ;
                    figure(count);
                    image(im);
                    axis image
                  count =  count+1;
              end
          end
end


% function im = direction(a,b)
% direction = -1;
% if (a > i && b < j) direction = 1;
% else if (a < i && b < j) direction = 7;
% else if (a < i && b > j) direction = 5;
% else if (a > i && b > j) direction = 3;
% else if (a == i && b < j) direction = 0;
% else if (a == i && b > j) direction = 4;
% else if (a > i && b == j) direction = 2;
% else if (a < i && b == j) direction = 6;
%     end
% end

function result=testborder(im,y,t,sizex,sizey)

p7=im(y,t-1);
p1=im(y-1,t);
p2=im(y-1,t+1);
p3=im(y,t+1);
p4=im(y+1,t+1);
p5=im(y+1,t);

p8=im(y-1,t-1);


p6=im(y+1,t-1);


p=im(y,t);
fprintf('%d - %d - %d - %d - %d - %d - %d - %d - %d\n',p,p1,p2,p3,p4,p5,p6,p7,p8);
    result=0;
    if (p8==0 & p7==255 & p6==255 & p5==255 & p4==255 & p3==255 & p2==255 & p1==255 & p==0)
    result=1;
   
    elseif (p8==255 & p7==0 & p6==255 & p5==255 & p4==255 & p3==255 & p2==255 & p1==255 & p==0)
    result=1;

    elseif (p8==255 & p7==255 & p6==0 & p5==255 & p4==255 & p3==255 & p2==255 & p1==255 & p==0)
    result=1;

    elseif (p8==255 & p7==255 & p6==255 & p5==0 & p4==255 & p3==255 & p2==255 & p1==255 & p==0)
    result=1;

    elseif (p8==255 & p7==255 & p6==255 & p5==255 & p4==0 & p3==255 & p2==255 & p1==255 & p==0)
    result=1;

    elseif (p8==255 & p7==255 & p6==255 & p5==255 & p4==255 & p3==0 & p2==255 & p1==255 & p==0)
    result=1;

    elseif (p8==255 & p7==255 & p6==0 & p5==255 & p4==255 & p3==255 & p2==0 & p1==255 & p==0)
    result=1;

    elseif (p8==255 & p7==255 & p6==0 & p5==255 & p4==255 & p3==255 & p2==255 & p1==0 & p==0)
    result=1;

    end
end