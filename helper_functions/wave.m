function outImg = wave(inImg, varargin)
    % Apply a wave effect to an image with optional sinusoid amplitudes.

    % Default amplitudes for sinusoids
    a1 = 70;
    a2 = 25;

    % Parse optional arguments
    if nargin == 3 && isa(varargin{1}, 'double') && isa(varargin{2}, 'double')
        a1 = varargin{1};
        a2 = varargin{2};
    elseif nargin ~= 2
        error(['Specify either 1 argument (the image) or 3 arguments: ',...
               'the image and amplitudes of the sinusoids in x and y directions.']);
    end

    [nrows, ncols, ~] = size(inImg);
    [xi, yi] = meshgrid(1:ncols, 1:nrows);
    imid = round(size(inImg, 2) / 2);

    % Calculate the transformation maps
    u = xi + a1 * sin(pi * xi / imid);
    v = yi - a2 * sin(pi * yi / imid);
    tmap_B = cat(3, u, v);

    % Apply the transformation
    resamp = makeresampler('linear', 'fill');
    outImg = tformarray(inImg, [], resamp, [2 1], [1 2], [], tmap_B, 0.3);
end