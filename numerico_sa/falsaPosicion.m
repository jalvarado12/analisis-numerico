function p = FalsaPosicion(f, p0, p1, TOL, N0)
    i = 2;
    q0 = f(p0);
    q1 = f(p1);

    while i <= N0
        % Fórmula igual a la secante, pero con control de cambio de signo
        p = p1 - q1 * (p1 - p0) / (q1 - q0);

        % Calculamos el error relativo si es posible
        if p ~= 0
            Er = abs((p - p1) / p);
        else
            Er = abs(p - p1);
        end

        % Verificamos la convergencia
        if abs(p - p1) < TOL || Er < TOL
            fprintf('El procedimiento fue exitoso después de %d iteraciones.\n', i-1);
            return
        end

        i = i + 1;

        q = f(p);

        % Actualizamos el intervalo manteniendo el cambio de signo
        if q * q1 < 0
            p0 = p1;
            q0 = q1;
        end

        p1 = p;
        q1 = q;
    end

    error('El método falló después de %d iteraciones, N0 = %d.\n', N0, N0);
end
