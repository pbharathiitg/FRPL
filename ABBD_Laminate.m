function [ABBD,NT,NH,MT,MH] = ABBD_Laminate(E1,E2,MU12,G12,THETA,z,nol,alphax,alphay,alphaxy,betax,betay,betaxy,delT,delC)
   
    A = zeros(3,3);
    B = zeros(3,3);
    D = zeros(3,3);
    NT = zeros(3,1);
    NH = zeros(3,1);
    MT = zeros(3,1);
    MH = zeros(3,1);
    for i = 1:nol
        qmat = Q_bar(E1(i),E2(i),MU12(i),G12(i),THETA(i));
        A = A + (qmat)*(z(i)-z(i+1));
        B = B + (qmat)*(((z(i))^2)-((z(i+1))^2));
        D = D + (qmat)*((z(i)^3)-(z(i+1)^3));
        NT = NT + (qmat*[alphax(i);alphay(i);alphaxy(i)]*(z(i)-z(i+1)));
        NH = NH + (qmat*[betax(i);betay(i);betaxy(i)]*(z(i)-z(i+1)));
        MT = MT + (qmat*[alphax(i);alphay(i);alphaxy(i)]*((z(i)^2)-(z(i+1)^2)));
        MH = MH + (qmat*[betax(i);betay(i);betaxy(i)]*((z(i)^2)-(z(i+1)^2)));
    end
    A = A *(10^(-3));
    B = -(B/2)*(10^(-6));
    D = (D/3)*(10^(-9));
    NT = NT*delT*(10^(-3));
    NH = NH*delC*(10^(-3));
    MT = MT*delT*-0.5*(10^(-6));
    MH = MH*delC*-0.5*(10^(-6));
    
    ABBD = [A,B;B,D];
    
end