function [alphax,alphay,alphaxy,betax,betay,betaxy,ext,eyt,gamaxyt,exh,eyh,gamaxyh] = alpha_beta_changer(n,THETA,alpha1,alpha2,beta1,beta2,delT,delC)
    alphax = zeros(n,1);
    alphay = zeros(n,1);
    alphaxy = zeros(n,1);
    betax = zeros(n,1);
    betay = zeros(n,1);
    betaxy = zeros(n,1);
    ext= zeros(n,1);
    eyt= zeros(n,1);
    gamaxyt= zeros(n,1);
    exh= zeros(n,1);
    eyh= zeros(n,1);
    gamaxyh= zeros(n,1);
    for i = 1:n
        thet = THETA(i);
        a = cosd(thet);
        b = sind(thet);
        T = [a^2,b^2,(2*a*b);b^2,a^2,(-2*a*b);(-a*b),(a*b),(a^2-b^2)];
        sam1 = inv(T)*[alpha1(i);alpha2(i);0];
        alphax(i) = sam1(1);
        alphay(i) = sam1(2);
        alphaxy(i) = 2*sam1(3);
        sam2 = inv(T)*[beta1(i);beta2(i);0];
        betax(i) = sam2(1);
        betay(i) = sam2(2);
        betaxy(i) = 2*sam2(3);
        
    end
    for i = 1:n
        ext(i) = delT*alphax(i);
        eyt(i) = delT*alphay(i);
        gamaxyt(i) = delT*alphaxy(i)  ;
    end
    for i = 1:n
        exh(i) = delC*betax(i);
        eyh(i) = delC*betay(i);
        gamaxyh(i) = delC*betaxy(i)  ;
    end
    
end