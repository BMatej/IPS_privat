run AS_ABB.m

% vrtilna hitrost napajalne napetosti
w_1 = 2*pi*f_naz;
% amplituda fazne napetosti
V_f = U_naz/sqrt(3)*sqrt(2);

L_s_T = L_s - L_m^2 / L_r;
L_r_T = L_r - L_m^2 / L_s;

k_s = L_m/L_s;
k_r = L_m/L_r;

% rotacijska matrika
M = [0 -1; 1 0];

%% Moènostni pretvornik
% transformacija vejnih napetosti v fazne (vezava zvezda)
T_Z = 1/3 * [2 -1 -1; -1 2 -1; -1 -1 2];
V_dc = 540;

%% 6-step operation
vektorji_kombinacije = [1 0 0;
                        1 1 0;
                        0 1 0;
                        0 1 1;
                        0 0 1;
                        1 0 1;
                        0 0 0;
                        1 1 1]';
                    
%% Sinusna PWM
f_1 = 50;
T_1 = 1/f_1;
f_sw = f_1*15;
T_sw = 1/f_sw;
f_vzorcenje =  50 * f_sw;
T_vzorcenje = 1/f_vzorcenje;

