function ijh = stress_strain_printer(nol,e1,e2,gama12,st1,st2,st12,delT,delC,FiD)
    ijh = 0;
    e_MAT = zeros(nol*3,5);
    s_MAT = zeros(nol*3,5);
    
    % for loops for making matrix of material axis strains
        y = 1;
        for w = 1:3:(nol*3)
            e_MAT(w,1) = y;
            e_MAT(w+1,1) = y;
            e_MAT(w+2,1) = y;
            e_MAT(w,2) = -1;
            e_MAT(w+1,2) = 0;
            e_MAT(w+2,2) = 1;
            for x = 1:3
                if(x==1)
                    e_MAT(w,x+2) = e1(y,1);
                    e_MAT(w+1,x+2) = e1(y,2);
                    e_MAT(w+2,x+2) = e1(y,3);
                elseif(x==2)
                    e_MAT(w,x+2) = e2(y,1);
                    e_MAT(w+1,x+2) = e2(y,2);
                    e_MAT(w+2,x+2) = e2(y,3);
                elseif(x==3)
                    e_MAT(w,x+2) = gama12(y,1);
                    e_MAT(w+1,x+2) = gama12(y,2);
                    e_MAT(w+2,x+2) = gama12(y,3);
                end
            end
            y = y+1;
        end
        if (delT==0&&delC==0)
            fprintf(FiD,"\nstrains in material axis:\n");
            fprintf(FiD,"------------------------------------------------------------------------------\n");
            fprintf(FiD,'ply no\t\tposition\te1\t\te2\t\tgama12\n');
            fprintf(FiD,'\t\t\t\t(m/m)\t\t(m/m)\t\t(m/m)\n');
        elseif(delT~=0||delC~=0)
            fprintf(FiD,"\nresidual strains due to delT or delC in material axis:\n");
            fprintf(FiD,"------------------------------------------------------------------------------\n");
            fprintf(FiD,'ply no\t\tposition\te1\t\te2\t\tgama12\n');
            fprintf(FiD,'\t\t\t\t(m/m)\t\t(m/m)\t\t(m/m)\n');
        end
        
        
        for h = 1:3:(nol*3)
            fprintf(FiD,"------------------------------------------------------------------------------\n");
            fprintf(FiD,'\t\ttop\t\t%e\t%e\t%e\n',e_MAT(h,3),e_MAT(h,4),e_MAT(h,5));
            fprintf(FiD,'%d\t\tmiddle\t\t%e\t%e\t%e\n',e_MAT(h+1,1),e_MAT(h+1,3),e_MAT(h+1,4),e_MAT(h+1,5));
            fprintf(FiD,'\t\tbottom\t\t%e\t%e\t%e\n',e_MAT(h+2,3),e_MAT(h+2,4),e_MAT(h+2,5));    
        end
        
        % for loops for making matrix of material axis stress
        y = 1;
        for w = 1:3:(nol*3)
            s_MAT(w,1) = y;
            s_MAT(w+1,1) = y;
            s_MAT(w+2,1) = y;
            s_MAT(w,2) = -1;
            s_MAT(w+1,2) = 0;
            s_MAT(w+2,2) = 1;
            for x = 1:3 
                if(x==1)
                    s_MAT(w,x+2) = st1(y,1);
                    s_MAT(w+1,x+2) = st1(y,2);
                    s_MAT(w+2,x+2) = st1(y,3);
                elseif(x==2)
                    s_MAT(w,x+2) = st2(y,1);
                    s_MAT(w+1,x+2) = st2(y,2);
                    s_MAT(w+2,x+2) = st2(y,3);
                elseif(x==3)
                    s_MAT(w,x+2) = st12(y,1);
                    s_MAT(w+1,x+2) = st12(y,2);
                    s_MAT(w+2,x+2) = st12(y,3);
                end
            end
            y = y+1;
        end
        if (delT==0&&delC==0)
            fprintf(FiD,"\n\nstress in material axis :\n");
            fprintf(FiD,"------------------------------------------------------------------------------\n");
            fprintf(FiD,'ply no\t\tposises:tion\tsigma1\t\tsigma2\t\ttou12\n');
            fprintf(FiD,'\t\t\t\t(Pa)\t\t(Pa)\t\t(Pa)\n');
        elseif(delT~=0||delC~=0)
            fprintf(FiD,"\n\nresidual stress due to delT or delC in material axis :\n");
            fprintf(FiD,"------------------------------------------------------------------------------\n");
            fprintf(FiD,'ply no\t\tposises:tion\tsigma1\t\tsigma2\t\ttou12\n');
            fprintf(FiD,'\t\t\t\t(Pa)\t\t(Pa)\t\t(Pa)\n');
        end

        for h = 1:3:(nol*3)
            fprintf(FiD,"------------------------------------------------------------------------------\n");
            fprintf(FiD,'\t\ttop\t\t%e\t%e\t%e\n',s_MAT(h,3),s_MAT(h,4),s_MAT(h,5));
            fprintf(FiD,'%d\t\tmiddle\t\t%e\t%e\t%e\n',s_MAT(h+1,1),s_MAT(h+1,3),s_MAT(h+1,4),s_MAT(h+1,5));
            fprintf(FiD,'\t\tbottom\t\t%e\t%e\t%e\n',s_MAT(h+2,3),s_MAT(h+2,4),s_MAT(h+2,5));    
        end 
end