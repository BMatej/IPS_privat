close all; clc;

run parametrizacija_as.m
% Meritve
V_napetosti = (0:0.05:1)*V_dc / sqrt(3);    %Array z napetostmi
set_param('AM_s_PWM','MaxConsecutiveZCsMsg','none')

%sim('AM_s_PWM',[0 25/f_1]);
%plot(I_a)
% for i = 1:length(V_napetosti)
%     V_a=V_napetosti(i);
%     V_a = V_dc / sqrt(3);
%     sim('AM_s_PWM',[0 25/f_1]);
%     I_vzorci = I_a((length(I_a)-stevilo_vzorcev):Length(I_a))
% end¸
X = 0.9;
V_a = V_dc / sqrt(3) * X;
cas_simulacije = 30/X^1.5 * T_1;
sim('AM_s_PWM',[0 cas_simulacije]);
    %I_vzorci = I_a((length(I_a)-stevilo_vzorcev):Length(I_a))
figure(2)
plot(I_a)
%%
stevilo_vzorcev = T_1 * f_vzorcenje;
vsi_podatki = length(I_a);
I_vzorci = I_a((vsi_podatki-(stevilo_vzorcev-1)):vsi_podatki);

% Sedaj izvedi FFT nad I_vzorci
rez = myfft(I_vzorci , f_vzorcenje)
    