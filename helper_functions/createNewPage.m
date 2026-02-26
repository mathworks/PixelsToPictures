function I = createNewPage(row,col,rgb)
    if nargin < 3
        I = uint8(255*ones(row,col,3));
    else
        I(:,:,1) = uint8(rgb(1)*ones(row,col));
        I(:,:,2) = uint8(rgb(2)*ones(row,col));
        I(:,:,3) = uint8(rgb(3)*ones(row,col));
    end
end