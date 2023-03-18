%需要对信号进行分帧处理
function [xn_frams]=framing(xn,fram_time,fram_step_time)
%输入信号
%   xn:待分帧的信号
%   fs:采样率
%   fram_time:帧时长
%   fram_step_time:帧移动的步长
%输出信号
%   xn_frams:一个帧数为列，帧长度为行的矩阵，分帧结果
[row,col]=size(xn);
if row>col
    xn=xn';
end
%ts=1/fs;
l=length(xn);%序列的长度
%xn_time=1*ts;%序列的总时长
fram_length=ceil(fram_time);%每一帧的长度
fram_step_length=ceil(fram_step_time);%帧移步长
% if win=='hanning'
%     win=hanning(fram_length);
% elseif win=='hamming'
%     win=hamming(fram_length);
% end
%帧数的计算公式：（序列点数-帧长度+帧移动）/帧移
numofframs=(l-fram_length+fram_step_length)/fram_step_length;
%考虑到序列总长度和分帧结果不匹配，补零以满足分帧要求
numofframs=ceil(numofframs);
%为了满足分帧序列应该增加长度
l_added=(numofframs*fram_step_length-fram_step_length+fram_length);
l=l_added-l;
xn=[xn,zeros(1,l)];%补0
%xn_time=ceil(l*ts);
xn_frams=zeros(fram_length,numofframs);%建立一个存放结果的矩阵
%开始分帧
for k=1:numofframs
    dn=(k-1)*fram_step_length+(1:fram_length);
    xn_frams(:,k)=xn(dn);
end


