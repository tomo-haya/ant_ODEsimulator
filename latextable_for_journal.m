function latextable_for_journal(output_filename)

fd=fopen(output_filename,'w');
for i=1:12
    Case=i;
    
    fprintf(fd,'\\renewcommand{\\tablename}{Table S}\n');
    fprintf(fd,'\\setcounter{table}{%d}}\n',Case-1);  
    
    fprintf(fd,'\\begin{table*}[h]\n\\normalsize\n\\begin{center}\n');
    if (Case == 1)
    fprintf(fd,'\\caption{Relationship between colony size, the rate of engaged workers involved in each task after 15 years and parameter disturbance for the scenario (X(-1), Y(-1))}\n');
    end
    if (Case == 2)
    fprintf(fd,'\\caption{Relationship between colony size, the rate of engaged workers involved in each task after 15 years and parameter disturbance for the scenario (X(0H), Y(-1))}\n');
    end
    if (Case == 3)
    fprintf(fd,'\\caption{Relationship between colony size, the rate of engaged workers involved in each task after 15 years and parameter disturbance for the scenario (X(0L), Y(-1))}\n');
    end
    if (Case == 4)
    fprintf(fd,'\\caption{Relationship between colony size, the rate of engaged workers involved in each task after 15 years and parameter disturbance for the scenario (X(+1), Y(-1))}\n');
    end
    if (Case == 5)
    fprintf(fd,'\\caption{Relationship between colony size, the rate of engaged workers involved in each task after 15 years and parameter disturbance for the scenario (X(-1), Y(0))}\n');
    end
    if (Case == 6)
    fprintf(fd,'\\caption{Relationship between colony size, the rate of engaged workers involved in each task after 15 years and parameter disturbance for the scenario (X(0H), Y(0))}\n');
    end
    if (Case == 7)
    fprintf(fd,'\\caption{Relationship between colony size, the rate of engaged workers involved in each task after 15 years and parameter disturbance for the scenario (X(0L), Y(0))}\n');
    end
    if (Case == 8)
    fprintf(fd,'\\caption{Relationship between colony size, the rate of engaged workers involved in each task after 15 years and parameter disturbance for the scenario (X(+1), Y(0))}\n');
    end
    if (Case == 9)
    fprintf(fd,'\\caption{Relationship between colony size, the rate of engaged workers involved in each task after 15 years and parameter disturbance for the scenario (X(-1), Y(+1))}\n');
    end
    if (Case == 10)
    fprintf(fd,'\\caption{Relationship between colony size, the rate of engaged workers involved in each task after 15 years and parameter disturbance for the scenario (X(0H), Y(+1))}\n');
    end
    if (Case == 11)
    fprintf(fd,'\\caption{Relationship between colony size, the rate of engaged workers involved in each task after 15 years and parameter disturbance for the scenario (X(0L), Y(+1))}\n');
    end
    if (Case == 12)
    fprintf(fd,'\\caption{Relationship between colony size, the rate of engaged workers involved in each task after 15 years and parameter disturbance for the scenario (X(+1), Y(+1))}\n');
    end
    
    fprintf(fd,'\\label{t_parameter_case%d}',Case);
    header();

 
    row('p_rstop','$p_{rstop}$');
    row('p_estop','$p_{estop}$');
    row('p_iteng','$p_{iteng}$');
    row('p_difeng','$p_{difeng}$');
    row('p_larva','$p_{larva}$');
    row('n_food','$n_{food}$');
    row('b_larva','$b_{larva}$');
    row('q_x','$q_{x}$');
    row('q_y','$q_{y}$');
    row('a_midden','$a_{R_{midden}},a_{E_{midden}},a_{I_{midden}}$');
    row('a_nest','$a_{R_{nest}},a_{E_{nest}},a_{I_{nest}}$');
    row('a_intra','$a_{E_{intra}},a_{I_{intra}}$');
    row('p_enemy','$p_{enemy}$');
    row('p_mcoll','$p_{mcoll}$');
    row('p_din','$p_{din}$');
    row('p_mdetect','$p_{mdetect}$');
    row('p_ddetect','$p_{ddetect}$');
    row('q_enemy','$q_{enemy}$'); 
    row('n_max','$n_{\\rm max}$');
    row('n_hunger','$n_{hunger}$');
    fprintf(fd,'\\hline');
    roworiginal('b_max','$original$');%%"b_max" has no meaning.
    fprintf(fd,'\\end{tabular}\n');
    fprintf(fd,'\\end{center}\n\\end{table*}\n\n');
