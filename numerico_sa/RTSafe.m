function sal = RTSafe(f, df, x1, x2, tol, N0)
    fx1 = f(x1);
    fx2 = f(x2);

    % Graficamos la función para visualizar su comportamiento
    x = linspace(-2, 2, 500);
    y = f(x);
    plot(x, y);

    % Verificamos que haya un cambio de signo en el intervalo inicial
    if fx1 * fx2 > 0
        fprintf('Error: La raíz no está contenida en el intervalo\n');
        return
    end

    % Si ya estamos cerca de la raíz, retornamos directamente
    if abs(fx1) < tol
        sal = x1;
        return
    elseif abs(fx2) < tol
        sal = x2;
        return
    end

    % Definimos extremos del intervalo
    xl = x1;
    xh = x2;

    rts = (x1 + x2)/2;        % Empezamos desde el punto medio
    dx = abs(x2 - x1);        % Tamaño del intervalo

    i = 1;
    while i <= N0
        frts = f(rts);
        dfrts = df(rts);

        % Si la derivada es pequeña o rts está fuera del intervalo, usamos bisección
        if abs(dfrts) <= tol || rts < xl || rts > xh
            dx = (xh - xl)/2;
            rts = xl + dx;
        else 
            dx = frts / dfrts;
            rts = rts - dx;  % Paso tipo Newton-Raphson
        end

        if abs(dx) < tol
            sal = rts;
            return
        end

        % Ajustamos los extremos según el signo de la función en rts
        if f(rts) < 0
            xl = rts;
        else
            xh = rts;
        end

        i = i + 1;
    end

    fprintf('Method failed after %d iterations\n', N0);
end
