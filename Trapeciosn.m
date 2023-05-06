function I = Trapeciosn(Fun, a, b, n)
% Función que calcula la integración de una función anónima con el método
% compuesto de los trapecios 
% Input:
%   Fun = una función anónima de la forma Fun = @(x).
%   a, b = límites de integración (a < b).
%   n = número de subintervalos empleado. 
% Output: 
%   I = Valor de la integral
    h = (b-a)/n;  % Ancho del intervalo
    xi = a+h;
    sum_f = 0;
    for i=2:n
       sum_f = sum_f + Fun(xi);
       xi = xi + h;
    end
    % Fórmula compuesta de los trapecios cuando los subintervalos son del
    % mismo tamaño
    I = h/2*(Fun(a)+Fun(b)) + h*sum_f;  
end