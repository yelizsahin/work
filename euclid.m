%iki nokta arasındaki öklid mesafesini hesaplar.
function dist = euclid(p1,p2)
    dist = sqrt((p1(1,1)-p2(1,1))^2 + (p1(1,2)-p2(1,2))^2);       
end
