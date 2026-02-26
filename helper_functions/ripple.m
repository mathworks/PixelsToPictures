function outImg = ripple(inImg, varargin)
    if nargin == 1
        intensity = 0;
    elseif nargin == 2
        intensity = varargin{1};
    else
        error('Invalid arguments provided for Ripple effect.');
    end

    imRipple = imread('ripple.png'); % Ensure ripple.png is on the MATLAB path
    [r, c, ~] = size(inImg);
    imRipple = imresize(imRipple, [r, c]);
    imRipple = imRipple - uint8(200 + intensity * 10);

    outImg = imadd(imRipple, inImg);
end