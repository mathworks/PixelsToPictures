function output = AtbashCipher(input)
n = length(input);

for k = 1:n
    if input(k) >= 65 && input(k) <= 77
        output(k) = 78 + (77 - input(k));
    elseif input(k) > 77 && input(k) <= 90
        output(k) = 77 - (input(k) - 78);
    elseif input(k) >= 97 && input(k) <= 109
        output(k) = 110 + (109 - input(k));
    elseif input(k) > 109 && input(k) <= 122
        output(k) = 109 - (input(k) - 110);
    else
        output(k) = input(k);
    end
    
end
output = char(output);
end