clear all
close all
clc
%% Import Data
load('stimulate_signal.mat')
%% Setting Parameters
sample_length=100;
q=20;
len=500;
%% Predefined Dictionary
[D1,D2,D3]=generate_dic1(sample_length);
D=[D1 D2 D3];
%% Loop
for i=1:length(noise_signal)/len
    y=noise_signal(len*(i-1)+1:len*i);
    lk_signal=deal_sp(y,D,sample_length,q);
    lk_signal=lk_signal';
    bwlk(len*(i-1)+1:len*i)=lk_signal;
    rs=y-lk_signal;
    bwxh(len*(i-1)+1:len*i)=rs; 
end

%% Plot
figure;
subplot 311
plot(noise_signal)
subplot 312
plot(bwlk)
subplot 313
plot(bwxh)  