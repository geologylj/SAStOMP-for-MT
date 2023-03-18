function y = normcols(x)
%NORMCOLS 矩阵归一化
% Y = NORMCOLS（X）将X的列标准化为单位长度，并将结果返回为Y。
%  See also ADDTOCOLS.

%  Ron Rubinstein
%  Computer Science Department
%  Technion, Haifa 32000 Israel
%  ronrubin@cs
%
%  April 2009


y = x*spdiag(1./sqrt(sum(x.*x)));
