function fig = plotall(mat_ys, xs, lgds, iover, ttl, xax, yax, lgd_pretext, filename)
%{
Status: complete
Task:
    plot a function of xs over all lgds
Parameter;
    mat_ys          2-dim array of y-values
    xs              array of values that will be on the x axis
    lgds            array of values that will be on legends
    iover           n or m will be iterated over, ys of xs
    xax             label of x-axis
    yax             label of y-axis
    lgd_pretext     pretext of legends
    filename        location to be saved
Return:
    void
%}
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