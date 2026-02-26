function im = superImpose(im,overlay,loc)

% Define: loc = [0 0] as upper left pixel of main image
loc = round(loc); % ensure locations are integers
si = size(im);

% If necessary, crop overlay image to remain inside main image
do = si(1:2) - loc; % allowable dimensions of overlay image
if (loc(1) < 0)
    overlay = overlay((1-loc(1)):end,:,:);
    loc(1) = 0;
end
if (loc(2) < 0)
    overlay = overlay(:,(1-loc(2)):end,:,:);
    loc(2) = 0;
end
so = size(overlay);
if (so(1) > do(1))
    overlay = overlay(1:do(1),:,:);
    so = size(overlay);
end
if (so(2) > do(2))
    overlay = overlay(:,1:do(2),:,:);
    so = size(overlay);
end

% Get row and column subscripts for overlay image
ro = repmat((1:so(1))',1,so(2));
co = repmat((1:so(2)),so(1),1);

% Only keep non-empty (non-black) pixels
idx = any(overlay,3);
ro = repmat(ro(idx(:)),3,1); % replicate for each page
co = repmat(co(idx(:)),3,1); % replicate for each page

% Get row and column subscripts for main image
ri = loc(1) + ro;
ci = loc(2) + co;

% Set page indices (same for overlay and main image)
pg = ones(nnz(idx),1)*(1:3);
pg = pg(:); % reshape into column to match ro,co and ri,ci

% Convert subscripts to linear indices
ido = sub2ind(so,ro,co,pg);
idi = sub2ind(si,ri,ci,pg);

% Overwrite portion of image with overlay
im(idi) = overlay(ido);

end
