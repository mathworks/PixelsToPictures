function out = writetext(I,message,fontsize,rgb,pos)

    if nargin < 5
        pos = getPoints(I);
    end
    if nargin <3
        rgb = [0 0 0];
        fontsize = 40;
    end
    if nargin < 4
        rgb = [0 0 0];
    end
    if isempty(fontsize)
        fontsize = 40;
    end
    if isempty(rgb)
        rgb = [0 0 0];
    end
    
    sz = size(I);
    
    out = insertText(I,[pos(2),pos(1)],message,'FontSize',fontsize,'TextColor',rgb,'BoxOpacity',0);

end