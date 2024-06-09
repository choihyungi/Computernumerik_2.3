function fig = plotall(mat_ys, xs, lgds, iover, ttl, xax, yax, lgd_pretext, filename)
    lgdi_max = length(lgds);
    fig = figure;
        hold on;
        for lgdi = 1: lgdi_max
            if iover == 'n'
                ys = mat_ys(:,lgdi);
            elseif iover == 'm'
                ys = mat_ys(lgdi,:);
            end
            txt = strcat(lgd_pretext, string(lgds(lgdi)));
            plot(xs, ys, '-o', DisplayName=txt);
            
        end
        title(ttl);
        xlabel(xax);
        ylabel(yax);
        legend;
        hold off;
        savefig(filename);
        close;
end