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
xs = 1;
hs = linspace(eps, 0.9*10^(-1), 30); %10^9*eps
disp('Parameter: ok');
% functions f(x)s
syms x;
f1 = symfun(sin(x), x);
f2 = symfun(log(x), x);
disp('f(x)s: ok');
% d/dx f(x)
df1 = symfun(cos(x), x);
df2 = symfun(1/x, x);
disp('d/dx f(x): ok');
%-----------------------------------------
% De, einseitige Differenzenquotient
%-----------------------------------------
%Values
[de_dfxs_f1, de_ers_f1] = De(f1, df1, xs, hs);
[de_dfxs_f2, de_ers_f2] = De(f2, df2, xs, hs);
disp('De-values: ok');
    
%-----------------------------------------
% Dz, zentrale Differenzenquotient
%-----------------------------------------
%Values
[dz_dfxs_f1, dz_ers_f1] = Dz(f1, df1, xs, hs);
[dz_dfxs_f2, dz_ers_f2] = Dz(f2, df2, xs, hs);
disp('Dz-values: ok');

%-----------------------------------------
% Dexcel, Linearkombination aus Dz
%-----------------------------------------
[dexcel_dfxs_f1, dexcel_ers_f1] = Dexcel(f1,df1, dz_dfxs_f1,xs,hs);
[dexcel_dfxs_f2, dexcel_ers_f2] = Dexcel(f2,df2, dz_dfxs_f2,xs,hs);
disp('Dexcel-values: ok');
    
%-----------------------------------------
%Plots
%-----------------------------------------
%Function1
    %function
    pstart = 1;
    pend = length(xs);
    plotall(de_dfxs_f1, xs, hs, 'm', pstart, pend-1, strcat("D_e: d/dx ", string(f1)), 'x', string(df1), strcat('d/dx ', string(f1), ', h = '), 'figures/de_dfx_f1.fig');
    plotall(dz_dfxs_f1, xs, hs, 'm', pstart, pend-1, strcat("D_z: d/dx ", string(f1)), 'x', string(df1), strcat('d/dx ', string(f1), ', h = '), 'figures/dz_dfx_f1.fig');
    plotall(dexcel_dfxs_f1, xs, hs, 'm', pstart, pend-1, strcat("D_{excel}: d/dx ", string(f1)), 'x', string(df1), strcat('d/dx ', string(f1), ', h = '), 'figures/dexcel_dfx_f1.fig');
    %error
    pstart = 3;
    pend = length(hs);
    plotall(de_ers_f1, hs, xs,'n', pstart, pend-1, strcat("D_e: Absoluter Fehler von ", string(f1)), 'h', 'Absoluter Fehler', 'x = ', 'figures/de_abserr_f1.fig');
    plotall(dz_ers_f1, hs, xs,'n', pstart, pend-1, strcat("D_z: Absoluter Fehler von ", string(f1)), 'h', 'Absoluter Fehler', 'x = ', 'figures/dz_abserr_f1.fig');
    plotall(dexcel_ers_f1, hs, xs,'n', pstart, pend-1, strcat("D_{excel}: Absoluter Fehler von ", string(f1)), 'h', 'Absoluter Fehler', 'x = ', 'figures/dexcel_abserr_f1.fig');
%Function2
    %function
    pstart = 1;
    pend = length(xs);
    plotall(de_dfxs_f2, xs, hs, 'm', pstart, pend-1, strcat("D_e: d/dx ", string(f2)), 'x', string(df2), strcat('d/dx ', string(f2), ', h = '), 'figures/de_dfx_f2.fig');
    plotall(dz_dfxs_f2, xs, hs, 'm', pstart, pend-1, strcat("D_z: d/dx ", string(f2)), 'x', string(df2), strcat('d/dx ', string(f2), ', h = '), 'figures/dz_dfx_f2.fig');
    plotall(dexcel_dfxs_f2, xs, hs, 'm', pstart, pend-1, strcat("D_z: d/dx ", string(f2)), 'x', string(df2), strcat('d/dx ', string(f2), ', h = '), 'figures/dexcel_dfx_f2.fig');
    %error
    pstart = 3;
    pend = length(hs);
    plotall(de_ers_f2, hs, xs,'n', pstart, pend-1,strcat("D_e: Absoluter Fehler von ", string(f2)), 'h', 'Absoluter Fehler', 'x = ', 'figures/de_abserr_f2.fig');
    plotall(dz_ers_f2, hs, xs,'n', pstart, pend-1, strcat("D_z: Absoluter Fehler von ", string(f2)), 'h', 'Absoluter Fehler', 'x = ', 'figures/dz_abserr_f2.fig');
    plotall(dexcel_ers_f2, hs, xs,'n', pstart, pend-1, strcat("D_{excel}: Absoluter Fehler von ", string(f2)), 'h', 'Absoluter Fehler', 'x = ', 'figures/dexcel_abserr_f2.fig');

    
combine_figs('figures/de_abserr_f1.fig', 'figures/dz_abserr_f1.fig', 'figures/dexcel_abserr_f1.fig', 'figures/combine_de_dz_abserr_f1.fig')
combine_figs2('figures/de_abserr_f2.fig', 'figures/dz_abserr_f2.fig', 'figures/dexcel_abserr_f2.fig', 'figures/combine_de_dz_abserr_f2.fig')