function outImg = blur(inImg, type, varargin)
    if nargin == 2
        se = strel('disk', 10);
    elseif nargin == 3
        if isa(varargin{1}, 'double')
            se = strel('disk', varargin{1});
        elseif isa(varargin{1}, 'strel')
            se = varargin{1};
        else 
            error('Invalid arguments provided for morphological effects.');
        end
    else
        error('Invalid arguments provided for morphological effects.');
    end
    
    if strcmp('open', type)
        outImg = imopen(inImg, se);
    elseif strcmp('close', type)
        outImg = imclose(inImg, se);
    elseif strcmp('dilate', type)
        outImg = imdilate(inImg, se);
    else
        error('Invalid type of transformation specified.');
    end
end
