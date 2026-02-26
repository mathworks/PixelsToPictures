function outImg = neon(inImg, varargin)
    if nargin == 1
        se = strel('disk', 5);
    elseif nargin == 2
        if isa(varargin{1}, 'double')
            se = strel('disk', varargin{1});
        elseif isa(varargin{1}, 'strel')
            se = varargin{1};
        else
            error('Invalid arguments provided for gradient effect.');
        end
    else
        error('Invalid arguments provided for gradient effect.');
    end

    outImg = imsubtract(imdilate(inImg, se), imerode(inImg, se));
end
