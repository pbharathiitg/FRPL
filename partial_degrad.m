function [ply_fail_load] = partial_degrad(nol,z,THETA,alpha1,alpha2,beta1,beta2,delT,delC,E1,E2,MU12,G12,N,M,S1TU,S1CU,S2TU,S2CU,T12U,FiD)

    count_R = nol;
    ply_fail_load = zeros(count_R,1);
    j=1;
    while (count_R~=0)
        st1RR = zeros(nol,3);
        st2RR = zeros(nol,3);
        st12RR = zeros(nol,3);
        [alphax,alphay,alphaxy,betax,betay,betaxy,ext,eyt,gamaxyt,exh,eyh,gamaxyh] = alpha_beta_changer(nol,THETA,alpha1,alpha2,beta1,beta2,0,0);
        [ABBD,NT,NH,MT,MH] = ABBD_Laminate(E1,E2,MU12,G12,THETA,z,nol,alphax,alphay,alphaxy,betax,betay,betaxy,0,0);
        Nvec = (N') + NT + NH;
        Mvec = (M') + MT + MH;
        NM = [Nvec;Mvec];
        ABBD  ;         % A in Pam,B in Pam^2,C in Pam^3
        epk_0 = ABBD\NM  ;    % 1st three in m/m,2nd three in 1/m
        [exr,eyr,gamaxyr,e1,e2,gama12] =ply_mat_xy_strains(nol,z,epk_0,THETA,ext,eyt,gamaxyt,exh,eyh,gamaxyh);% in m/m
        [stx,sty,stxy,st1,st2,st12] =ply_mat_xy_stress(nol,exr,eyr,gamaxyr,THETA,E1,E2,MU12,G12);% in Pa
        fprintf(FiD,"\nIteration: %d\n",j);
        ijh = stress_strain_printer(nol,e1,e2,gama12,st1,st2,st12,0,0,FiD);
    
      if (delT~=0||delC~=0)
          [alphaxRR,alphayRR,alphaxyRR,betaxRR,betayRR,betaxyRR,extRR,eytRR,gamaxytRR,exhRR,eyhRR,gamaxyhRR] = alpha_beta_changer(nol,THETA,alpha1,alpha2,beta1,beta2,delT,delC);
          [ABBDRR,NTRR,NHRR,MTRR,MHRR] = ABBD_Laminate(E1,E2,MU12,G12,THETA,z,nol,alphaxRR,alphayRR,alphaxyRR,betaxRR,betayRR,betaxyRR,delT,delC);
          NvecRR =  NTRR + NHRR;
          MvecRR =  MTRR + MHRR;
          NMRR = [NvecRR;MvecRR];
          ABBDRR ;           % A in Pam,B in Pam^2,C in Pam^3
          epk_0RR = ABBDRR\NMRR ;    % 1st three in m/m,2nd three in 1/m
          epk_0RR;
          [exrRR,eyrRR,gamaxyrRR,e1RR,e2RR,gama12RR] =ply_mat_xy_strains(nol,z,epk_0RR,THETA,extRR,eytRR,gamaxytRR,exhRR,eyhRR,gamaxyhRR);% in m/m
          [stxRR,styRR,stxyRR,st1RR,st2RR,st12RR] =ply_mat_xy_stress(nol,exrRR,eyrRR,gamaxyrRR,THETA,E1,E2,MU12,G12);% in Pa
          ijh = stress_strain_printer(nol,e1RR,e2RR,gama12RR,st1RR,st2RR,st12RR,delT,delC,FiD);
      end
        
        [n_PF,row,col] = ply_fail_find(nol,st1,st2,st12,st1RR,st2RR,st12RR,S1TU,S1CU,S2TU,S2CU,T12U,N(1),delT,delC);
        fprintf(FiD,"\nplies that fail in this iteration:\n");
        fmt=[repmat(' %1.0f',1,numel(row))];
        fprintf(FiD,fmt,row);
        fprintf(FiD,'\n');
        if (numel(row)~=0)
            count_R = count_R - numel(row);
        end
        N(1) = n_PF;            % in N/m
        ply_fail_load(j) = n_PF;
        for k = 1:nol
            if (ismember(k,row))
                if (col(1) == 1)
                    E1(k) = 0;
                elseif(col(1) == 2||col(1) == 3)
                E2(k) = 0;
                G12(k) = 0;
                end
            end 
        end
        j = j+1;
        fprintf(FiD,'************************************************************************************************************************************iteration finished\n');
    end
end