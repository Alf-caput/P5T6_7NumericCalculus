function [dfdx, dfdy] = PrmDerPar(x, y, f)
% Evalúa las primeras derivadas parciales df/dx y df/dy de una función f(x,y)
% dada por puntos tabulados discretos con igual espaciado
% INPUTS:
%   x, y =  vectores con los valores de las variables independientes
%   f = matriz con el valor de f(x,y) en cada punto.
% OUTPUTS:
%   dfdx, dfdy = matrices con los valores de las derivadas parciales 
%   en cada punto de modo que la posición (i,j) de la matriz de resultados 
%   sea la derivada en el punto que corresponde a x(i), y(j)
    
    % Obtener el tamaño de la matriz f
    [nx, ny] = size(f);

    % Inicializar matrices dfdx y dfdy con ceros
    dfdx = zeros(nx, ny);
    dfdy = zeros(nx, ny);

    % Calcular df/dy usando diferencia central de dos puntos en puntos interiores
    for i = 2:nx-1
        for j = 1:ny
            dfdy(i,j) = (f(i+1,j) - f(i-1,j)) / (2*(x(i+1)-x(i)));
        end
    end

    % Calcular df/dy usando diferencia hacia delante en el primer punto
    for j = 1:ny
        dfdy(1,j) = (f(2,j) - f(1,j)) / (x(2)-x(1));
    end

    % Calcular df/dy usando diferencia hacia atrás en el último punto
    for j = 1:ny
        dfdy(nx,j) = (f(nx,j) - f(nx-1,j)) / (x(nx)-x(nx-1));
    end

    % Calcular df/dx usando diferencia central de dos puntos en puntos interiores
    for i = 1:nx
        for j = 2:ny-1
            dfdx(i,j) = (f(i,j+1) - f(i,j-1)) / (2*(y(j+1)-y(j)));
        end
    end

    % Calcular df/dx usando diferencia hacia delante en el primer punto
    for i = 1:nx
        dfdx(i,1) = (f(i,2) - f(i,1)) / (y(2)-y(1));
    end

    % Calcular df/dx usando diferencia hacia atrás en el último punto
    for i = 1:nx
        dfdx(i,ny) = (f(i,ny) - f(i,ny-1)) / (y(ny)-y(ny-1));
    end
end