%% Diskretna Fourierjeva transformacija
% Naredi DFT nad vhodnim signalom X in dobljene koeficiente F[n] skalira:
% - (2/N) za vse 0<n<N/2 in
% - (1/N) za n=0 in n=N/2.
% Na podlagi vzor�ne frekvence f_s generira vektor frekvenc.
%
% X - vektor ekvidistan�no vzor�eni signal
% f_s - vzor�na frekvenca (v Hz)
% s - struktura, ki vsebuje frekvenco, amplitudo in fazni kot posamezne
%     frekven�ne komponente
% Opomba. Matlab za�ne indeksacijo z "1"

function s = myfft(X, f_s)
    
    % lastnosti vhodnega signala
    N = length(X); % dol�ina signala
    
    % naredim fft
    Y = fft(X);
    
    % vektor frekvenc (x-os)
    f = f_s/2 * linspace(0,1,N/2+1)';

    % normirani amplitudni spekter (y-os)
    Y_abs = (2/N) * abs(Y(1:N/2+1));     % paroma zdru�im komponente (2/L)
    Y_abs(1) = (1/N) * abs(Y(1));        % enosmerna komponenta (1/L)
    Y_abs(N/2+1) = (1/N) * Y_abs(N/2+1); % najvi�ja frekvenca (1/L)
    
    % fazni spekter v stopinjah
    Y_ang = angle(Y(1:N/2+1)) * (180/pi);

    % izhod funkcije naj bo struktura
    s.f = f;            % frekvenca
    s.Y_abs = Y_abs;    % amplituda
    s.Y_ang = Y_ang;    % fazni kot
end