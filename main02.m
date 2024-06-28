clear variables;
close all;

%{
Testing return_dfvalue function
%}

% Functions
syms x;
f1 = symfun(sin(x)/x, x);
f2 = symfun(exp(x), x);

[df1x, er_f1] = return_dfvalue(f1, 13, 1e-17);