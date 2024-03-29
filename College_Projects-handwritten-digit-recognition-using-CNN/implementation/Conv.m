function y = Conv(x,W)
% x - input tensor
% W - set of filters
[wrow, wcol, numFilters] = size(W);
[xrow, xcol, ~]          = size(x);

% y - output tensor
yrow = xrow - wrow + 1;
ycol = xcol - wcol + 1;

y = zeros(yrow, ycol, numFilters);

% convultion operation for each filter
for k = 1:numFilters
    filter = W(:,:,k);
    % rot90 - rotation
    % squeeze - remove any singleton dimentions from filer pre to rotation
    filter = rot90(squeeze(filter),2);
    y(:,:,k) = conv2(x, filter, 'valid');   
    end
end