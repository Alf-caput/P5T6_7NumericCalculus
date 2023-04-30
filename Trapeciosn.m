function I = Trapeciosn(Fun,a,b,n)
% Función que calcula la integración de una función anónima con el método
% compuesto de los trapecios 
% Input:
%   Fun = una función anónima de la forma Fun = @(x).
%   a y b = límites de integración (a>b).
%   n = número de subintervalos empleado. 
% Output: 
%   I = Valor de la integral

h = (b-a)/n;  % Ancho del intervalo
x = a:h:b;  % Puntos en el eje x
y = Fun(x);  % Evalúa la función en los puntos del eje x
I = h/2*(y(1) + 2*sum(y(2:end-1)) + y(end));  % Fórmula compuesta de los trapecios
end