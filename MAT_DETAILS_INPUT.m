function [E1,E2,MU12,G12,THETA,t,alpha1,alpha2,beta1,beta2,S1TU,S1CU,S2TU,S2CU,T12U,N,M] = MAT_DETAILS_INPUT(n) 
%          E1 = zeros(n,1);
%          E2 = zeros(n,1);
%          MU12 = zeros(n,1);
%          G12 = zeros(n,1);
%          THETA = zeros(n,1);
%          t = zeros(n,1);
%          alpha1 = zeros(n,1);
%          alpha2 = zeros(n,1);
%          beta1 = zeros(n,1);
%          beta2 = zeros(n,1);
%         for i = 1:n
% %             print("enter the details of lamina %d",i);
%             E1(i) = input("enter of E1 of material :");
%             E2(i) = input("enter of E2 of material :");
%             MU12(i) = input("enter of MU12 of material :");
%             G12(i) = input("enter of G12 of material :");
%             THETA(i) = input("enter the Theta: ");
%             t(i) = input("ener the thickness of the lamina (mm)"); 
%             alpha1(i) = input("ener the alpha 1 :");
%             alpha2(i) = input("ener the alpha 2 :");
%             beta1(i) = input("ener the beta 1 :");
%             beta2(i) = input("ener the beta 2 :");
%         end  
    %     N(1) = input("enter Nx:");
    %     N(2) = input("enter Ny:");
    %     N(3) = input("enter Nxy:");
    %     M(1) = input("enter Mx:");
    %     M(2) = input("enter My:");
    %     M(3) = input("enter Mxy:");

                               %      lec 31
        E1 = [38.6;38.6;38.6;38.6;38.6;38.6;38.6;38.6];
        E2 = [8.27;8.27;8.27;8.27;8.27;8.27;8.27;8.27];
        MU12 = [0.28;0.28;0.28;0.28;0.28;0.28;0.28;0.28];
        G12 = [4.14;4.14;4.14;4.14;4.14;4.14;4.14;4.14];
        THETA = [0;45;-45;90;90;-45;45;0];
        t = [0.125;0.125;0.125;0.125;0.125;0.125;0.125;0.125];
        alpha1 = [8.6e-6;8.6e-6;8.6e-6;8.6e-6;8.6e-6;8.6e-6;8.6e-6;8.6e-6];
        alpha2 = [22.1e-6;22.1e-6;22.1e-6;22.1e-6;22.1e-6;22.1e-6;22.1e-6;22.1e-6];
        beta1 = [0;0;0;0;0;0;0;0];
        beta2 = [0;0;0;0;0;0;0;0];
        S1TU = [1062;1062;1062;1062;1062;1062;1062;1062];
        S1CU = [610;610;610;610;610;610;610;610];
        S2TU = [31;31;31;31;31;31;31;31];
        S2CU = [118;118;118;118;118;118;118;118];
        T12U = [72;72;72;72;72;72;72;72];
        N = [100000,0,0];    % in  N/m
        M = [0,0,0];
        
%                                %     lec 30
%         E1 = [140;140;140;140];  %in GPa
%         E2 = [10;10;10;10];
%         MU12 = [0.3;0.3;0.3;0.3];
%         G12 = [7;7;7;7];
%         THETA = [0;90;90;0];       % in degrees
%         t = [0.25;0.25;0.25;0.25];   % in mm
%         alpha1 = [0;0;0;0];
%         alpha2 = [0;0;0;0];
%         beta1 = [0;0;0;0];
%         beta2 = [0;0;0;0];
%         S1TU = [1400;1400;1400;1400];   %in MPa
%         S1CU = [1400;1400;1400;1400];
%         S2TU = [50;50;50;50];
%         S2CU = [200;200;200;200];
%         T12U = [70;70;70;70];
%         N = [100000,0,0];    % in  N/m
%         M = [0,0,0];



        
end
