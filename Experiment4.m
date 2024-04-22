clc;
clear all;
close all;
N=10^5;
input=rand(1,N)>0.5;
input_bpsk=(2*input)-1;
SNRdb=0:50;
SNR=10.^(SNRdb/10);
BER=0.5*(1-sqrt(SNR./(SNR+2)));

semilogy(SNRdb,BER,"linewidth",2);
xlabel("SNR in db");
ylabel("Bit Error Rate");
title("BER vs SNR for Rayleigh fading qireless channel using BPSK");

hold on;

%y=h*x+n/SNR
for z=1:length(SNR);
  
  noise=randn(1,N)+j*randn(1,N);
  h=randn(1,N)+j*randn(1,N);
  y=(h.*input_bpsk)+(noise./sqrt(SNR(z)));
  y_eq=y./h;
  rec_op=real(y_eq)>0;
  err(z)=size(find([input-rec_op]),2);
end

BER=err./N;
semilogy(SNRdb,BER,"linewidth",2,'color','green');


%cmd calculations
SNR=10;
BER=((1/2)*(1-sqrt(SNR./(SNR+2))));
fprintf("\nBER=%f",BER);