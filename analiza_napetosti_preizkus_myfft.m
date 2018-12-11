%% Preizkus delovanja funkcije myfft
close all, clear all

% nalo�i oscilogram napetosti
load omrezna_napetost.mat
%load kvadratna_napetost.mat

% izra�unaj diskretni fourierjev transform
dt = t(2)-t(1);
f_s = 1/dt;
rez = myfft(V_a,f_s);

% izra�unaj lastnosti signala (pazi na indeksacijo!)
V_1 = rez.Y_abs(2) / sqrt(2);          % efektivna vrednost 1. harmonika
V_eff = sqrt(sum(rez.Y_abs.^2) / 2 );  % efektivna vrednost (skupna)
THD = sqrt((V_eff/V_1)^2 - 1);         % faktor harmonskega popa�enja

%% Nari�i graf
f1=figure;

b1 = bar(rez.f, rez.Y_abs);
xlim([0 2000]);
xlabel('frekvenca (Hz)')
ylabel('napetost (V)')
grid on

% naslov spodnjega grafa z izpisom vrednosti V_eff in THD
title(['V_1 = ' num2str(V_1),' V, ' 'RMS = ' num2str(V_eff),' V,' ' THD = ' num2str(THD)])