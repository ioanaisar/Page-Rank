function R = Algebraic(nume, d)
    % se deschide fisierul din care se vor citi datele
    % se citeste numarul de pagini
    fin = fopen(nume, 'r');
    N = fscanf(fin, '%f', 1);

    A = zeros(N, N);
    In = eye(N);
    one = ones(N, 1);
    L = zeros(N, 1);

    % se citeste fiecare nod si numarul de vecini
    % se memoreaza intr-un vector o linie din fisier
    % se construieste matricea de adiacenta utilizand vectorul
    for i = 1:N
        nr = fscanf(fin, '%f', 1);
        nr = fscanf(fin, '%f', 1);
        R2 = zeros(1, nr);
        R2 = fscanf(fin, '%f', nr);
        R2 = R2';
        [n m] = size(R2);

        for j = 1:m

            if i != R2(j)
                A(i, R2(j)) = 1;
            endif

        endfor

        %  se construieste vectorul ce contine numarul de vecini al fiecarei pagini
        L(i, 1) = nnz(A(i, :));
    endfor

    % valoarea constanta folosita la calcularea lui R
    const = ((1 - d) / N) * one;

    % se construieste M
    for i = 1:N
        M(i, :) = A(i, :) / L(i);
    endfor

    M = M';

    % se calculeaza inversa
    a = size(A);
    inverse = zeros(a);
    inverse = In - d * M;
    inverse = PR_Inv(inverse);

    % se calculeaza vectorul de pageRank-uri
    R = inverse * const;
    fclose(fin);

endfunction
