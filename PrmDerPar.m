function [dfdx, dfdy] = PrmDerPar(x, y, f)
% Evalúa las primeras derivadas parciales df/dx y df/dy de una función f(x,y)
% dada por puntos tabulados discretos con igual espaciado
% INPUTS:
%   x, y =  vectores fila (o columna) con los valores de las variables 
%           independientes los cuales son valores equiespaciados y
%           ordenados de menor a mayor
%   f = matriz con el valor de f(x,y) en cada punto, correspondiendo 
%       filas a valores de x y columnas a valores de y
% OUTPUTS:
%   dfdx, dfdy = matrices con los valores de las derivadas parciales en 
%                cada punto de modo que la posición (i,j) de la matriz 
%                sea la derivada parcial en el punto (x(i), y(j))
% Nota: Se tomará como espaciado la diferencia de los dos primeros valores 
% de x y los dos primeros valores de y. Por simplicidad se asume que los
% valores están equiespaciados y ordenados de menor a mayor, no realizando
% las comprobaciones pertinentes.

    % Tamaño de la matriz f
    [nx, ny] = size(f);

    % Espaciado entre valores
    hx = x(2) - x(1);
    hy = y(2) - y(1);
    
    
    % Se inicializan las matrices dfdx y dfdy con ceros
    dfdx = zeros(nx, ny);
    dfdy = zeros(nx, ny);

    % Se calcula df/dy usando diferencia central de dos puntos en puntos interiores
    for i = 2:nx-1
        for j = 1:ny
            dfdx(i,j) = (f(i+1,j) - f(i-1,j)) / (2*hx);
        end
    end

    % Se calcula df/dy usando diferencia hacia delante y hacia atrás de 3
    % puntos en el primer y último punto respectivamente
    for j = 1:ny
        dfdx(1,j) = (-3*f(1,j) + 4*f(2,j) - f(3,j)) / (2*hx);
        dfdx(nx,j) = (f(nx-2,j) - 4*f(nx-1,j) + 3*f(nx,j)) / (2*hx);
    end

    % Se calcula df/dx usando diferencia central de dos puntos en puntos interiores
    for j = 2:ny-1
        for i = 1:nx
            dfdy(i,j) = (f(i,j+1) - f(i,j-1)) / (2*hy);
        end
    end

    % Se calcula df/dx usando diferencia hacia delante y hacia atrás de 3
    % puntos en el primer y último punto respectivamente
    for i = 1:ny
        dfdy(i,1) = (-3*f(i,1) + 4*f(i,2) - f(i,3)) / (2*hy);
        dfdy(i,ny) = (f(i,ny-2) - 4*f(i,ny-1) + 3*f(i,ny)) / (2*hx);
    end
end