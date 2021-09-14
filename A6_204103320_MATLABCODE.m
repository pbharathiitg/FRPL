clear all
clc
format shortEng
nol = input("Enter no of layers: ");
%take input of material details and load details
[E1,E2,MU12,G12,THETA,t,alpha1,alpha2,beta1,beta2,S1TU,S1CU,S2TU,S2CU,T12U,N,M] =  MAT_DETAILS_INPUT(nol);

delT = input("Enter change in temperature: ");      % in degrees
delC = input("Enter change in humidity: ");

% z vector
z = zvec(t,nol);

fid1 = fopen('A6_complete_degradation.txt','w');
ply_fail_load_comp = complete_degrad(nol,z,THETA,alpha1,alpha2,beta1,beta2,delT,delC,E1,E2,MU12,G12,N,M,S1TU,S1CU,S2TU,S2CU,T12U,fid1);
ply_fail_load_comp(ply_fail_load_comp==0) = [];
siz = size(ply_fail_load_comp);
fprintf(fid1,"PLY FAILURE LOADS in complete degradation:\n***************************************************\n");
disp("-------------------------------------------------------------");
disp("ply failure loads in complete degradation:")

for u = 1:siz
    disp( u + " ply failure load = " +ply_fail_load_comp(u)+" N/m")
    fprintf(fid1,"%d ply failure load = %.3e N/m\n",u,ply_fail_load_comp(u));
end
fclose(fid1);
disp("strains and stress of each layer are stored in complete_degradation.txt file in the same folder");
disp("-------------------------------------------------------------");
fid2 = fopen('A6_partial_degradation.txt','w');
ply_fail_load_part = partial_degrad(nol,z,THETA,alpha1,alpha2,beta1,beta2,delT,delC,E1,E2,MU12,G12,N,M,S1TU,S1CU,S2TU,S2CU,T12U,fid2);
ply_fail_load_part(ply_fail_load_part==0) = [];
siz = size(ply_fail_load_part);
fprintf(fid2,"PLY FAILURE LOADS in partial degradation:\n***************************************************\n");
disp("ply failure loads in partial degradation:")
for u = 1:siz
    disp( u + " ply failure load = " +ply_fail_load_part(u)+" N/m")
    fprintf(fid2,"%d ply failure load = %.3e N/m\n",u,ply_fail_load_part(u));
end
fclose(fid2);
disp("strains and stress of each layer are stored in partial_degradation.txt file in the same folder");


