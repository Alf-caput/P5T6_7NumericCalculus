function [dfdx, d2fdx] = DerRichardson(f, x0, hin, N)
% Función que calcula la derivada primera y segunda de una función en un 
% punto.
% El algoritmo utilizado es el método de Richardson.
% Entradas:
%   f = función dada en forma anónima (f = @(x))
%   x0 = punto donde se calcula la derivada
%   hin = tamaño de paso inicial
%   N = orden de extrapolación
% Salidas:
%   dfdx = matriz de extrapolación para la 1ª derivada
%   d2fdx = matriz de extrapolación para la 2ª derivada

    % Se inicializan las matrices de extrapolación con ceros
    dfdx = zeros(N, N+1);
    d2fdx = zeros(N, N+1);
    
    % Se calculan las primeras columnas de las matrices de extrapolación
    for i = 1: N
        % Dimensión del intervalo (valores de paso)
        h = hin/2^(i-1);

        dfdx(i,1) = h;
        % diferencias centrales de dos puntos para la primera derivada
        dfdx(i,2) = (f(x0+h) - f(x0-h))/(2*h); % primeras extrapolaciones

        d2fdx(i,1) = h;
        % diferencias centrales de tres puntos para la segunda derivada
        d2fdx(i,2) = (f(x0-h) - 2*f(x0) + f(x0+h))/(h^2);% primeras extrapolaciones
    end
    
    % Se calculan las siguientes extrapolaciones
    for j = 3: N+1
        for i = j-1:N
            dfdx(i,j) = dfdx(i,j-1) + (dfdx(i,j-1) - dfdx(i-1,j-1))/(4^(j-2)-1);
            d2fdx(i,j) = d2fdx(i,j-1) + (d2fdx(i,j-1) - d2fdx(i-1,j-1))/(4^(j-2)-1);
        end
    end
end