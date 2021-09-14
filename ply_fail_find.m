function [n_PF,row,col] = ply_fail_find(n,st1,st2,st12,st1RR,st2RR,st12RR,S1TU,S1CU,S2TU,S2CU,T12U,N_ele1,delT,delC)

    st1_UT = zeros(n,3);
    st2_UT = zeros(n,3);
    st12_UT = zeros(n,3);
    for i = 1:n
        for j = 1:3
            if(st1(i,j)>=0)
               st1_UT(i,j) = S1TU(i);
            elseif(st1(i,j)<0)
                st1_UT(i,j) = S1CU(i);
            end
        end
    end
     for i = 1:n
        for j = 1:3
            if(st2(i,j)>=0)
               st2_UT(i,j) = S2TU(i);
            elseif(st2(i,j)<0)
                st2_UT(i,j) = S2CU(i);
            end
        end
     end
     for i = 1:n
        for j = 1:3
            st12_UT(i,j) = T12U(i);
        end
     end
     
     st1_UT=st1_UT*(10^6);
     st2_UT=st2_UT*(10^6);
     st12_UT=st12_UT*(10^6);
     st1_ratio = abs(st1./st1_UT);
     st2_ratio = abs(st2./st2_UT);
     st12_ratio = abs(st12./st12_UT);

    st1_1_UT=max(st1_ratio,[],2);
    st2_1_UT=max(st2_ratio,[],2);
    st12_1_UT=max(st12_ratio,[],2);
    whole_ratio_mat = [st1_1_UT,st2_1_UT,st12_1_UT];
    [val,idx] = max(whole_ratio_mat, [], 'all','linear');
    layer_no = rem(idx,n);
    [row,col] = find (whole_ratio_mat==val);
    if (delT~=0||delC~=0)
        if (col == 1)
            stress = max(st1(row(1),:));
        elseif (col ==2)
            stress = max(st2(row(1),:));
        elseif (col ==3)
            stress = max(st12(row(1),:));
        end
        if (col == 1)
            UTS = max(st1_UT(row(1),:));
        elseif (col ==2)
            UTS = max(st2_UT(row(1),:));
        elseif (col ==3)
            UTS = max(st12_UT(row(1),:));
        end
        if (col == 1)
            rsa = max(st1RR(row(1),:));
        elseif (col ==2)
            rsa = max(st2RR(row(1),:));
        elseif (col ==3)
            rsa = max(st12RR(row(1),:));
        end
        
        val = stress/(UTS-rsa);
        
    end
    N_ele1;
    val;
    n_PF = N_ele1/val;
     
   
end