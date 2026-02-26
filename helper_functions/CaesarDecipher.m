function output = CaesarDecipher(input)
output = [];
for k = 1:numel(input)
    if contains("DEFGHIJKLMNOPQRSTUVWXYZ",input(k),'IgnoreCase',true)
        out = char(input(k) - 3);
    elseif strcmpi(input(k),'A')
        out = char(input(k) + 23);
    elseif strcmpi(input(k),'B')
        out = char(input(k) + 23);
    elseif strcmpi(input(k),'C')
        out = char(input(k) + 23);
    else
        out = input(k);
    end
    
    output = [output out]; 
end
end