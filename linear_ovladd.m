function output1=linear_ovladd(x,y,wlen,inc)
% �����ص���Ӻϳɷ�
% x��ԭʼ�ź�
% y���������ϳɵ�����֡
% wlen��֡��
% inc��֡��
N=length(x);
%�ѽ������תΪ������
if size(y,1)~=wlen
    Y=y';
else 
    Y=y;
end
framenum=size(Y,2);%֡��
overlap=wlen-inc;%�ص�����
tempr1=(0:overlap-1)'/(overlap-1);%б���Ǻ���w1
tempr2=(overlap-1:-1:0)'/(overlap-1);%б���Ǻ���w2
for i=1:framenum
    if i==1                           % ��Ϊ��1֡
        output=Y(:,i);            % ����Ҫ�ص����,�����ϳ�����
    else
        M=length(output);             % �����Ա����ص���Ӵ���ϳ�����
        output=[output(1:M-overlap); output(M-overlap+1:M).*tempr2+ Y(1:overlap,i).*tempr1; Y(overlap+1:wlen,i)];
    end
end
%����������볤�ȵȳ�
ol=length(output);                      
if ol<N
    output1=[output; zeros(N-ol,1)];
else
    output1=output(1:N);
end