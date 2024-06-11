% function [response, upper, lower, boot_beta] = SVARIV(instrument,data,lags,c,initp,finalp,nboot1,horizon,prc,nboot2)
% 
% %Function to estimate responses and bootstrap in a SVARIV approach
% 
% %It should be guaranteed that last observation corresponds to the same
% %period of the instrument and the data
% 
% for k=1:5    
% 
%     n = size(data,2);
%     %j=52
%     inst = tabi(:,k);
% 
%     datapre = flipud([inst data1(49:end,:)]);
%     data = datapre(36:end,:);
% 
%     instrument = flipud(instrument);
%     data = flipud(data);
% 
%     [betivs, residivs] = VAR(data(initp:finalp,:),lags,c);
% 
%     coef = zeros(1,n);
% 
%     if size(instrument,1)>= size(residivs,1)
%         alpha = size(residivs,1);
%     else 
%         alpha = size(instrument,1);
%     end
% 
%     for v = 1:n
%         model = fitlm(instrument(1:alpha,1),residivs(1:alpha,v));
%         betiv = model.Coefficients{2,1};
%         coef(v) = betiv;
%     end
% 
%     coef = coef./coef(1);
% 
%     eirfs = woldirf(betivs,1,lags,horizon);
% 
%     auxiv = repmat(coef', [1 5 horizon+1]);
% 
%     ivirfs = eirfs.*auxiv;
% 
% 
%     [bootiv, upperiv, loweriv, boot_betaiv] = bootstrapSVARIV(instrument, data, lags, 1, betivs, residivs, nboot1, horizon+1, prc);
% 
% 
%     figure(gr3)
%     plotboot2(5,48,ivirfs, upperiv, loweriv, varnamesiv, shocknamesiv,k-1)
% 
% end
