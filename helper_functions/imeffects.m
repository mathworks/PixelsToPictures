function outImg = imeffects(inImg, type, varargin)
    switch type
        case 'barrel'
            if nargin < 3
                outImg = barrel(inImg);
            else
                outImg = barrel(inImg, varargin{:});
            end
        case 'pincushion'
            if nargin < 3
                outImg = pincushion(inImg);
            else
                outImg = pincushion(inImg, varargin{:});
            end
        case 'wave'
            if nargin < 3
                outImg = wave(inImg);
            else
                outImg = wave(inImg, varargin{:});
            end
        case 'pencil'
            if nargin < 3
                outImg = pencil(inImg);
            else
                outImg = pencil(inImg, varargin{:});
            end
            outImg = repmat(outImg,[1,1,3]);
        case 'blur'
            if nargin < 4
                outImg = blur(inImg, varargin{1});
            else 
                outImg = blur(inImg, varargin{1}, varargin{2:end});
            end
        case 'neon'
            if nargin < 3
                outImg = neon(inImg);
            else
                outImg = neon(inImg, varargin{:});
            end
        case 'grayscale'
            outImg = grayscale(inImg);
            outImg = repmat(outImg,[1,1,3]);
        case 'edgeeffect'
            if nargin < 3
                outImg = edgeeffect(inImg);
            else
                outImg = edgeeffect(inImg, varargin{:});
            end
            outImg = uint8(repmat(outImg,[1,1,3]));
        case 'negative'
            outImg = negative(inImg);
        case 'sharpen'
            outImg = imsharpen(imsharpen(inImg));
        case 'ripple'
            if nargin < 3
                outImg = ripple(inImg);
            else
                outImg = ripple(inImg, varargin{:});
            end
        otherwise 
            error('%s is not a valid type of effect', type)
    end
end
