function outImg = pencil(inImg, varargin)
    grayImg = rgb2gray(inImg);
    
    if nargin == 1
        h2 = [1 1  1  1 1 1; 
              1 1  1  1 1 1;
              1 1 -8 -8 1 1;
              1 1 -8 -8 1 1;
              1 1  1  1 1 1;
              1 1  1  1 1 1];
    elseif nargin == 2
        if strcmp(varargin{1}, 'light')
            h2 = [1  1 1;
                  1 -8 1;
                  1  1 1];
        elseif strcmp(varargin{1}, 'dark')
            h2 = [1 1  1  1 1 1; 
                  1 1  1  1 1 1;
                  1 1 -8 -8 1 1;
                  1 1 -8 -8 1 1;
                  1 1  1  1 1 1;
                  1 1  1  1 1 1];
        else
            h2 = varargin{1};
        end
    else
        error('Invalid arguments provided for Pencil effect.');
    end
    
    outImg = 255 - imfilter(grayImg, h2, 'conv');
end
