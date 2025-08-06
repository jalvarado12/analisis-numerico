function p = secante(f, p0, p1, tol, N0)
    i = 2;
    q0 = f(p0);
    q1 = f(p1);
    while i<= N0
        p = p1 - q1 * ((p1 - p0)/(q1 - q0));
        if abs(p - p1) < tol
            fprintf('Se encontro solución despues de %d iteraciones', i);
            return 
        end 
        i = i +1;
        p0 = q1;
        q0 = q1;
        p1 = p;
        q1 = f(p);
    end
    fprintf('El metodo fallo despues de %d iteraciones', i);
end
