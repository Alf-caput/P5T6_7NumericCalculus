function [dfdx, dfdy] = PrmDerPar(x, y, f)
% función que evalúa las primeras derivadas parciales df/dx, df/dy de una
% función f(x,y) dada por puntos tabulados discretos con igual espaciado.
% Se utiliza las fórmulas de diferencia central de dos puntos en los puntos 
% interiores y fórmulas de diferencia de tres puntos hacia delante y hacia 
% atrás en los puntos extremos.
% INPUTS:
%   x, y =  vectores con los valores de las variables independientes
%   f = matriz con el valor de f(x,y) en cada punto.
% OUTPUTS:
%   dfdx, dfdy = matrices con los valores de las derivadas parciales 
%   en cada punto de modo que la posición (i,j) de la matriz de resultados 
%   sea la derivada en el punto que corresponde a x(i), y(j)
    % Dimensiones de la matriz f
    [m, n] = size(f);
    
    % Inicialización de variables
    dfdx = zeros(m, n);
    dfdy = zeros(m, n);
    
    % Cálculo de las derivadas parciales con la fórmula de diferencia central de dos puntos en los puntos interiores
    for i = 2:m-1
        for j = 2:n-1
            dfdx(i, j) = (f(i+1, j) - f(i-1, j)) / (x(i+1) - x(i-1));
            dfdy(i, j) = (f(i, j+1) - f(i, j-1)) / (y(j+1) - y(j-1));
        end
    end
    % Puntos extremos:
    % Cálculo de las derivadas parciales con la fórmula de diferencia de tres puntos hacia delante 
    dfdx(1,:) = (-3*f(1,:) + 4*f(2,:) - f(3,:)) / (x(2) - x(1));
    dfdy(:,1) = (-3*f(:,1) + 4*f(:,2) - f(:,3)) / (y(2) - y(1));
    % Cálculo de las derivadas parciales con la formula de diferencia de tres puntos hacia atrás
    dfdx(m,:) = (f(m-2,:) - 4*f(m-1,:) + 3*f(m,:)) / (2*(x(m) - x(m-1)));    
    dfdy(:,n) = (f(:,n-2) - 4*f(:,n-1) + 3*f(:,n)) / (2*(y(n) - y(n-1)));
end