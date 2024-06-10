function [dfxs, ers] = Dexcel(f, df, dz_dfxs, xs, hs)
%{  
Differenzenquotiens aus Linearkombination
Status: in progress
Task: 
    return deriviative of a f(x) on a specific x with various h
    using a linear kombination of De and Dz
Parameter:
    f           function f(x) with symbolic variable x
    df          deriviative of f(x) with symbolic variable x
    dz_dfxs     Dz values
    xs          array of x values 
    hs          array of h values
Returns:
    dfxs     2d array of approximated df/dx(x): j...xs, i...hs
    ers      2d array of absolute errors
%}
    xi_max = length(xs);
    hi_max = length(hs);
    dfxs = zeros(hi_max, xi_max);
    ers = zeros(hi_max, xi_max);

    for xi = 1 : xi_max
        x = xs(xi);
        exact = df(x);
        for hi = 1 : hi_max
            h = hs(hi);
            h2 = h/2;
            h3 = h/4;
            
            y21 = f(x-h2);
            y22 = f(x+h2);
            y31 = f(x-h3);
            y32 = f(x+h3);
            
            dfx1 = dz_dfxs(hi,xi);
            dfx2 = (y22-y21)/(2*h2);
            dfx3 = (y32-y31)/(2*h3);

            dfx = 1/45*(dfx1 - 20*dfx2 + 40*dfx3);
            er = dfx-exact;

            dfxs(hi,xi) = dfx;
            ers(hi,xi) = abs(er);
        end
    end
end