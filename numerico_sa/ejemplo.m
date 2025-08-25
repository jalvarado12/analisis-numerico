%Graficar una función y unos puntos en la misma grafica.

% Define la función
f = @(x) x.^2 - 5*x + 6;

% Define los puntos
x = [3.0, 4.5, 7.0, 9.0];
y = [2.5, 1.0, 2.5, 0.5];

% Crear un vector para la gráfica de la función
x_func = linspace(min(x)-1, max(x)+1, 1000);  % Rango un poco más amplio que los puntos
y_func = f(x_func);

% Graficar la función
plot(x_func, y_func, 'b-', 'LineWidth', 2)  % Línea azul

hold on  % Para superponer los puntos

% Graficar los puntos
plot(x, y, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r')  % Puntos rojos

% Opcional: etiquetas, rejilla, etc.
grid on
xlabel('x')
ylabel('y')
title('Función y puntos discretos')
legend('f(x)', 'Puntos (x,y)', 'Location', 'best')
hold off
