function [stx,sty,stxy,st1,st2,st12] =ply_mat_xy_stress(n,exr,eyr,gamaxyr,THETA,E1,E2,MU12,G12)
    stx = zeros(n,3);
    sty = zeros(n,3);
    stxy = zeros(n,3);
    st1 = zeros(n,3);
    st2 = zeros(n,3);
    st12 = zeros(n,3);
    
    for i = 1:n
        qma = Q_bar(E1(i),E2(i),MU12(i),G12(i),THETA(i));
        fam1 = qma*[exr(i,1);eyr(i,1);gamaxyr(i,1)]; 
        fam2 = qma*[exr(i,2);eyr(i,2);gamaxyr(i,2)]; 
        fam3 = qma*[exr(i,3);eyr(i,3);gamaxyr(i,3)]; 
        stx(i,1) = fam1(1);
        sty(i,1) = fam1(2);
        stxy(i,1) = fam1(3);
        stx(i,2) = fam2(1);
        sty(i,2) = fam2(2);
        stxy(i,2) = fam2(3);
        stx(i,3) = fam3(1);
        sty(i,3) = fam3(2);
        stxy(i,3) = fam3(3);
%         dam = qma*[e1(i);e2(i);gama12(i)];
%         st1(i) = dam(1);
%         st2(i) = dam(2);
%         st12(i) = dam(3);
    end
    for i = 1:n
        thet = THETA(i);
        a = cosd(thet);
        b = sind(thet);
        T = [a^2,b^2,(2*a*b);b^2,a^2,(-2*a*b);(-a*b),(a*b),(a^2-b^2)];
        lam1 = T*[stx(i,1);sty(i,1);(stxy(i,1))];
        lam2 = T*[stx(i,2);sty(i,2);(stxy(i,2))];
        lam3 = T*[stx(i,3);sty(i,3);(stxy(i,3))];
        st1(i,1) = lam1(1);
        st2(i,1) = lam1(2);
        st12(i,1) = lam1(3);
        st1(i,2) = lam2(1);
        st2(i,2) = lam2(2);
        st12(i,2) = lam2(3);
        st1(i,3) = lam3(1);
        st2(i,3) = lam3(2);
        st12(i,3) = lam3(3);
 
    end



end