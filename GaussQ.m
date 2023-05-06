function I = GaussQ(fun, a, b, n)
% Función que calcula la integral de una función dada en forma anónima. El 
% algoritmo utilizado es el método de integración por cuadratura de Gauss.
% INPUTS:
%    fun = función a integrar dada en forma anónima @(x)
%    a, b = límites de integración(a limite inferior, b limite
%           superior)
%    n = nº de puntos/pesos a emplear en el cálculo
% OUTPUT:
%    I es el valor aproximado de la integral calculada
    syms x;
    % Polinomio de legendre de gradp n
    p = legendreP(n, x);
    p = sym2poly(p);
    % Raices del polinomio de Legendre
    xn = roots(p);
    w = zeros(n, 1);
    for i = 1:n
        L = 1;
        for j = 1:n
            if i~=j
                L = L * (x-xn(j))/(xn(i)-xn(j));
            end
        end
        w(i) = int(L, x, -1, 1);
    end
    I = (b-a)/2 * sum(w.*fun((b-a)/2*xn+(a+b)/2));
end
