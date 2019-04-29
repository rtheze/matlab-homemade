
function  [xycorr, lags] = xcov2(x, y, option1, option2)

%   XCOV2   Cross-covariance function estimates of 2D matrix element-wise.
%
%   XCOV2(A,B), where A is a length M vector and B is a NxM matrix, returns
%   the length 2*M-1 cross-covariance sequence between A and each row element 
%   of B in a NxM matrix.
%
%   see XCOV for details
%
%   Author: R. Th?z?, 29-04-2019


temp_data   = mat2cell(y, ones(size(y,1),1), [size(y,2)]);

if nargin == 2
    [xycorr,lags] = cellfun(@(a) xcov(a, x), temp_data, 'UniformOutput', ...
        false);
    
elseif nargin == 3
    [xycorr, lags] =  cellfun(@(a) xcov(a, x, option1), temp_data, ...
        'UniformOutput', false);
    
elseif nargin == 4
    [xycorr, lags] =  cellfun(@(a) xcov(a, x, option1, option2), ...
        temp_data, 'UniformOutput', false);
    
end


xycorr      = cell2mat(xycorr);
lags        = cell2mat(lags);