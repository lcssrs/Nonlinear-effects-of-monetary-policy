function [ynext, inext, yaux] = bootstrapVARIV(instrument,y,p,c,beta,residuals)

% Function to bootstrap a VAR using the resampling technique

% Inputs:   y           = TxN matrix of original data
%           p           = integer VAR lag order
%           c           = 1 if constant required
%           beta        = (Np+1 x N) matrix of estimated coefficients (Np x N) if
%                          no constant is included
%           residuals   = (T-p) x N matrix of OLS residuals from VAR(p)
%                          estimation

% Outputs:  ynext       = T x N matrix of bootstrapped time series
%           inext       = (T-p) vector of instruments

[T, N] = size(y);
yinit = y(1:p, :);

%
%iinit = instrument(1:p, 1);
Z = size(instrument,1);
%

if c==1
    const = beta(1,:);
    pi = beta(2:end,:);
else
    const = 0;  
    pi = beta;
end

%
%inext=zeros(Z,1);
%inext(1:p,1) = iinit;
%

yaux = zeros(T-p,1); %Array to store indexes
ynext=zeros(T,N);
ynext(1:p,:) = yinit;
yinit=reshape(flipud(yinit)',1,[]); % Initial data to feed into model.

%instrument(1:p)=[];
coun=0;
inext=[];
iex = randsample(T-p,T-p);

for i2=1:T-p
  %kappa = randi(T-p);  %Random selector index
  kappa = iex(i2);
  ynext(p+i2,:)= const + yinit*pi + residuals(kappa,:);  % Draw a random integer to jointly select from residuals
  
  yinit = reshape(flipud(ynext(i2+1:p+i2,:))',1,[]);  % New values to feed into model

  if kappa>(T-Z-p)
      coun = coun+1;
      inext(coun)=instrument(kappa-(T-Z-p));
      yaux(i2)=1;
  end
 
end


end