end
fclose(fd);


    function header()
        
      
        fprintf(fd,'\\begin{tabular}{|c||c|c|c|c|c|c|c|c|c|c|} \\hline\n');
        fprintf(fd,'&\\multicolumn{2}{|c|}{Forager}&\\multicolumn{2}{|c|}{Midden}&\\multicolumn{2}{|c|}{Maintenance}&\\multicolumn{2}{|c|}{Intra-nest tasks}&\\multicolumn{2}{|c|}{Colony size}	\\\\ \\cline{2-11}\n');
        fprintf(fd,'\\raisebox{1em}{Parameter}&$-50\\%%$&$+50\\%%$&$-50\\%%$&$+50\\%%$&$-50\\%%$&$+50\\%%$&$-50\\%%$&$+50\\%%$&$-50\\%%$&$+50\\%%$	\\\\ \\hline \\hline\n');
        
    end
    function row(file,name)
        load(file);

        n=result(:,2,:)+result(:,5,:)+result(:,8,:)+result(:,3,:)+result(:,6,:)+result(:,9,:)+result(:,4,:)+result(:,7,:)+result(:,10,:)+result(:,11,:);
        
        f=result(:,5,:);%%W_E_forag
        m=result(:,6,:);%%W_E_mid
        d=result(:,7,:);%%W_E_nest
        o=result(:,11,:)*0.2;%%W_E_intra
        tempn =  f + m + d + o;%%Total engaged workers

        %Rate of each task workers
        pf=f./tempn*100;
        pm=m./tempn*100;
        pd=d./tempn*100;
        po=o./tempn*100;                 

        if (n(1,1,Case) < 1)%%If number of total workers is less than 1, then task rate is neglect(50%)
        pf(1,1,Case)=0;
        pm(1,1,Case)=0;
        pd(1,1,Case)=0;
        po(1,1,Case)=0;
        n(1,1,Case)=0;
        end
        
        if (n(2,1,Case) < 1)%%If number of total workers is less than 1, then task rate is neglect(50%)
        pf(2,1,Case)=0;
        pm(2,1,Case)=0;
        pd(2,1,Case)=0;
        po(2,1,Case)=0;
        n(2,1,Case)=0;
        end

        
        fprintf(fd,name);
        fprintf(fd,'&$%d\\%%$',round(pf(1,1,Case)));%%round: print as integer
        fprintf(fd,'&$%d\\%%$',round(pf(2,1,Case)));
        fprintf(fd,'&$%d\\%%$',round(pm(1,1,Case)));
        fprintf(fd,'&$%d\\%%$',round(pm(2,1,Case)));
        fprintf(fd,'&$%d\\%%$',round(pd(1,1,Case)));
        fprintf(fd,'&$%d\\%%$',round(pd(2,1,Case)));
        fprintf(fd,'&$%d\\%%$',round(po(1,1,Case)));
        fprintf(fd,'&$%d\\%%$',round(po(2,1,Case)));
        fprintf(fd,'&$%d$',round(n(1,1,Case)));
        fprintf(fd,'&$%d$',round(n(2,1,Case)));
        fprintf(fd,'\\\\ \\hline\n');
    end

    function roworiginal(file,name)
        load(file);
        n=result(:,2,:)+result(:,5,:)+result(:,8,:)+result(:,3,:)+result(:,6,:)+result(:,9,:)+result(:,4,:)+result(:,7,:)+result(:,10,:)+result(:,11,:);
        
        f=result(:,5,:);
        m=result(:,6,:);
        d=result(:,7,:);
        o=result(:,11,:)*0.2;
        tempn =  f + m + d + o;

        %%pf-po initialization
        pf=f./tempn*100;
        pm=m./tempn*100;
        pd=d./tempn*100;
        po=o./tempn*100;     
        
        if (n(1,1,Case) < 1)%%Calc error level -> Neglect
        pf(1,1,Case)=0;
        pm(1,1,Case)=0;
        pd(1,1,Case)=0;
        po(1,1,Case)=0;
        n(1,1,Case)=0;
        end
        
        fprintf(fd,name);
        fprintf(fd,'&\\multicolumn{2}{|c|}{%d\\%%}',round(pf(1,1,Case)));
        fprintf(fd,'&\\multicolumn{2}{|c|}{%d\\%%}',round(pm(1,1,Case)));
        fprintf(fd,'&\\multicolumn{2}{|c|}{%d\\%%}',round(pd(1,1,Case)));
        fprintf(fd,'&\\multicolumn{2}{|c|}{%d\\%%}',round(po(1,1,Case)));
        fprintf(fd,'&\\multicolumn{2}{|c|}{%d}',round(n(1,1,Case)));
        fprintf(fd,'\\\\ \\hline\n');
    end
end