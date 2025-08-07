function p_new = NewtonRaphson(f, df, p0, tol, N0)
    i = 1;
    p = p0;

    while i <= N0
        % Aplicamos la fórmula de Newton-Raphson
        p_new = p - (f(p)/df(p));

        % Si la diferencia entre iteraciones es menor que la tolerancia, paramos
        if abs(p_new - p) < tol
            fprintf('Numero de iteraciones: %d\n', i);
            return
        end

        i = i + 1;
        p = p_new;  % Actualizamos p para la siguiente iteración
    end

    fprintf('Method failed after %d iterations\n', N0);
end
