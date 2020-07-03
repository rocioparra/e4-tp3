close all;
clear all;

% filenames = {'ma08-mf15.txt', 'ma10-mf15.txt', 'ma13-mf15.txt'};
% maxharm=35;
% filenames = {'ma11-mf33.txt', 'ma11-mf66.txt', 'ma11-mf88.txt'}; % el nombre del archivo esta mal, es 81
% maxharm=90;
filenames = {'ma08-mf15.txt', 'ma08-mf21.txt', 'ma08-mf27.txt'};
maxharm=35;


for i=1:3
    data = dlmread(string(filenames(i)), '\t', 1, 0);
    time = data(:,1);
    va = data(:,3);

    [f, X] = fft_50(time, va);
    % X = 10*log10(X/1000);
    % X = sqrt(X);
    stem(round(f(1:maxharm)/50), X(1:maxharm));
    %stem(X(1:maxharm));
    if i==1
        hold on;
    end
end

% formataxes('', 'N\''umero de arm\''onico', 'Potencia (dBm)', ...
%     '$m_a=0.8$',...
%     '$m_a=1$',...
%     '$m_a=1.3$'...
%     );

xlabel('Número de armónico');
ylabel('Tensión (V)');
% legend(...
%     'm_a=0.8',...
%     'm_a=1.0',...
%     'm_a=1.3'...
%      );
% legend(...
%     'm_f=33',...
%     'm_f=66',...
%     'm_f=81'...
%     );
legend(...
    'm_f=15',...
    'm_f=21',...
    'm_f=27'...
    );
grid on;

fig = gcf;
fig.Position = [100 200 750 350];

%xticks(sort([1 15 30]));
% xticklabels({'$10^3$', '$10^4$', '$2.5\times 10^4$', '$10^5$', '$10^6$'});