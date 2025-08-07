function p = secante(f, p0, p1, tol, N0)
    i = 2;
    q0 = f(p0);
    q1 = f(p1);

    while i <= N0
        p = p1 - q1 * ((p1 - p0)/(q1 - q0));  % Fórmula de la secante

        if abs(p - p1) < tol
            fprintf('Número de iteraciones: %d\n', i);
            return 
        end 

        % Actualizamos valores para la siguiente iteración
        i = i + 1;
        p0 = p1;
        q0 = q1;
        p1 = p;
        q1 = f(p);
    end

    fprintf('El método falló después de %d iteraciones\n', i);
end
