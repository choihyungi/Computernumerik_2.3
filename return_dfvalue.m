function [dfx_fin, er_fin] = return_dfvalue(f, x, tol)
%{  
Wert der ersten Differenz auf x
Status: complete
Task: 
    return value of df/dx(x)
Parameter:
    f       function f(x) with symbolic variable x
    x       x values 
    tol     tolerance of absolute err
Returns:
    dfx_fin value of df/dx(x)
    er_fin  absolute error to exact value
%}

    df = diff(f,x);
    dfx_exact = df(x);

    h = 1;
    delta = h/10;
    dfx = Dexcelvalue(f, x, h);
    er = abs(dfx - dfx_exact);
    er_old = er;
    
    count = 0;
    count_turn = 0;
    while true
        h = h - delta;
        dfx = Dexcelvalue(f, x, h);
        er = abs(dfx - dfx_exact);

        if er < tol
            dfx_fin = double(dfx);
            er_fin = double(er);
            disp(strcat('Value of df/dx of ', string(f), ' at x= ', string(x), ': ', string(dfx_fin)))
            disp(strcat('Error of df/dx of ', string(f), ' at x= ', string(x), ': ', string(er_fin)))
            break;
        end

        if abs(er-er_old) == 0
            disp(strcat('Error: ', string(f), 'tolerance not approachable'))
            return;
        end

        if er < er_old
            er_old = er;
        elseif er > er_old
            delta = - delta/10;
            er_old = er;
            count_turn = count_turn +1;
        end
        count = count + 1;
    end
end