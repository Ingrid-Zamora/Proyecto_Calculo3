
clc;
clear;
close all;

% Funcion de densidad
rho = @(x,y) 1 + 3*x + y;

% Limites de la region triangular
ymin = @(x) 0.*x;
ymax = @(x) 2 - 2*x;

% Calculo de la masa
M = integral2(rho, 0, 1, ymin, ymax);

% Momentos respecto a los ejes
My = integral2(@(x,y) x.*rho(x,y), ...
    0, 1, ymin, ymax);

Mx = integral2(@(x,y) y.*rho(x,y), ...
    0, 1, ymin, ymax);

% Coordenadas del centro de masa
x_bar = My / M;
y_bar = Mx / M;

% Mostrar resultados
fprintf('Masa = %.6f\n', M);
fprintf('Centro de masa:\n');
fprintf('x = %.6f\n', x_bar);
fprintf('y = %.6f\n', y_bar);

% Graficar la lamina triangular
figure;
fill([0 1 0], [0 0 2], [0.6 0.85 1]);
hold on;
grid on;
axis equal;

% Marcar el centro de masa
plot(x_bar, y_bar, 'ro', ...
    'MarkerSize', 10, ...
    'MarkerFaceColor', 'r');

% Etiquetas
text(x_bar+0.03, y_bar, ...
    sprintf('(%.4f, %.4f)', x_bar, y_bar));

xlabel('Eje X');
ylabel('Eje Y');
title('Centro de masa de la lamina triangular');
legend('Lamina triangular', 'Centro de masa');

hold off;
