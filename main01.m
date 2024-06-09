clear variables;
close all;

%{
Project II\3: Extrapolation
Task:
    Connection between Verfahrensfehler and Rechenfehler during the
    approximation of the 1st deriviative
    
    Part1: (in progress)
    Compare the quality of De(h), Dz(h) and Dexcel(h) of several f(x)s for
    various h
    
%}

% Parameter
xs = linspace(-pi, pi, 10);
hs = linspace(100*eps, 2*pi, 20);

syms x;
f1 = symfun(sin(x), x);
df1 = symfun(cos(x), x);

[dfxs_sin, ers_sin] = De(f1, df1, xs, hs);
plotall(dfxs_sin, xs, hs, 'm', 'd/dx sin(x)', 'x', 'cos(x)', 'h = ');
plotall(ers_sin, hs, xs,'n', 'absolute error of d/dx sin(x)', 'h', 'abs. error', 'x = ');