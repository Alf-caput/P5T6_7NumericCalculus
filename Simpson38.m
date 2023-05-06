function I = Simpson38(y, a, b, Er)
% Función que devuelve la integral de una función en un intervalo (a, b).
% El algoritmo utilizado es el Método compuesto de Simpson 3/8.
% INPUTS:
%   y = función a integrar dada en forma vectorizada y = @(x)
%   a, b = límites de integración
%   Er = error permitido
% OUTPUT:
%   I = valor de la integral
% El error se calculará como el valor absoluto de la diferencia relativa 
% entre iteraciones.
% Nota: para calcular el error relativo entre iteraciones se necesitan dos
% iteraciones, por tanto la integral devuelta es al menos la de la segunda
% iteración, esto es, dividir el intervalo en 6 subintervalos.
    
    % Inicialización de variables
    ya = y(a); yb = y(b);

    % En la primera iteración se divide en 3 subintervalos
    N = 3; % Número de subintervalos
    h = (b-a)/N; % Longitud de cada subintervalo
    I0 = 3/8*h * (ya + 3*(y(a+h) + y(a+2*h)) + yb);

    % En la segunda iteración se duplica el número de subintervalos (N = 6)
    N = 2*N;
    h = (b-a)/N;

    % sum1 = y(x2) + y(x3) + y(x5) + y(x6)
    sum1 = y(a+h) + y(a+2*h) + y(a+4*h) + y(a+5*h);
    % sum2 = y(x4)
    sum2 = y(a+3*h);

    % Finalmente se obtiene el valor de la integral
    I = 3*h/8*(ya+3*sum1+2*sum2+yb);

    % De manera general (cuando N es al menos 6 y divisible por 3)
    % sum1 y sum2 se pueden expresar como series
    % sum1 = Serie(y(xi) + y(xi+1))         (i = 2, 5, 8, ... N-1)
    % sum2 = Serie(y(xj))                   (j = 4, 7, 10, ... N-2)

    % Se ejecuta el algoritmo hasta que el error relativo entre iteraciones
    % es menor que el Error permitido
    while abs((I - I0) / I0) >= Er
        I0 = I;

        % Se duplica el número de subintervalos
        N = 2*N;
        h = (b-a)/N;

        % Se realiza el primer sumatorio
        % sum1 = Serie(y(xi) + y(xi+1))     (i = 2, 5, 8, ... N-1)
        xi = a+h; % x2
        sum1 = 0;
        for i = 2:3:N-1
            sum1 = sum1 + y(xi) + y(xi+h);
            xi = xi + 3*h;
        end

        % Se realiza el segundo sumatorio
        % sum2 = Serie(y(xj))               (j = 4, 7, 10, ... N-2)
        xj = a+3*h; % x4
        sum2 = 0;
        for j = 4:3:N-2
            sum2 = sum2 + y(xj);
            xj = xj + 3*h;
        end

        % Se obtiene el valor de la integral
        I = 3*h/8*(ya+3*sum1+2*sum2+yb);
    end
end