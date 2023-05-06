function I = Simpson38_anr(y, a, b, Er)
% función que utiliza el método compuesto de Simpson 3/8 para la integración de una función f(x) que está dada en forma anónima f = @(x).
% INPUTS:
%   y es la función a integrar dada en forma vectorizada y = @(x)
%   a b son los límites de integración
%   Er es el error permitido. Las iteraciones se detienen cuando el error relativo entre dos iteraciones sucesivas es menor que Er
% OUTPUT:
%   I es el valor de la integral

    % El método de 3/8 de Simpson puede utilizarse si se cumplen las dos condiciones siguientes:
        % - Los subintervalos están igualmente espaciados.
        % - El número de subintervalos dentro de [a,b] es divisible por 3
    % En la primera iteración el intervalo [a, b] se divide en tres subintervalos
    x = [a, (a+b)/3, 2*(a+b)/3, b];
    % Inicialización de variables
    sum1 = 0;
    sum2 = 0;
    er_rel = 1;
    y_a = y(a);
    y_b = y(b);
    I0 = 0;
    while er_rel > Er % El error relativo se calcula como la diferencia de los valores calculados entre 2 iteraciones.
        n = length(x);
        h = (b - a)/n;
        for i = 2:3:n-1
            sum1 = y(x(i)) + y(x(i+1)) + sum1;
        end
        for j = 4:3:n-2
            sum2 = y(x(j)) + sum2;
        end
        I = 3*h/8 * (y_a + 3*sum1 +2*sum2 + y_b);
        sum1 = 0;
        sum2 = 0;
        er_rel = I - I0;
        I0 = I;
        % En cada iteración el número de intervalos se duplica
        x = [x diff(x)/2+x(1:end-1)];
        x = sort(x);
    end
end