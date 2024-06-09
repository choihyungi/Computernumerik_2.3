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
hs = linspace(0, 4*pi, 150);
disp('Parameter: ok');
% functions f(x)s
syms x;
f1 = symfun(sin(x), x);
f2 = symfun(exp(x), x);
disp('f(x)s: ok');
% d/dx f(x)
df1 = symfun(cos(x), x);
df2 = symfun(exp(x), x);
disp('d/dx f(x): ok');
%-----------------------------------------
% De, einseitige Differenzenquotient
%-----------------------------------------
%Values
[de_dfxs_f1, de_ers_f1] = De(f1, df1, xs, hs);
[de_dfxs_f2, de_ers_f2] = De(f2, df2, xs, hs);
disp('De-values: ok');
%Plots
    % Function
    %plotall(de_dfxs_f1, xs, hs, 'm', strcat('De: d/dx ', string(f1)), 'x', string(df1), strcat('d/dx ', string(f1), ', h = '), 'figures/de_dfx_f1.fig');
    %plotall(de_dfxs_f2, xs, hs, 'm', strcat('De: d/dx ', string(f2)), 'x', string(df2), strcat('d/dx ', string(f2), ', h = '), 'figures/de_dfx_f2.fig');
    % Errors
    plotall(de_ers_f1, hs, xs,'n', strcat('De: abs error of ', string(f1)), 'h', 'abs. error', 'x = ', 'figures/de_abserr_f1.fig');
    plotall(de_ers_f2, hs, xs,'n', strcat('De: abs error of ', string(f2)), 'h', 'abs. error', 'x = ', 'figures/de_abserr_f2.fig');
disp('De-plots: ok');
    % Combine
    %combineplots('figures/dfx_sin.fig', 'figures/dfx_exp.fig', 'figures/dfxcombined', -1, 1, 'd/dx of sin(x)&cos(x)', 'x', 'cos(x); sin(x)');
%-----------------------------------------
% Dz, zentrale Differenzenquotient
%-----------------------------------------
%Values
[dz_dfxs_f1, dz_ers_f1] = Dz(f1, df1, xs, hs);
[dz_dfxs_f2, dz_ers_f2] = Dz(f2, df2, xs, hs);
disp('Dz-values: ok');
%Plots
    % Function
    %plotall(dz_dfxs_f1, xs, hs, 'm', strcat('Dz: d/dx ', string(f1)), 'x', string(df1), strcat('d/dx ', string(f1), ', h = '), 'figures/dz_dfx_f1.fig');
    %plotall(dz_dfxs_f2, xs, hs, 'm', strcat('Dz: d/dx ', string(f2)), 'x', string(df2), strcat('d/dx ', string(f2), ', h = '), 'figures/dz_dfx_f2.fig');
    % Errors
    plotall(dz_ers_f1, hs, xs,'n', strcat('Dz: abs error of ', string(f1)), 'h', 'abs. error', 'x = ', 'figures/dz_abserr_f1.fig');
    plotall(dz_ers_f2, hs, xs,'n', strcat('Dz: abs error of ', string(f2)), 'h', 'abs. error', 'x = ', 'figures/dz_abserr_f2.fig');
disp('Dz-values: ok');