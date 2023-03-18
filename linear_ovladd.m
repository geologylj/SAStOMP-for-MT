function output1=linear_ovladd(x,y,wlen,inc)
% 线性重叠相加合成法
% x：原始信号
% y：处理后待合成的数据帧
% wlen：帧长
% inc：帧移
N=length(x);
%把结果向量转为列向量
if size(y,1)~=wlen
    Y=y';
else 
    Y=y;
end
framenum=size(Y,2);%帧数
overlap=wlen-inc;%重叠长度
tempr1=(0:overlap-1)'/(overlap-1);%斜三角函数w1
tempr2=(overlap-1:-1:0)'/(overlap-1);%斜三角函数w2
for i=1:framenum
    if i==1                           % 若为第1帧
        output=Y(:,i);            % 不需要重叠相加,保留合成数据
    else
        M=length(output);             % 按线性比例重叠相加处理合成数据
        output=[output(1:M-overlap); output(M-overlap+1:M).*tempr2+ Y(1:overlap,i).*tempr1; Y(overlap+1:wlen,i)];
    end
end
%把输出与输入长度等长
ol=length(output);                      
if ol<N
    output1=[output; zeros(N-ol,1)];
else
    output1=output(1:N);
end