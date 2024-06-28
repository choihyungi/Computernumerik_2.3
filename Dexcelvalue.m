function dfx = Dexcelvalue(f, x, h)
%{
Differenzenquotiens aus Linearkombination
Status: complete
Task: 
    return deriviative of a f(x) on a specific x with specific h
    using a linear kombination of Dz
Parameter:
    f           function f(x) with symbolic variable x
    x           x value
    h           h values
Returns:
    dfx         value of approximated df/dx(x)
%}
    h1 = h;
    h2 = h/2;
    h3 = h/4;
    
    y11 = f(x-h1);
    y12 = f(x+h1);
    y21 = f(x-h2);
    y22 = f(x+h2);
    y31 = f(x-h3);
    y32 = f(x+h3);
    
    dfx1 = (y12-y11)/(2*h1);
    dfx2 = (y22-y21)/(2*h2);
    dfx3 = (y32-y31)/(2*h3);

    dfx = 1/45*(dfx1 - 20*dfx2 + 64*dfx3);
end