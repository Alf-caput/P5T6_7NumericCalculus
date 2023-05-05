function [dfdx, dfdy] = PrmDerPar(x, y, f)
% Obteniendo las dimensiones de la matriz f
    [m, n] = size(f);
    
    % Inicializando las matrices dfdx y dfdy con ceros
    dfdx = zeros(m, n);
    dfdy = zeros(m, n);
    
    % Calculando las derivadas parciales con la fórmula de diferencia central de dos puntos en los puntos interiores
    for i = 2:m-1
        for j = 2:n-1
            dfdx(i, j) = (f(i+1, j) - f(i-1, j)) / (x(i+1) - x(i-1))
            dfdy(i, j) = (f(i, j+1) - f(i, j-1)) / (y(j+1) - y(j-1))
        end
    end
    
    % Calculando las derivadas parciales con la fórmula de diferencia de tres puntos hacia delante y hacia atrás en los puntos extremos
    dfdx(1,:) = (-3*f(1,:) + 4*f(2,:) - f(3,:)) / (x(2) - x(1));
    dfdx(m,:) = (3*f(m,:) - 4*f(m-1,:) + f(m-2,:)) / (x(m) - x(m-1));
    dfdy(:,1) = (-3*f(:,1) + 4*f(:,2) - f(:,3)) / (y(2) - y(1));
    dfdy(:,n) = (3*f(:,n) - 4*f(:,n-1) + f(:,n-2)) / (y(n) - y(n-1));
end