function I = Trapeciosn(Fun, a, b, n)
% Función que calcula la integral de una función dada en forma anónima.
% El algoritmo utilizado es el método compuesto de los trapecios.
% Input:
%   Fun = función anónima de la forma Fun = @(x).
%   a, b = límites de integración (a < b).
%   n = número de subintervalos empleado. 
% Output: 
%   I = Valor de la integral
    h = (b-a)/n;  % Ancho del intervalo
    xi = a+h; % x(2)
    sum_f = 0;
    % Se calcula el sumatorio de f(x(i)) con x(i) = x(2), ..., x(n)
    % Nota: Los extremos x(1) = a; x(n+1) = b no corresponden a este
    % sumatorio, por eso i = 2:n
    for i=2:n
       sum_f = sum_f + Fun(xi);
       xi = xi + h;
    end
    % Fórmula compuesta de los trapecios cuando los subintervalos son del
    % mismo tamaño
    I = h/2*(Fun(a)+Fun(b)) + h*sum_f;  
end