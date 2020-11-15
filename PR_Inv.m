function B = PR_Inv(A)
    % se calculeaza matricile R si Q astfel incat A = Q * R
    % utilizand Gram_Schmidt optimizat
    M = A;
    n = size(M);
    R = zeros(n);
    Q = zeros(n);

    % Gram Schmidt implementat conform schitei din laboratorul 3
    for j = 1:n
        R(j, j) = norm(M(:, j));
        Q(:, j) = M(:, j) / R(j, j);

        for i = j + 1:n
            R(j, i) = Q(:, j)' * M(:, i);
            M(:, i) = M(:, i) - Q(:, j) * R(j, i);
        endfor

    endfor

    a = size(A);
    In = eye(a);

    % se rezolva n sisteme de ecuatii superior triunghiulare
    %  se afla inversa matricii A, reprezentata de B
    for j = 1:a
        B(:, j) = SST(R, Q' * In(:, j));
    endfor

endfunction
