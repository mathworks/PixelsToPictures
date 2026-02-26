function outImg = pincushion(inImg, varargin)
    if nargin < 2
        a = -0.000008;
    elseif nargin == 2 && isa(varargin{1}, 'double')
        a = varargin{1} * -1e-6;
    else
        error(['Either specify 1 argument, the input image,',...
               ' or specify 2 arguments: The image and the',...
               ' amplitude of cubic term.']);
    end

    [nrows, ncols, ~] = size(inImg);
    [xi, yi] = meshgrid(1:ncols, 1:nrows);
    imid = round(size(inImg, 2) / 2);
    xt = xi(:) - imid;
    yt = yi(:) - imid;
    [theta, r] = cart2pol(xt, yt);

    s = r + a * r.^3;
    [ut, vt] = pol2cart(theta, s);
    u = reshape(ut, size(xi)) + imid;
    v = reshape(vt, size(yi)) + imid;
    tmap_B = cat(3, u, v);

    resamp = makeresampler('linear', 'fill');
    outImg = tformarray(inImg, [], resamp, [2 1], [1 2], [], tmap_B, 0.3);
end