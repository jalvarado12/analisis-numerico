function p = Neville(x,xa,ya,n)
    % Función Neville:
    % Calcula el valor interpolado en 'x' usando el método de interpolación de Neville.
    % Entradas:
    %   x  -> punto donde se quiere evaluar el polinomio
    %   xa -> vector de nodos (puntos conocidos en el eje x)
    %   ya -> vector de valores f(xa) correspondientes a cada nodo
    %   n  -> número de nodos (debe ser igual a length(xa) y length(ya))
    % Salida:
    %   p  -> valor interpolado en 'x'
    
    % Asegurar que xa y ya sean vectores columna
    xa = xa(:);
    ya = ya(:);

    % Inicializar matriz P de tamaño n x n con ceros.
    % P(i, m) representará el valor interpolado usando
    % los nodos desde i hasta i+m-1.
    P = zeros(n, n);

    % Primera columna de P: valores conocidos de f(x) en los nodos
    P(:,1) = ya;

    % Bucle sobre el orden de interpolación (m = 2,...,n)
    for m = 2:n
        % Bucle sobre la posición inicial del subintervalo
        for i = 1:(n-m+1)
            % Fórmula recursiva de Neville:
            % P(i,m) se calcula a partir de los valores de la columna anterior
            % combinando P(i, m-1) y P(i+1, m-1)
            P(i,m) = ((x - xa(i+m-1)) * P(i, m-1) ...
                    - (x - xa(i))     * P(i+1, m-1)) ...
                    / (xa(i) - xa(i+m-1));
        end
    end

    % El valor interpolado final está en la esquina superior derecha
    p = P(1,n);

    return
end
