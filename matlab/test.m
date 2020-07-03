close all;
clear all;

filename = 'ma10-mf15.txt';
maxharm=35;

data = dlmread(string(filename), '\t', 1, 0);
t = data(:,1);
x = data(:,3);


% fx = 50;
% t = 0:1/500/fx:5/fx;
% x = sin(2*pi*fx*t);

t = t(t<0.020);
x = x(t<0.020);
% 
% % plot(t, x, '-o');
% % hold on;
% 
% xr = resample(x,t);
% tr = linspace(t(1), t(end), length(t));
% 
% % plot(tr,xr, '-o');
% 
% X = 2*fftshift(fft(x))/length(x);
% X = abs(X);
% 
% 
% N = length(X);
% fs = 1/(tr(2)-tr(1));
% if mod(N,2)==0
%     f = linspace(-fs/2, fs/2-fs/N, N); 
% else
%     f = linspace(-fs/2+fs/2/N, fs/2-fs/2/N, N); 
% end
% 
% X = X(f>=0);
% X(1)=X(1)/2;
% f = f(f>=0);

stem(f(1:maxharm),X(1:maxharm));
hold on;

X = 2*fftshift(fft(xr))/length(xr);

X = abs(X);
N = length(X);
fs = 1/(tr(2)-tr(1));
if mod(N,2)==0
    f = linspace(-fs/2, fs/2-fs/N, N); 
else
    f = linspace(-fs/2+fs/2/N, fs/2-fs/2/N, N); 
end
X = X(f>=0);
X(1)=X(1)/2;
f = f(f>=0);

stem(f(1:maxharm),X(1:maxharm));
% 
% %%Fourier Transform:
% X = fftshift(fft(x));
% 
% %%Frequency specifications:
% % f = 0:50:fs/2-50;           % hertz
% N = length(X);
% X = X(ceil(N/2):N)/N;
% X = abs(X);
% % X=X';
% f = 0:1/t(end):N/2/t(end);
% %f = f(f>=0);
% 
% maxharm=min(35,length(X));
% 
% stem(f(1:maxharm), X(1:maxharm));
% grid on;
% hold on;
% 
% N = length(t);
% fs1 = t(end)/N;
% fs = 50*N;
% % Ts = 1/fs;
% % tr = 0:Ts:0.02;   % Uniformly-Sampled Time Vector
% % tstats = [mean(diff(t))  std(diff(t))]   % Information Only
% 
% x = resample(x, t, 'linear');
% %x = resample(x, t, fs, 'linear');                        % Resampled Signal Vector
% N = length(x);
% 
% plot(t,x, '-o');
% 
% %close all;
% 
% %%Fourier Transform:
% X = fftshift(fft(x))/N;
% 
% %%Frequency specifications:
% 
% X = X(ceil(N/2):N)/N;
% X = abs(X);
% 
% stem(f(1:maxharm),X(1:maxharm));