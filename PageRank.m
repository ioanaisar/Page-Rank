function [R1 R2] = PageRank(nume, d, eps)
    % se formeaza numele fisierului de iesire din numele fisierului
    % de intrare la care concatenez '.out'
    file = nume;
    nume = strcat(nume, '.out');
    fout = fopen(nume, 'wt');

    % se citeste numarul de pagini si se afiseaza
    fin = fopen(file, 'r');
    N = fscanf(fin, '%f', 1);

    fprintf(fout, '%.f\n', N);

    % se calculeaza si se afiseaza indicii PageRank pentru cerintele 1 si 2
    R = Iterative(file, d, eps);
    R = R';
    fprintf(fout, '%f\n', R);
    fprintf(fout, '\n');

    PR = Algebraic(file, d);
    fprintf(fout, '%f\n', PR);
    fprintf(fout, '\n');

    % se sorteaza cu functia sort vectorul PR, interschimband si indicii
    % corespunzatori fiecarui graf obtinut din functia Algebraic
    n = size(PR);
    v = [1:n];
    [PR v] = sort(PR, 'descend');

    % se citesc cele 2 capete de interval date functiei Apartenenta
    % pozitionandu-se cursorul la finalul fisierului de intrare
    fseek(fin, -13, 'eof');
    val1 = fscanf(fin, '%f', 1);
    val2 = fscanf(fin, '%f', 1);

    % se afiseaza clasamentul celor mai importante pagini
    for i = 1:n
        fprintf(fout, '%.f ', i);
        fprintf(fout, '%.f ', v(i));

        % se calculeaza si se afiseaza gradul de apartenenta al fiecarei pagini
        % la multimea paginilor importante
        value = Apartenenta(PR(i), val1, val2);
        fprintf(fout, '%f\n', value);
    end

    fclose(fout);
    fclose(fin);

endfunction
