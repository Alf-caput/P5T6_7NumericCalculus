function Yint = LagINT(x,y,Xint)
% Función que evalua en un punto el polinomio interpolador de Lagrange para
% un conjunto de puntos.
% El algoritmo utilizado es el polinomio interpolador de Lagrange.
% Inputs:
%   x = vector fila de coordenadas x de los puntos de datos
%   y = vector fila de coordenadas y de los puntos de datos
%   Xint = coordenada x del punto a interpolar
% Outputs:
%   Yint = valor interpolado en el punto Xint
    % Inicialización de variables
    n = length(x); 
    L = ones(n, 1); 
    Yint = 0;
    % Se calculan las funciones de Lagrange evaluadas en Xint
    for i = 1:n
        for j = 1:n
            if i~=j
                L(i) = L(i) * (Xint-x(j))/(x(i)-x(j));
            end
        end
    end
    % Realizando el sumatorio de yi*Li con Li evaluadas en Xint se obtiene 
    % el valor interpolado de y en Xint
    for i = 1:n
        Yint = Yint + y(i)*L(i);
    end
end 