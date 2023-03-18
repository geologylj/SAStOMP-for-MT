function [apen] = Fuzzy_entropy_my(n,r,a)
%% Code for computing approximate entropy for a time series: Approximate
% Entropy is a measure of complexity. It quantifies the unpredictability of
% fluctuations in a time series

% To run this function- type: approx_entropy('window length','similarity measure','data set')

% i.e  approx_entropy(5,0.5,a)

% window length= length of the window, which should be considered in each iteration
% similarity measure = measure of distance between the elements
% data set = data vector

% small values of apen (approx entropy) means data is predictable, whereas
% higher values mean that data is unpredictable

% concept boorowed from http://www.physionet.org/physiotools/ApEn/

% Author: Avinash Parnandi, parnandi@usc.edu, http://robotics.usc.edu/~parnandi/
%%用相关系数来度量r
data =a;
N=length(data);
% for m=n:n+1; % run it twice, with window size differing by 1



for i=1:N-n
    u=sum(i:i+n-1)/n;
    Xm(i,:)=data(i:i+n-1)-u;
     u=sum(i:i+n)/(n+1);
    Xm1(i,:)=data(i:i+n)-u;
end
correlation(1)=ccount(N,n,Xm,r);
correlation(2)=ccount(N,n+1,Xm1,r);
% % apen = correlation(1)-correlation(2);
apen = log(correlation(1)/correlation(2));
end
function correlation = ccount(N,n,Xm,r)
set = 0;
count = 0;
counter = 0;
N=N;
n=n;
Xm=Xm;
r=r;
    for i=1:N-n
        current_window =Xm(i,:); 
        for j=1:N-n
            sliding_window =Xm(j,:);
           if (i~=j)            
              th=max(abs(current_window-sliding_window));    
              dd(j)=exp(-(th/r)^2);
          end %j=1:N-n
           
       end% i=1:N-n
           counter(i)=sum(dd)/(N-n-1); % we need the number of similar windows for every cuurent_window
    end
        correlation = ((sum(counter))/(N-n));
end