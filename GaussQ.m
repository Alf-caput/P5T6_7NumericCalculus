function I = GaussQ(fun, a, b, n)
% Función de Matlab que que calcula cualquier integral definida mediante la
% cuadratura de Gauss.
% INPUTS:
%   - fun es la función a integrar dada en forma anónima
%   - a y b son los limites de integración
%   - n es el número de pesos/ puntos de Gauss a emplear en el cálculo
    syms x;
    % Polinomio de legendre de gradp n
    p = legendreP(n, x);
    p = sym2poly(p);
    % Raices del polinomio de Legendre
    xn = roots(p);
    yn = fun(xn);
    for i = 1:n
        for j = 1:n
            if i~=j
                L(i) = L(i) * (x(i)-x(j))/(x(i)-x(j));
                M(i,:) = L(i);
            end
        end
    end

    % Me falta calcular cada Li con la funcion de lagrange
%     M = LagINT(xn);
%     % Calculamos los pesos de la cuadratura
%     w = zeros(n,1);
%     for i = 1:n
%         L = 0;
%         for j = 1:n 
%             L = L + M(i,j) * x^(j-1);
%         end
%         % Hago un cambio de variable para que a y b sean -1 1
%         x = ((b-a)/2) * u + (a+b)/2;
%         w(i) = int(L,u,1,-1);
%     end
%     
%     % Calculamos la aproximación de la integral
%     I = 0;
%     for i = 1:n
%         I = I + fun(nodes(i)) * w(i);
%     end
end
