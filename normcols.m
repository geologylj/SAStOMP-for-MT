function y = normcols(x)
%NORMCOLS �����һ��
% Y = NORMCOLS��X����X���б�׼��Ϊ��λ���ȣ������������ΪY��
%  See also ADDTOCOLS.

%  Ron Rubinstein
%  Computer Science Department
%  Technion, Haifa 32000 Israel
%  ronrubin@cs
%
%  April 2009


y = x*spdiag(1./sqrt(sum(x.*x)));
