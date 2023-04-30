function I = GaussQ(fun, a, b, n)
% Función de Matlab que que calcula cualquier integral definida mediante la
% cuadratura de Gauss.
% INPUTS:
%    fun es la función a integrar dada en forma anónima
%    a y b son los limites de integración (a limite inferior, b limite
%    superior)
%    n es el número de pesos/ puntos de Gauss a emplear en el cálculo
% OUTPUT:
%    I es el valor aproximado de la integral calculada
    syms x;
    % Polinomio de legendre de gradp n
    p = legendreP(n, x);
    p = sym2poly(p);
    % Raices del polinomio de Legendre
    xn = roots(p);
    w = zeros(1, n);
    for i = 1:n
        L = 1;
        for j = 1:n
            if i~=j
                L = L * (x-xn(j))/(xn(i)-xn(j));
            end
        end
        w(i) = int(L, x, -1, 1);
    end
    I = (b-a)/2 * sum(w'.*fun((b-a)/2*xn+(a+b)/2));
end
