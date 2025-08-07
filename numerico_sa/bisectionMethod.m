function p = bisectionMethod(f, a, b, tol, N0)
   i = 1;
   FA = f(a);  % Evaluamos f en el extremo izquierdo del intervalo

   while i <= N0
       p = a + (b - a)/2;   % Calculamos el punto medio del intervalo
       FP = f(p);           % Evaluamos f en el punto medio

       % Si f(p) es cero o el tamaño del intervalo es menor que la tolerancia, terminamos
       if FP == 0 || (b - a)/2 < tol
           fprintf('Numero de iteraciones: %d\n', i);
           return
       end

       i = i + 1;  % Aumentamos el contador de iteraciones

       % Verificamos en qué subintervalo se mantiene el cambio de signo
       if FA * FP > 0
           a = p;
           FA = FP;
       else
           b = p;
       end
   end    

   % Si llegamos aquí, el método falló en encontrar la raíz con la precisión requerida
   fprintf('Method failed after %d iterations\n', N0);
end
