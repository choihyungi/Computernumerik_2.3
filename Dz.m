function [dfxs, ers] = Dz(f, df, xs, hs)
%{  
zentrale Differenzenquotient
Status: complete
Task: 
    return deriviative of a f(x) on a specific x with various h
Parameter:
    f       function f(x) with symbolic variable x
    df      deriviative of f(x) with symbolic variable x
    xs      array of x values 
    hs      array of h values
Returns:
    dfxs     2d array of approximated df/dx(x): j...xs, i...hs
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
            y1 = f(x-h);
            y2 = f(x+h);
            
            dfx = (y2-y1)/(2*h);
            er = dfx-exact;

            dfxs(hi,xi) = dfx;
            ers(hi,xi) = abs(er);
        end
    end
end