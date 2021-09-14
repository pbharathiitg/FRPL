function [exr,eyr,gamaxyr,e1,e2,gama12]=ply_mat_xy_strains(n,z,epk_0,THETA,ext,eyt,gamaxyt,exh,eyh,gamaxyh)
    ep_0 = epk_0(1:3);
    k_0 = epk_0(4:6);
    
    ex = zeros(n,3);
    ey = zeros(n,3);
    gamaxy = zeros(n,3);
    
    exr = zeros(n,3);
    eyr = zeros(n,3);
    gamaxyr = zeros(n,3);
   
    e1 = zeros(n,3);
    e2 = zeros(n,3);
    gama12 = zeros(n,3);
    
    for i = 1:n
        ex(i,1) = ep_0(1) -((z(i)*(10^-3)*k_0(1)));
        ey(i,1) = ep_0(2) -((z(i)*(10^-3)*k_0(2)));
        gamaxy(i,1) = ep_0(3) -((z(i)*(10^-3)*k_0(3)));
    end
    for i = 1:n
        ex(i,2) = ep_0(1) -((((z(i+1)+z(i))/2)*(10^-3)*k_0(1)));
        ey(i,2) = ep_0(2) -((((z(i+1)+z(i))/2)*(10^-3)*k_0(2)));
        gamaxy(i,2) = ep_0(3) -((((z(i+1)+z(i))/2)*(10^-3)*k_0(3)));
    end
    for i = 1:n
        ex(i,3) = ep_0(1) -((z(i+1)*(10^-3)*k_0(1)));
        ey(i,3) = ep_0(2) -((z(i+1)*(10^-3)*k_0(2)));
        gamaxy(i,3) = ep_0(3) -((z(i+1)*(10^-3)*k_0(3)));
    end
   
    for  i = 1:n
        exr(i,1) = ex(i,1) - ext(i)- exh(i);
        eyr(i,1)= ey(i,1) - eyt(i)- eyh(i);
        gamaxyr(i,1)= gamaxy(i,1) - gamaxyt(i)-gamaxyh(i);
    end
    for  i = 1:n
        exr(i,2) = ex(i,2) - ext(i)- exh(i);
        eyr(i,2)= ey(i,2) - eyt(i)- eyh(i);
        gamaxyr(i,2)= gamaxy(i,2) - gamaxyt(i)-gamaxyh(i);
    end
    for  i = 1:n
        exr(i,3) = ex(i,3) - ext(i)- exh(i);
        eyr(i,3)= ey(i,3) - eyt(i)- eyh(i);
        gamaxyr(i,3)= gamaxy(i,3) - gamaxyt(i)- gamaxyh(i);
    end

    for i = 1:n
        thet = THETA(i);
        a = cosd(thet);
        b = sind(thet);
        T = [a^2,b^2,(2*a*b);b^2,a^2,(-2*a*b);(-a*b),(a*b),(a^2-b^2)];
        jam1 = T*[exr(i,1);eyr(i,1);(gamaxyr(i,1)/2)];
        jam2 = T*[exr(i,2);eyr(i,2);(gamaxyr(i,2)/2)];
        jam3 = T*[exr(i,3);eyr(i,3);(gamaxyr(i,3)/2)];
        e1(i,1) = jam1(1);
        e2(i,1) = jam1(2);
        gama12(i,1) = 2*jam1(3);
        e1(i,2) = jam2(1);
        e2(i,2) = jam2(2);
        gama12(i,2) = 2*jam2(3);
        e1(i,3) = jam3(1);
        e2(i,3) = jam3(2);
        gama12(i,3) = 2*jam3(3);
    end
   
end