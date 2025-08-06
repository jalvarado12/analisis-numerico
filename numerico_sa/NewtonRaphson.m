function p_new = NewtonRaphson(f, df, p0, tol, N0)
    i = 1;
    p = p0;
    while i <= N0
        p_new = p - (f(p)/df(p));
        if abs(p_new - p) < tol
            fprintf('Numero de iteraciones: %d', i);
            return
        end
        i = i +1;
        p = p_new;
    end
    fprintf('Method failed after %d iterations', N0);
end    