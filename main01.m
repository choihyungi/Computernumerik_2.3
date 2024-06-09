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
hs = linspace(100*eps, 2*pi, 10);
syms x;

% functions f(x)s
f1 = symfun(sin(x), x);
f2 = symfun(cos(x), x);

% d/dx f(x)
df1 = symfun(cos(x), x);
df2 = symfun(sin(x), x);

%-----------------------------------------
% De
%-----------------------------------------
%Values
[dfxs_sin, ers_sin] = De(f1, df1, xs, hs);
[dfxs_exp, ers_exp] = De(f2, df2, xs, hs);
%Plots
    % Function
    plotall(dfxs_sin, xs, hs, 'm', 'd/dx sin(x)', 'x', 'cos(x)', 'd/dx sin(x), h = ', 'figures/dfx_sin.fig');
    plotall(dfxs_exp, xs, hs, 'm', 'd/dx exp(x)', 'x', 'exp(x)', 'd/dx cos(x), h = ', 'figures/dfx_exp.fig');
    % Errors
    plotall(ers_sin, hs, xs,'n', 'absolute error of d/dx sin(x)', 'h', 'abs. error', 'x = ', 'figures/tol_sin.fig');
    plotall(ers_exp, hs, xs,'n', 'absolute error of d/dx exp(x)', 'h', 'abs. error', 'x = ', 'figures/tol_exp.fig');
    
    combineplots('figures/dfx_sin.fig', 'figures/dfx_exp.fig', 'figures/dfxcombined', -1, 1, 'd/dx of sin(x)&cos(x)', 'x', 'cos(x); sin(x)');