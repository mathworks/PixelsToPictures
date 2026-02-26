function output = CaesarCipher(input)
output = [];
for k = 1:numel(input)
    if contains("ABCDEFGHIJKLMNOPQRSTUVW",input(k),'IgnoreCase',true)
        out = char(input(k) + 3);
    elseif strcmpi(input(k),'X')
        out = char(input(k) - 23);
    elseif strcmpi(input(k),'Y')
        out = char(input(k) - 23);
    elseif strcmpi(input(k),'Z')
        out = char(input(k) - 23);
    else
        out = input(k);
    end
    
    output = [output out]; 
end
end
