function [x] = SST(A, b)
    [n, m] = size(A);
    mini = min(m, n);
    x = zeros(size(b));

    % rezolvarea unui sistem superior triunghiular
    % implementat conform schitei din laboratorul 2
    for i = m:-1:1
        x(i) = (b(i) - (A(i, i + 1:m) * x(i + 1:m))) / A(i, i);
    endfor

    x = x(1:mini);
endfunction
