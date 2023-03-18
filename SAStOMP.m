function [A]=SAStOMP(X,D,T,ts)
[~,N]=size(X);
[M,~]=size(D);
A=sparse(size(D,2),size(X,2));
TT=1.35;
a=0.2;
L=1;
for i=1:N
    signal=X(:,i);
    r_n=signal;
    Pos_theta=[];
        for ii=1:T  
            if ii==1 && Fuzzy_entropy_my(2,0.2*std(signal),signal)>TT
                theta_ls = 0;
                break;
            end   
            product = D'*r_n;
            sigma = norm(r_n)/sqrt(M);
            Js1 = find(abs(product)>ts*sigma);
            if ii==1 && (length(Js1) ==0 || (length(Js1) ==1 && Js1(1)==1))
                theta_ls = 0;
                break;
            end
            [~,pos]=sort(product,'descend');
            Js2=pos(1:L);
            Js3=union(Js1,Js2);
            Js4=union(Pos_theta,Js3);            
            if  length(Pos_theta) == length(Js4)  ||  length(Js1) ==0                
                Pos_theta=Js4;
                theta_ls=pinv(D(:,Pos_theta))*signal;
                [~,pos]=sort(abs(theta_ls),'descend');
                F=Js4(pos(1:(L)));
                theta_ls=pinv(D(:,F))*signal;
                Pos_theta=F;
                break;
            end 
            Pos_theta=Js4;
            theta_ls=pinv(D(:,Pos_theta))*signal;
            [~,pos]=sort(abs(theta_ls),'descend');
            F=Js4(pos(1:L));
            theta_ls=pinv(D(:,F))*signal;
            r_new=signal-D(:,F)*theta_ls;  
            fz2=Fuzzy_entropy_my(2,0.2*std(r_new),r_new);
            if fz2>TT+a
                Pos_theta=F;
                break;
            elseif norm(r_new)<=norm(r_n)        
                L = L+2;
                if ii == T
                    Pos_theta=F;                
                end
                Pos_theta=F;
                r_n = r_new; 
            end
        end
        if length(Pos_theta)>0
            A(Pos_theta,i)=theta_ls;
        end       
end
end