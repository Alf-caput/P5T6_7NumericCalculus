function IR = Romberg(f, a, b, Ni, Niveles)
% Función que calcula la integral de una función dada en forma analítica.
% El algoritmo utilizado es el Método de Romberg, junto al método compuesto
% de los trapecios.
% Input:
%   f = función anónima de la forma f=@(x)
%   a, b = límites de integración (a < b)
%   Ni = número inicial de subintervalos
%   Niveles = número de niveles de integración
% Output:
%   IR = matriz con los distintos valores estimados de la integral.
% Nota: se emplea la función Trapeciosn(Fun,a,b,n).

    % Inicialización de la matriz IR
    IR = zeros(Niveles);
    
    % Cálculo de los valores iniciales de la matriz IR con el método de los trapecios
    for j = 1:Ni
        IR(j,1) = Trapeciosn(f,a,b,j);
    end
    
    % Cálculo de los valores restantes de la matriz IR con el método de Romberg
    for k = 2:Niveles
        for j = k:Ni
            IR(j,k) = (4^(k-1)*IR(j,k-1) - IR(j-1,k-1))/(4^(k-1) - 1);
        end
    end
end