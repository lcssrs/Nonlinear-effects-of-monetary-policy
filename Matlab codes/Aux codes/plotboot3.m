function plotboot3(n, T, irfs,l, lowers, uppers, varnames, shocknames)

    indx = 0;
    for i=1:n
        for j=1
            indx=indx+1;
            subplot(6,n,(indx+(l-1)*n));
            plot(squeeze(irfs(i,1:T)), 'b', 'LineWidth', 1)
            hold on
            if nargin > 5
                plot(squeeze(lowers(i,1:T)), 'r', 'LineWidth', .5)
                plot(squeeze(uppers(i,1:T)), 'r', 'LineWidth', .5)
            end
            if (nargin>6 && j==1); ylabel(shocknames{i}); end
            yline(0,'--k')
            hold off
            if (nargin> 6 && i==1) ; title(varnames{j}); end
        end
    end

end