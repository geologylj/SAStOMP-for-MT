%��Ҫ���źŽ��з�֡����
function [xn_frams]=framing(xn,fram_time,fram_step_time)
%�����ź�
%   xn:����֡���ź�
%   fs:������
%   fram_time:֡ʱ��
%   fram_step_time:֡�ƶ��Ĳ���
%����ź�
%   xn_frams:һ��֡��Ϊ�У�֡����Ϊ�еľ��󣬷�֡���
[row,col]=size(xn);
if row>col
    xn=xn';
end
%ts=1/fs;
l=length(xn);%���еĳ���
%xn_time=1*ts;%���е���ʱ��
fram_length=ceil(fram_time);%ÿһ֡�ĳ���
fram_step_length=ceil(fram_step_time);%֡�Ʋ���
% if win=='hanning'
%     win=hanning(fram_length);
% elseif win=='hamming'
%     win=hamming(fram_length);
% end
%֡���ļ��㹫ʽ�������е���-֡����+֡�ƶ���/֡��
numofframs=(l-fram_length+fram_step_length)/fram_step_length;
%���ǵ������ܳ��Ⱥͷ�֡�����ƥ�䣬�����������֡Ҫ��
numofframs=ceil(numofframs);
%Ϊ�������֡����Ӧ�����ӳ���
l_added=(numofframs*fram_step_length-fram_step_length+fram_length);
l=l_added-l;
xn=[xn,zeros(1,l)];%��0
%xn_time=ceil(l*ts);
xn_frams=zeros(fram_length,numofframs);%����һ����Ž���ľ���
%��ʼ��֡
for k=1:numofframs
    dn=(k-1)*fram_step_length+(1:fram_length);
    xn_frams(:,k)=xn(dn);
end


