function [ f, X ] = fft_50( t, x )
    % tstats = [mean(diff(t))  std(diff(t))];   % Information Only
    dF = 50;
    t = t(t<1/dF); % ventaneo, y me garantizo que fs/N=50Hz, 
    x = x(t<1/dF);

    xr = resample(x, t); % muestras equiespaciadas
    tr = linspace(t(1), t(end), length(t)); % nuevos ts

    X = fftshift(fft(xr))/length(xr); 
    % fftshift: en vez de entre 0 y fs, esta entre -fs/2 y fs/2
    % divido por n samples para normalizar
    X = abs(X); % me quedo solo con el modulo
    N = length(X);
    
    fs = 1/(tr(2)-tr(1));
    if mod(N,2)==0
        f = linspace(-fs/2, fs/2-fs/N, N); 
    else
        f = linspace(-fs/2+fs/2/N, fs/2-fs/2/N, N); 
    end
    
    X = X(f>=0); % me quedo con frecuencias positivas
    f = f(f>=0);
    
    X = 2*X; % obtengo los coefs de fourier senoidales
    X(1) = X(1)/2; % el termino de f=0 no va multiplicado por dos
end

