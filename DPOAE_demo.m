
%Sample rate
fs = 44100;

% 1100 Hz 1 sec tone
t1  = linspace(0, 1, 1*fs);
w = 2*pi*1100;
s = sin(w*t1);

%1100 to 1000 Hz 6 sec chirp
t = 1/fs:1/fs:6;
fo = 1100;
f1 = 800;
s2 = chirp(t,fo,6,f1);

%700 Hz 7 sec tone
t3  = linspace(0, 7, 7*fs);
w2 = 2*pi*700;
F1 = sin(w2*t3);

% Lower amplitude
F1 = F1 * 0.5;
F2 = [s s2] * 0.5; %And append tone+chirp

% Combine and adjust amplitude
F3 = (F1+F2)*0.6;

%audiowrite("F1_sound.wav", F1, fs)
%audiowrite("F2_sound.wav", F2, fs)
%audiowrite("combined_sound.wav", F3, fs)

%Vectors for plot
F2P = [1100 linspace(1100,800,7)];
F1P = repmat(700,1,8);
F3P = 2*F1P - F2P;

plot(F2P, LineWidth=2); hold on;
plot(F1P, LineWidth=2);
plot(F3P, '--', LineWidth=2);
xlabel("Time (sec)")
ylabel("Frequency (Hz)")
legend('F2','F1', '2 x F1 - F2')

plot_darkmode

ax = gca;
ax.XTickLabel = [0 1 2 3 4 5 6 7];
ax.YLim = [200 1200]; hold off


