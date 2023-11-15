
%Sample rate
fs = 44100;

% 1100 Hz 1 sec tone
t1  = linspace(0, 1, 1*fs);
w = 2*pi*1100;
s = sin(w*t1);

%1100 to 1000 Hz 2 sec chirp
t = 1/fs:1/fs:2;
fo = 1100;
f1 = 1000;
s2 = chirp(t,fo,2,f1);

%700 Hz 3 sec tone
t3  = linspace(0, 3, 3*fs);
w2 = 2*pi*700;
F1 = sin(w2*t3);

F1 = F1 * 0.5;
F2 = [s s2] * 0.5;

audiowrite("F1_sound.wav", F1, fs)
audiowrite("F2_sound.wav", F2, fs)
