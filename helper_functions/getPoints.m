function points = getPoints(in)
    Img = imshow(in);
    topLeft = ginput(1);
    x = floor(topLeft(2));
    y = floor(topLeft(1));
    points = [x, y];
    close(Img.Parent.Parent)
end
