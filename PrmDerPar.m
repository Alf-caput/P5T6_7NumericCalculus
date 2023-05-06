function [dfdx, dfdy] = PrmDerPar(x, y, f)
% Evalúa las primeras derivadas parciales df/dx y df/dy de una función f(x,y)
% dada por puntos tabulados discretos con igual espaciado
% INPUTS:
%   x, y =  vectores fila (o columna) con los valores de las variables 
%           independientes los cuales son valores equiespaciados y
%           ordenados de menor a mayor
%   f = matriz con el valor de f(x,y) en cada punto, correspondiendo 
%       columnas a valores de x y filas a valores de y
% OUTPUTS:
%   dfdx, dfdy = matrices con los valores de las derivadas parciales en 
%                cada punto de modo que la posición (i,j) de la matriz 
%                sea la derivada en el punto (x(j), y(i))
% Nota: Se tomará como espaciado la diferencia de los dos primeros valores 
% de x y los dos primeros valores de y. Por simplicidad se asume que los
% valores están equiespaciados y ordenados de menor a mayor, no realizando
% las comprobaciones pertinentes.

    % Tamaño de la matriz f
    [ny, nx] = size(f);

    % Espaciado entre valores
    hx = x(2) - x(1);
    hy = y(2) - y(1);
    
    % Se inicializan las matrices dfdx y dfdy con ceros
    dfdx = zeros(ny, nx);
    dfdy = zeros(ny, nx);

    % Se calcula df/dy usando diferencia central de dos puntos en puntos interiores
    for i = 2:ny-1
        for j = 1:nx
            dfdy(i,j) = (f(i+1,j) - f(i-1,j)) / (2*hy);
        end
    end

    % Se calcula df/dy usando diferencia hacia delante y hacia atrás de 3
    % puntos en el primer y último punto respectivamente
    for j = 1:nx

        dfdy(1,j) = (-3*f(1,j) + 4*f(2,j) - f(3,j)) / (2*hy);
        dfdy(ny,j) = (f(ny-2,j) - 4*f(ny-1,j) + 3*f(ny,j)) / (2*hy);
    end

    % Se calcula df/dx usando diferencia central de dos puntos en puntos interiores
    for i = 2:nx-1
        for j = 1:ny
            dfdx(i,j) = (f(i,j+1) - f(i,j-1)) / (2*hx);
        end
    end

    % Se calcula df/dx usando diferencia hacia delante y hacia atrás de 3
    % puntos en el primer y último punto respectivamente
    for i = 1:nx
        dfdx(i, 1) = (-3*f(i,1) + 4*f(i,2) - f(i,3)) / (2*hx);
        dfdx(i,nx) = (f(i,nx-2) - 4*f(i,nx-1) + 3*f(i,nx)) / (2*hy);
    end
end