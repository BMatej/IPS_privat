%% Podatki za AS ABB 2.2 kW

%% Nazivni podatki stroja
P_naz = 2.2; % nazivna moè
U_naz = 400; % efektivna medfazna napetost
f_naz = 50;  % nazivna napajalna frekvenca
I_naz = 5.0;  % nazivni tok
n_naz = 1436;  % nazivna hitrost
M_naz = 14.6;  % nazivni navor
cosfi_naz = 0.78;  % nazivni faktor delavnosti

%% Nadomestna shema
R_s = 3.7;        % statorska upornost
R_r = 2.296;       % rotorska upornost
L_s = 0.2449;
L_m = 0.2342;
L_r = 0.2449;

%% Mehanika
p_p = 2;
J = 0.0155;
K_tr = 0;
K_vu = 0.0025;