%Verilen matrix de rastgele se�ilen yerlere verilen say�da 0 yerle�tirir.
function  im = randZero(im, sizex, sizey, zeroCount,backCount)
for i = 1 : zeroCount
    x = ceil(rand()*(sizex-2*backCount))+ backCount;
    y = ceil(rand()*(sizey-2*backCount))+ backCount;
    while im(x,y) == 0
        x = ceil(rand()*(sizex-2*backCount))+ backCount;
        y = ceil(rand()*(sizey-2*backCount))+ backCount;
        %fprintf('ayni geldi');
    end
    %fprintf('farkl� geldi\n');
    im(x,y) = 0; 
end
end