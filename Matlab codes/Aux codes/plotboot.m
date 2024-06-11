function plotboot(n, T, irfs, lowers, uppers, varnames, shocknames,l)

    indx = 0;
    for i=1:n
        for j=1:n
            indx=indx+1;
            subplot(n,n,(indx));
            plot(squeeze(irfs(i,j,1:T)), 'b', 'LineWidth', 1)
            hold on
            if nargin > 5
                plot(squeeze(lowers(i,j,1:T)), 'r', 'LineWidth', .5)
                plot(squeeze(uppers(i,j,1:T)), 'r', 'LineWidth', .5)
            end
            if (nargin>5 && j==1); ylabel(shocknames{i}); end
            yline(0,'--k')
            hold off
            if (nargin> 5 && i==1) ; title(varnames{j}); end
        end
    end

end