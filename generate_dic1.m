function [D1,D2,D3]=generate_dic(N)
fs=4;
f_min=1270;                  
f_max=1270;                 
zeta_min=0.18;              
zeta_max=0.183;            
W_step=1;
t=1:N;                  
rows=length(t);     
A1=1;                   
D1=[];
support_len=10;  
l1=0;
for Wss=0:W_step:N-1
    l1=l1+1;
    l2=0;
   for  zeta0=zeta_min:.01:zeta_max     
       l2=l2+1;
       l3=0;
       for f0=f_min:f_max 
          l3=l3+1;
          sig1=exp(-(zeta0/sqrt(1-zeta0^2))*2*pi*f0*(t/fs)).*sin(2*pi*f0*(t/fs));
          for k=1:N
               if k <= Wss || k >= Wss+support_len
                   sig2(k) = 0;
               else
                   sig2(k) = sig1(k-Wss);
               end
          end
          atom=sig2;
          D1=[D1 atom'];
       end
   end
end
cols=l1*l2*l3;         

for r=0:1:N-1
    V=D1(:,r+1);
    D1(:,r+1)=V/norm(V);
end

D2=D1;
for i=1:1:N
    for j=1:1:N
        if D2(i,j)==1
            break
        else
            D2(j,i)=1;
        end
    end
end
% D1= normcols(D1);,'coif3',{'sym4',1}
D2=D2(:,1:N/2);
D2= normcols(D2);
dict={{'sym4',4},'coif3','dct'};
[D3,nbvect] = wmpdictionary(N,'LstCpt',dict);
D3=D3(:,1:(nbvect(1)+nbvect(2)+5));
D3=full(D3);

end
