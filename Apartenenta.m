function y = Apartenenta(x, val1, val2)
    % conditie de continuitate in val1 : a * val1 + b = 0
    % conditie de continuitate in val2 : a * val2 + b = 1
    % rezolvarea sistemului format din cele  2 ecuatii
    a = double(1) / double(val2 - val1);
    b = double(val1) / double(val1 - val2);

    % se calculeaza y in functie
    % de intervalul caruia ii apartine x

    if (x >= 0 && x < val1)
        y = 0;
    endif

    if (x >= val1 && x <= val2)
        y = double(a * x) + b;
    endif

    if (x > val2 && x <= 1)
        y = 1;
    endif

endfunction
