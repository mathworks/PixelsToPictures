function outImg = edgeeffect(inImg, varargin)
    if nargin == 3
        type = varargin{1};
        threshold = varargin{2};
    elseif nargin == 2
        type = varargin{1};
        threshold = [];
    elseif nargin == 1
        type = 'sobel';
        threshold = [];
    else
        error('Invalid arguments provided for edge effect.');
    end
    
    if size(inImg, 3) == 3
        inImg = rgb2gray(inImg);
    end
    
    outImg = edge(inImg, type, threshold);
end