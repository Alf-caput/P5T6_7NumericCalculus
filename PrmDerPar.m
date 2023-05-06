function [dfdx, dfdy] = PrmDerPar(x, y, f)
% Evalúa las primeras derivadas parciales df/dx y df/dy de una función f(x,y)
% dada por puntos tabulados discretos con igual espaciado
% INPUTS:
%   x, y =  vectores fila (o columna) con los valores de las variables 
%           independientes los cuales son valores equiespaciados y
%           ordenados de menor a mayor
%   f = matriz con el valor de f(x,y) en cada punto.
% OUTPUTS:
%   dfdx, dfdy = matrices con los valores de las derivadas parciales en 
%                cada punto de modo que la posición (i,j) de la matriz 
%                sea la derivada en el punto (x(i), y(j))
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
            dfdy(i,j) = (f(i+1,j) - f(i-1,j)) / (2*hx);
        end
    end

    for j = 1:ny
        % Se calcula df/dy usando diferencia hacia delante y hacia atrás de
        % 3 puntos en el primer y último punto respectivamente
        dfdy(1,j) = (f(2,j) - f(1,j)) / hx;
        dfdy(nx,j) = (f(nx,j) - f(nx-1,j)) / hx;
    end

    % Se calcula df/dx usando diferencia central de dos puntos en puntos interiores
    for i = 1:nx
        for j = 2:ny-1
            dfdx(i,j) = (f(i,j+1) - f(i,j-1)) / (2*hy);
        end
    end

    for i = 1:nx
        % Se calcula df/dx usando diferencia hacia delante y hacia atrás de
        % 3 puntos en el primer y último punto respectivamente
        dfdx(i,1) = (f(i,2) - f(i,1)) / hy;
        dfdx(i,ny) = (f(i,ny) - f(i,ny-1)) / hy;
    end
end