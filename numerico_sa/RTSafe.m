function sal = RTSafe(f, df, x1, x2, tol, N0)
    fx1 = f(x1);
    fx2 = f(x2);
   
    if fx1 * fx2 > 0
        fprintf('Error: La raíz no está contenida en el intervalo\n');
        return
    end
    if abs(fx1) < tol
        sal = x1;
        return
    elseif abs(fx2) < tol
        sal = x2;
        return
    end

    xl = x1;
    xh = x2;

    rts = (x1 + x2)/2;
    dx = abs(x2 - x1);

    i = 1;
    while i <= N0
        frts = f(rts);    
        dfrts = df(rts);     

        if abs(dfrts) <= tol || rts < xl || rts > xh
            dx = (xh - xl)/2;
            rts = xl + dx;
        else 
            dx = frts / dfrts;
            rts = rts - dx;
        end

        if abs(dx) < tol
            sal = rts;
            return
        end
        
        if f(rts) < 0
            xl = rts;
        else
            xh = rts;
        end

        i = i + 1;
    end

    fprintf('Method failed after %d iterations\n', N0);
end
