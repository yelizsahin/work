% function [info] = hesap(info,prt)
%     info
%     sizes=size(info);
%     sizex=sizes(1); 
%     sizey=sizes(2);
%     fprintf('orta nokta: %f %f \n',prt(1,1),prt(1,2));
%     for i=1:sizex  
%         p(1,1)=info(i,1);
%         p(1,2)=info(i,2);
%         info(i,1)=p(1,1);
%         info(i,2)=p(1,2); 
%         info(i,3)=egim(prt,p );     
%     end
%     info = bubbleSort(info,sizex,sizey);
% end
% 
% function [info] = bubbleSort(info,sizex,sizey)
%     fprintf('burda');
%     sizex
%     sizey
%     for j=1:sizex-1
%         for i=1:sizex-1
%             if info(i,3) > info(i+1,3)
%                temp=info(i,:) ;% sýrala dene
%                info(i,:)=info(i+1,:);
%                info(i+1,:)=temp;
%             end
%         end
%     end
% end