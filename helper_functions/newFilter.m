
function new = newFilter(row, col,color)
    new = uint8(zeros(row, col,3));
    new(:,:,1) = new(:,:,1) + color(1);
    new(:,:,2) = new(:,:,2) + color(2);
    new(:,:,3) = new(:,:,3) + color(3);
end