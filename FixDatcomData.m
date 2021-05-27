function fixed_datcom = FixDatcomData(datcom_data_to_fix)

nalpha = datcom_data_to_fix.nalpha;
nmach = datcom_data_to_fix.nmach;
nalt = datcom_data_to_fix.nalt;
build = datcom_data_to_fix.build;

if datcom_data_to_fix.ngh
    ngh = datcom_data_to_fix.ngh+1;
else
    ngh=0;
end

if datcom_data_to_fix.ndelta
    ndelta = datcom_data_to_fix.ndelta;
else
    ndelta=0;
end

fixed_datcom = datcom_data_to_fix;

%campi che vanno corretti copiando un singolo valore in tutto il campo
scalar_fix_fields = {'cyb' 'cnb'};

%campi che vanno corretti copiando un vettore in tutto il campo
array_fix_fields = {'cd', 'cl', 'cm', 'cn', 'ca', 'xcp', 'cma', 'clb', 'cla', 'qqinf', 'eps', 'depsdalp'}; 

%vettori che vanno corretti copiando un singolo valore in tutto il vettore
scalar_fix_vector = {'clq', 'cmq', 'cha_sym'};



%correzione campi che vanno corretti copiando un singolo valore in tutto il campo
for k = 1:length(scalar_fix_fields)
    fixed_datcom.(scalar_fix_fields{k}) = fixed_datcom.(scalar_fix_fields{k})(1,1,1,1,2,1).*ones(20,1,1,1,2,9);
end

%correzione campi che vanno corretti copiando un vettore in tutto il campo
for k = 1:length(array_fix_fields)
    fixed_datcom.(array_fix_fields{k}) = fixed_datcom.(array_fix_fields{k})(:,1,1,1,2,1).*ones(20,1,1,1,2,9);
end


%correzione vettori che vanno corretti copiando un singolo valore in tutto il vettore
for k = 1:length(scalar_fix_vector)
    s1 = size(fixed_datcom.(scalar_fix_vector{k}));
    fixed_datcom.(scalar_fix_vector{k}) = fixed_datcom.(scalar_fix_vector{k})(1).*ones(s1(1), s1(2));
end



%coeff. _tt da completare con i corrispettivi coeff. _te
fixed_datcom.cd0_w_tt = fixed_datcom.cd0_w_te;
fixed_datcom.friccoeff_w_tt = fixed_datcom.friccoeff_w_te;
fixed_datcom.cd0_ht_tt = fixed_datcom.cd0_ht_te;
fixed_datcom.friccoeff_ht_tt = fixed_datcom.friccoeff_ht_te;
fixed_datcom.cd0_vt_tt = fixed_datcom.cd0_vt_te;
fixed_datcom.friccoeff_vt_tt = fixed_datcom.friccoeff_vt_te;
fixed_datcom.cd0_vf_tt = fixed_datcom.cd0_vf_te;
fixed_datcom.friccoeff_vf_tt = fixed_datcom.friccoeff_vf_te;

%coeff. hiv_*_* che vanno completati con i corrispettivi coeff. iv_*_*
fixed_datcom.hiv_b_w = fixed_datcom.iv_b_w;
fixed_datcom.hiv_w_h = fixed_datcom.iv_w_h;
fixed_datcom.hiv_b_h = fixed_datcom.iv_b_h;
