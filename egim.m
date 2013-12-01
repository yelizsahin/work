% function result = egim( p1,p2)
%     m =(p2(1,2)-p1(1,2))/(p2(1,1)-p1(1,1));
%     result =180 * egim2(m)/ pi ;
%    
%     if p2(1,1) > p1(1,1) 
%         result = mod(result,360)  ;
%     else  
%         result = mod((result+180),360) ;    
%     end 
% end
% 
% function result = egim2( m )   
%     result = atan(m);
% end
% 
% 






