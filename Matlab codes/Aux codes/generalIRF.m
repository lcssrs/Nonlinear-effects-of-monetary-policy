function [genirf] = generalIRF(wold, K, scaling)

% Function to compute the point estimate of the IRF of a VAR identified
% using Cholesky

% Inputs:   wold    = (N x N x horizon +1) array of Wold IRFs
%           K       = N x N Decomposition matrix including the restrictions
%           scaling = 2 x 1 vector where the first argument is the variable
%                     to be used for scaleing and the second is the shock size

% Outputs:  chol = N x N x horizon + 1 array of Cholesky identified IRFs

[N,~, horizon] = size(wold);
genirf = zeros(N,N,horizon);

for h=1:horizon
    
    genirf(:,:,h) = wold(:,:,h) * K;
    
end

if nargin > 2
    genirf = genirf ./ (genirf(scaling(1),scaling(1),1) * 1/scaling(2));
end

end